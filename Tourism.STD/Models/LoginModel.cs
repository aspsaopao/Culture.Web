using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models
{
    /// <summary>
    /// 登录模型
    /// </summary>
    public class LoginModel
    {
        /// <summary>
        /// 是否登录0:非登录,1:登录
        /// </summary>
        public int IsLogin { get; set; } = 0;

        /// <summary>
        /// 登录用户id
        /// </summary>
        public string UId { get; set; }

        /// <summary>
        /// 登录人名字
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// debug描述
        /// </summary>
        public string Remark { get; set; }
    }
}
