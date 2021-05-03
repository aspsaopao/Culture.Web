using NetCore;
using NetCore.Data.Mem;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Text;
using System.Threading.Tasks;

namespace Culture.BusyData
{
    /// <summary>
    /// 数据层操作
    /// </summary>
    [MemManager(typeof(Common))]
    public class Common : NetCore.Data.Common
    {
        private NetCore.BusyData.Common common;
        /// <summary>
        /// 构造
        /// </summary>
        public Common(IServiceProvider serviceProvider) :
            base(serviceProvider, "CL_", "SV_CL_")
        {
            common = new NetCore.BusyData.Common(serviceProvider);
        }

        /// <summary>
        /// 父系前缀
        /// </summary>
        public override string PrefixForParent
        {
            get
            {
                return common.Prefix;
            }
        }

        /// <summary>
        /// 父系视图前缀
        /// </summary>
        public override string PrefixViewForParent
        {
            get
            {
                return common.PrefixView;
            }
        }
    }
}
