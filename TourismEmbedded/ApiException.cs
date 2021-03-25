using NetCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace TourismEmbedded
{
    /// <summary>
    /// 异常工具
    /// </summary>
    public static class ExceptionTool
    {

        private static AjaxInfo FindInnerException(Exception exception)
        {
            var apiException = exception as ApiException;
            if (!apiException.IsNull())
                return apiException.AjaxInfo;
            if (exception.InnerException != null)
                return FindInnerException(exception.InnerException);
            else
            {
                if (exception is SocketException)
                    return new AjaxInfo
                    {
                        IsSuccess = false,
                        Code = (exception as SocketException).ErrorCode,
                        Message = exception.Message
                    };
                return NewMethod(exception);
            }
        }

        private static AjaxInfo NewMethod(Exception exception)
        {
            return new AjaxInfo
            {
                IsSuccess = false,
                Message = exception.Message
            };
        }

        /// <summary>
        /// 获取ajaxinfo
        /// </summary>
        /// <param name="task">任务</param>
        /// <returns></returns>
        public static AjaxInfo GetAjaxInfo(this Task task)
        {
            AjaxInfo ajaxInfo = null;
            if (task.Status != TaskStatus.RanToCompletion)
            {
                if (task.Status == TaskStatus.Canceled)
                    ajaxInfo = new AjaxInfo
                    {
                        IsSuccess = false,
                        Message = "连接超时!"
                    };
                else
                {
                    if (task.Exception.IsNull())
                        ajaxInfo = new AjaxInfo
                        {
                            IsSuccess = false,
                            Message = "找不到错误!"
                        };
                    else
                    {
                        if (task.Exception.InnerException != null)
                            ajaxInfo = FindInnerException(task.Exception.InnerException);
                        else
                            ajaxInfo = new AjaxInfo
                            {
                                IsSuccess = false,
                                Message = task.Exception.Message
                            };
                    }
                }
            }
            return ajaxInfo;
        }
    }

    /// <summary>
    /// api异常
    /// </summary>
    public class ApiException : Exception
    {
        /// <summary>
        /// 400请求
        /// </summary>
        public class RequestBad
        {
            /// <summary>
            /// 错误列表
            /// </summary>
            public Dictionary<string, string[]> Errors { get; set; }

            /// <summary>
            /// 类型
            /// </summary>
            public string Type { get; set; }

            /// <summary>
            /// 标题
            /// </summary>
            public string Title { get; set; }

            /// <summary>
            /// 状态
            /// </summary>
            public int Status { get; set; }

            /// <summary>
            /// 追踪id
            /// </summary>
            public string TraceId { get; set; }
        }

        /// <summary>
        /// 
        /// </summary>
        public int StatusCode { get; private set; }

        /// <summary>
        /// 
        /// </summary>
        public string Response { get; private set; }

        /// <summary>
        /// 
        /// </summary>
        public IReadOnlyDictionary<string, IEnumerable<string>> Headers { get; private set; }

        /// <summary>
        /// api异常解析结果
        /// </summary>
        public AjaxInfo AjaxInfo { get; }

        /// <summary>
        /// api异常
        /// </summary>
        /// <param name="message">消息</param>
        /// <param name="statusCode">状态码</param>
        /// <param name="response">响应数据</param>
        /// <param name="headers">头</param>
        /// <param name="innerException"></param>
        public ApiException(
            string message,
            int statusCode,
            string response,
            IReadOnlyDictionary<string, IEnumerable<string>> headers,
            Exception innerException)
            : base(message + "\n\nStatus: " + statusCode + "\nResponse: \n" + response.Substring(0, response.Length >= 512 ? 512 : response.Length), innerException)
        {
            StatusCode = statusCode;
            Response = response;
            Headers = headers;
            if (statusCode == 400)
            {
                string[] msg = null;
                var bad = JsonConvert.DeserializeObject<RequestBad>(Response);
                if (bad != null)
                {
                    if (bad.Errors != null)
                    {
                        foreach (var dic in bad.Errors)
                        {
                            msg = dic.Value;
                            break;
                        }
                    }
                }
                if (msg != null)
                    AjaxInfo = new AjaxInfo
                    {
                        IsSuccess = false,
                        Code = -1,
                        Message = msg.Length > 0 ? msg[0] : ""
                    };
            }
            else
            {
                try
                {
                    AjaxInfo = JsonConvert.DeserializeObject<AjaxInfo>(Response);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return string.Format("HTTP Response: \n\n{0}\n\n{1}", Response, base.ToString());
        }
    }

    /// <summary>
    /// api异常
    /// </summary>
    /// <typeparam name="TResult"></typeparam>
    public class ApiException<TResult> : ApiException
    {
        /// <summary>
        /// 
        /// </summary>
        public TResult Result { get; private set; }

        /// <summary>
        /// api异常
        /// </summary>
        /// <param name="message">消息</param>
        /// <param name="statusCode">状态码</param>
        /// <param name="response">响应数据</param>
        /// <param name="headers">头</param>
        /// <param name="innerException"></param>
        /// <param name="result">结果</param>
        public ApiException(string message, int statusCode, string response, IReadOnlyDictionary<string, IEnumerable<string>> headers, TResult result, System.Exception innerException)
            : base(message, statusCode, response, headers, innerException)
        {
            Result = result;
        }
    }
}
