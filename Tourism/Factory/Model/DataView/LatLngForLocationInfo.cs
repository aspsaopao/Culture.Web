using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.Factory.Model.DataView
{
    /// <summary>
    /// 经纬度地理信息
    /// </summary>
    public class LatLngForLocationInfo : LatLng
    {

        /// <summary>
        /// 信息
        /// </summary>
        public string Info { get; set; }
    }
}
