using NetCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models.Content
{
    /// <summary>
    /// 举报信息
    /// </summary>
    public class TableOutputReportInfo
    {
        /// <summary>
        /// 举报信息列表
        /// </summary>
        public List<OutPutContentInfoItem> ReportList { get; set; }
        /// <summary>
        /// 分页
        /// </summary>
        public PageInfo Page { get; set; }
        /// <summary>
        /// 审核状态列表
        /// </summary>
        public List<TypeForName<int, string>> ExamineList { get; set; }
    }

}
