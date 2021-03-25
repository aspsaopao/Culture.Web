using NetCore;
using NetCore.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.Factory.GenerateImage
{
    /// <summary>
    /// 分享图片接口
    /// </summary>
    public interface IShareImage
    {
        /// <summary>
        /// 保存文件并返回文件名
        /// </summary>
        /// <param name="inputFileName">输入文件名</param>
        /// <param name="shareInfo">分享目录</param>
        /// <param name="output">输出文件信息</param>
        /// <returns></returns>
        bool Save(
            IDir shareInfo,
            string inputFileName,
            out TempFileInfo output);
    }
}
