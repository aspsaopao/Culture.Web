using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace TourismEmbedded
{
    /// <summary>
    /// api扩展
    /// </summary>
    public interface IApiEx
    {
        /// <summary>
        /// 创建请求信息
        /// </summary>
        /// <param name="cancellationToken">token</param>
        /// <param name="httpRequestMessage">http请求</param>
        /// <returns></returns>
        Task CreateHttpRequestMessageAsync(HttpRequestMessage httpRequestMessage, CancellationToken cancellationToken);

        /// <summary>
        /// 更新json配置
        /// </summary>
        /// <param name="settings">配置</param>
        void UpdateJsonSerializerSettings(Newtonsoft.Json.JsonSerializerSettings settings);
    }
}
