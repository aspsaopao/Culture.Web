using NetCore.Command;

namespace Culture.Factory
{
    /// <summary>
    /// 远程图片信息
    /// </summary>
    public class RemoteImageInfo<T> where T:IDir
    {
        /// <summary>
        /// 文件名称
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 回调信息
        /// </summary>
        public T Info { get; set; }
    }
}
