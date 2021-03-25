using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using NetCore.Command;

namespace Culture.Factory
{

    /// <summary>
    /// 远程工具
    /// </summary>
    public static class RemoteTool
    {

        /// <summary>
        /// 拉取远程图片
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="remoteUrl">远程地址集合</param>
        /// <param name="serviceProvider">依赖注入</param>
        /// <param name="func">回调函数</param>
        /// <param name="httpClientKey">客户端键</param>
        /// <returns></returns>
        public static async Task<List<RemoteImageInfo<T>>> PullRemoteImage<T>(
            this IEnumerable<string> remoteUrl,
            IServiceProvider serviceProvider,
            string httpClientKey,
            Func<string, Task<T>> func) where T : class, IDir
        {
            var httpClient = serviceProvider.GetService<IHttpClientFactory>().CreateClient(httpClientKey);
            return await PullRemoteImage(
                remoteUrl,
                httpClient,
                func);
        }

        /// <summary>
        /// 拉取远程图片
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="remoteUrl">远程地址集合</param>
        /// <param name="serviceProvider">依赖注入</param>
        /// <param name="func">回调函数</param>
        /// <returns></returns>
        public static async Task<List<RemoteImageInfo<T>>> PullRemoteImage<T>(
            this IEnumerable<string> remoteUrl,
            IServiceProvider serviceProvider,
            Func<string, Task<T>> func) where T : class, IDir
        {
            return await PullRemoteImage(remoteUrl, serviceProvider, Macro.HTTPCLIENT_IMAGE, func);
        }

        /// <summary>
        /// 拉取远程图片
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="remoteUrl">远程地址集合</param>
        /// <param name="httpClient">客户端</param>
        /// <param name="func">回调函数</param>
        /// <returns></returns>
        public static async Task<List<RemoteImageInfo<T>>> PullRemoteImage<T>(
            this IEnumerable<string> remoteUrl,
            HttpClient httpClient,
            Func<string, Task<T>> func) where T : class, IDir
        {
            if (remoteUrl.IsNull())
                return new List<RemoteImageInfo<T>>();
            var outList = await Task.WhenAll(remoteUrl.Select(async path =>
             {
                 if (path.IsNullOrEmpty())
                     return null;
                 using var requestMsg = new HttpRequestMessage(
                     HttpMethod.Get,
                     path);
                 var response = await httpClient.SendAsync(requestMsg);
                 var contentType = response.Content.Headers.ContentType;
                 string ext = "";
                 if (contentType.MediaType.ToLower() == "image/jpeg")
                     ext = ".jpg";
                 else
                     ext = ".png";
                 var filename = $"{Guid.NewGuid()}{ext}";
                 using var readStream = await response.Content.ReadAsStreamAsync();
                 var dir = await func(filename);
                 var filepath = dir.GetUpFilePathWithSystem(filename);
                 FileInfo fileInfo = new FileInfo(filepath);
                 using var fileStream = fileInfo.Create();
                 byte[] buffer = new byte[10240];
                 int readlen = 0;
                 do
                 {
                     readlen = await readStream.ReadAsync(buffer, 0, buffer.Length);
                     if (readlen == 0)
                         break;
                     await fileStream.WriteAsync(buffer, 0, readlen);
                 } while (readlen != 0);
                 return new RemoteImageInfo<T>
                 {
                     FileName = filename,
                     Info = dir
                 };
             }));
            var result = from R in outList where !R.IsNull() select R;
            return result.ToList();
        }
    }
}
