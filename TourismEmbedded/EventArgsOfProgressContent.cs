using System;

namespace TourismEmbedded
{
    /// <summary>
    /// 事件参数
    /// </summary>
    public class EventArgsOfProgressContent : EventArgs
    {
        /// <summary>
        /// 事件参数
        /// </summary>
        /// <param name="length">总长度</param>
        /// <param name="uploaded">已上传长度</param>
        public EventArgsOfProgressContent(long length, long uploaded)
        {
            Length = length;
            Uploaded = uploaded;
        }

        /// <summary>
        /// 上传进度,0-1小数
        /// </summary>
        public float Progress
        {
            get
            {
                if (Length == 0)
                    return 0;
                return (float)Uploaded / Length;
            }
        }

        /// <summary>
        /// 总长度
        /// </summary>
        public long Length { get; }

        /// <summary>
        /// 已上传长度
        /// </summary>
        public long Uploaded { get; }
    }
}
