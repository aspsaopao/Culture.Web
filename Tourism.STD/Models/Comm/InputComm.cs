using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Culture.STD.Comm
{
    /// <summary>
    /// 评论传入模型
    /// </summary>
    public class InputComm
    {
        /// <summary>
        /// 内容id
        /// </summary>
        public string ContentId { get; set; }
        /// <summary>
        /// 评论文本信息
        /// </summary>
        public string Content { get; set; }

    }
}
