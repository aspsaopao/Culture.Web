using NetCore.Command.ExceptionEx;
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace Culture.ExceptionEx
{
    /// <summary>
    /// 地理信息异常
    /// </summary>
    public class LocationException : BaseException
    {
        /// <summary>
        /// 地理信息异常
        /// </summary>
        public LocationException()
        {
            ErrorCode = 10006;
        }

        /// <summary>
        /// 地理信息异常
        /// </summary>
        /// <param name="message"></param>
        public LocationException(string message) : base(message)
        {
            ErrorCode = 10006;
        }

        /// <summary>
        /// 地理信息异常
        /// </summary>
        /// <param name="message"></param>
        /// <param name="innerException"></param>
        public LocationException(string message, Exception innerException) : base(message, innerException)
        {
            ErrorCode = 10006;
        }

        /// <summary>
        /// 地理信息异常
        /// </summary>
        /// <param name="info"></param>
        /// <param name="context"></param>
        protected LocationException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
            ErrorCode = 10006;
        }

        /// <summary>
        /// 额外数据
        /// </summary>
        public object DataEx { get; set; }
    }
}
