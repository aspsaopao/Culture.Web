using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TourismEmbedded
{
    /// <summary>
    /// 文件信息,传入的流请自行释放
    /// </summary>
    public class FileParameter
    {

        /// <summary>
        /// 文件信息,传入的流请自行释放
        /// </summary>
        /// <param name="stream">流</param>
        public FileParameter(Stream stream)
        {
            Data = stream;
        }

        /// <summary>
        /// 内容类型
        /// </summary>
        public string ContentType { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 流数据
        /// </summary>
        public Stream Data { get; }
    }
}
