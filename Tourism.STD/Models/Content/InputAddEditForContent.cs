using NetCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models.Content
{
    /// <summary>
    /// 添加修改内容
    /// </summary>
    public class InputAddEditForContent
    { /// <summary>
      /// 活动id
      /// </summary>
        public string Aid { get; set; }
        /// <summary>
        /// 活动主题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 活动宣传图
        /// </summary>
        public TempFileInfo HeadImage { get; set; }
        /// <summary>
        /// 活动详情
        /// </summary>
        public string Details { get; set; }
        /// <summary>
        /// 介绍
        /// </summary>
        public string Introduce { get; set; }
    }
}
