using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace TourismEmbedded
{

    /// <summary>
    /// 进度
    /// </summary>
    public class ProgressContent : HttpContent
    {
        Stream _content;
        readonly long _cacheBufferLength = 0;
        long _start = 0;
        long _length = 0;
        /// <summary>
        /// 进度
        /// </summary>
        /// <param name="content">传入流</param>
        /// <param name="cacheBufferLength">缓存buffer长度(单位KB)</param>
        public ProgressContent(Stream content, long cacheBufferLength = 80)
        {
            _content = content;
            _cacheBufferLength = cacheBufferLength;
            if (content.CanSeek)
                _start = content.Position;
        }

        /// <summary>
        /// 读取流
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        protected override async Task SerializeToStreamAsync(Stream stream, TransportContext context)
        {
            if (_content.CanSeek)
                _content.Position = _start;
            else
                throw new InvalidOperationException("流操作失效!");
            byte[] cacheBuffer = new byte[_cacheBufferLength * 1024];
            int lengthOfReaded = await _content.ReadAsync(cacheBuffer, 0, cacheBuffer.Length);
            int readed = 0;
            while (lengthOfReaded > 0)
            {
                await stream.WriteAsync(cacheBuffer, 0, lengthOfReaded);
                readed += lengthOfReaded;
                Progress?.Invoke(this, new EventArgsOfProgressContent(_length, readed));
                lengthOfReaded = await _content.ReadAsync(cacheBuffer, 0, cacheBuffer.Length);
            }
        }

        /// <summary>
        /// 进度事件
        /// </summary>
        public event Action<ProgressContent, EventArgsOfProgressContent> Progress;

        /// <summary>
        /// 释放资源
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            if (disposing)
            {
                _content.DisposeEx();
                _content = null;
            }
        }

        /// <summary>
        /// 计算长度
        /// </summary>
        /// <param name="length">返回长度</param>
        /// <returns></returns>
        protected override bool TryComputeLength(out long length)
        {
            length = 0;
            _length = 0;
            if (_content.IsNull())
                return false;
            if (_content.CanSeek)
            {
                length = _content.Length - _start;
                _length = length;
                return true;
            }
            else
            {
                length = 0;
                _length = 0;
                return false;
            }
        }
    }
}
