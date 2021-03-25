using NetCore.Command.ExceptionEx;
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace Culture.ExceptionEx
{
    /// <summary>
    /// 微信异常
    /// </summary>
    public class WxException : BaseException
    {
        /// <summary>
        /// 微信异常
        /// </summary>
        public WxException()
        {
            ErrorCode = 30001;
        }

        /// <summary>
        /// 微信异常
        /// </summary>
        /// <param name="message"></param>
        public WxException(string message) : base(message)
        {
            ErrorCode = 30001;
        }

        /// <summary>
        /// 微信异常
        /// </summary>
        /// <param name="message"></param>
        /// <param name="innerException"></param>
        public WxException(string message, Exception innerException) : base(message, innerException)
        {
            ErrorCode = 30001;
        }

        /// <summary>
        /// 微信异常
        /// </summary>
        /// <param name="info"></param>
        /// <param name="context"></param>
        protected WxException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
            ErrorCode = 30001;
        }

        /// <summary>
        /// 相应头
        /// </summary>
        public Dictionary<string, string> Header { get; set; }
    }
}
