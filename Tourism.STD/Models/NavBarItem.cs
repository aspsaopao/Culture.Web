using NetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Culture.STD.Models
{
    /// <summary>
    /// 菜单结构
    /// </summary>
    public class NavBarItem : NavBarDataBase<NavBarItem>
    {
        /// <summary>
        /// 图标
        /// </summary>
        public string Icon { get; set; }
    }
}
