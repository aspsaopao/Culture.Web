using System;
using System.Reflection;

namespace TourismEmbedded
{
    /// <summary>
    /// 客户端进度
    /// </summary>
    public class EventArgsOfClientProgress : EventArgs
    {
        /// <summary>
        /// 客户端进度
        /// </summary>
        /// <param name="methodBase"></param>
        /// <param name="eventArgsOfProgressContent"></param>
        /// <param name="paramName">参数名</param>
        public EventArgsOfClientProgress(
            string paramName,
            MethodBase methodBase,
            EventArgsOfProgressContent eventArgsOfProgressContent)
        {
            ParamName = paramName;
            MethodBase = methodBase;
            EventArgsOfProgressContent = eventArgsOfProgressContent;
        }

        /// <summary>
        /// 方法信息
        /// </summary>
        public MethodBase MethodBase { get; }

        /// <summary>
        /// 参数名
        /// </summary>
        public string ParamName { get; }

        /// <summary>
        /// 进度参数
        /// </summary>
        public EventArgsOfProgressContent EventArgsOfProgressContent { get; }
    }
}
