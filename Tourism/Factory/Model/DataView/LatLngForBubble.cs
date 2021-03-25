using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.Factory.Model.DataView
{
    /// <summary>
    /// 地理信息气泡数据信息
    /// </summary>
    public class LatLngForBubble : LatLng
    {
        /// <summary>
        /// 类型
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 值
        /// </summary>
        public int Value { get; set; }
    }
}
