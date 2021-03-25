using NetCore;
using System;
using System.Collections.Generic;

namespace Tourism.STD.Tool
{
    /// <summary>
    /// 通用工具类
    /// </summary>
    public class Tool
    {
  

        private const double EARTH_radIUS = 6378137;
        /// <summary>
        /// 计算两个坐标点之间的距离 米
        /// </summary>
        /// <param name="lat">维度</param>
        /// <param name="lng">经度</param>
        /// <param name="latterLat">后者维度</param>
        /// <param name="latterLng">后者经度</param>
        /// <returns></returns>
        public static double Distance(
            double lat,
            double lng,
            double latterLat,
            double latterLng
            )
        {
            double radLat1 = Rad(lat);
            double radLng1 = Rad(lng);
            double radLat2 = Rad(latterLat);
            double radLng2 = Rad(latterLng);
            double a = radLat1 - radLat2;
            double b = radLng1 - radLng2;
            double result = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) + Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2))) * EARTH_radIUS;
            return result;
        }
        /// <summary>
        /// 幅度转换
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        private static double Rad(double d)
        {
            return (double)d * Math.PI / 180d;
        }
    }
}
