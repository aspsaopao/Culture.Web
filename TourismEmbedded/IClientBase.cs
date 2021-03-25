using System;
using System.Collections.Generic;
using System.Text;

namespace TourismEmbedded
{
    /// <summary>
    /// 客户端api
    /// </summary>
    public interface IClientBase
    {
        /// <summary>
        /// api扩展
        /// </summary>
        IApiEx ApiEx { get; set; }
    }
}
