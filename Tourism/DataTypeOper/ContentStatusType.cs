using NetCore.DataTypeOper;
using System;
using System.Collections.Generic;
using System.Text;

namespace Tourism.DataTypeOper
{
   
    /// <summary>
    /// 文章审核状态
    /// </summary>
    public class ContentStatusType : DataTypeOperBase
    {
        /// <summary>
        /// 初始化
        /// </summary>
        public override void Init()
        {
            Data(0, "待审核");
            Data(1, "通过");
            Data(2, "拒绝");
        }
    }
}
