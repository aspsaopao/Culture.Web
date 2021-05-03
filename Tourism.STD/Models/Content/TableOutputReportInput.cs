using NetCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models.Content
{
    /// <summary>
    /// 举报参数
    /// </summary>
    public class TableOutputReportInput
    {
        /// <summary>
        /// 分页信息
        /// </summary>
        public PageInfo PageInfo { get; set; }
        /// <summary>
        /// 状态
        /// </summary>
        public int Status { get; set; }
    }
}
