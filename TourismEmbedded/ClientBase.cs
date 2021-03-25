using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Tourism.STD;

namespace TourismEmbedded
{

    /// <summary>
    /// 客户端基类
    /// </summary>
    public class ClientBase : IClientBase
    {
        /// <summary>
        /// api扩展
        /// </summary>
        public IApiEx ApiEx { get; set; }

        /// <summary>
        /// 进度读取缓存数据长度
        /// </summary>
        public long CacheBufferLengthForProgress { get; set; } = 80;

        /// <summary>
        /// 更新json转换配置
        /// </summary>
        /// <param name="jsonSerializerSettings">配置项</param>
        protected void UpdateJsonSerializerSettings(JsonSerializerSettings jsonSerializerSettings)
        {
            if (ApiEx.IsNull())
                return;
            ApiEx.UpdateJsonSerializerSettings(jsonSerializerSettings);
        }

        /// <summary>
        /// 创建请求信息
        /// </summary>
        /// <param name="cancellationToken"></param>
        /// <returns></returns>
        protected async Task<HttpRequestMessage> CreateHttpRequestMessageAsync(CancellationToken cancellationToken)
        {
            var httpReqMsg = new HttpRequestMessage();
            if (!ApiEx.IsNull())
                await ApiEx.CreateHttpRequestMessageAsync(httpReqMsg, cancellationToken);
            var ver = GetType().Assembly.GetName().Version;
            httpReqMsg.Headers.Add("clientver", ver.ToString());
            return await Task.FromResult(httpReqMsg);
        }

        /// <summary>
        /// 执行事件
        /// </summary>
        /// <param name="args"></param>
        protected void InvokeProgressEvent(EventArgsOfClientProgress args)
        {
            Progress?.Invoke(this, args);
        }

        /// <summary>
        /// 进度事件,该事件非ui线程,更新界面请在ui线程中
        /// </summary>
        public event EventHandler<EventArgsOfClientProgress> Progress;
    }
}
