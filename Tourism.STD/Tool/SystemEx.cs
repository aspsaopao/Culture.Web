using NetCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Tourism.STD.Tool
{
    /// <summary>
    /// 扩展函数
    /// </summary>
    public static class SystemEx
    {
        /// <summary>
        /// 元转分
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static long ConvertToCents(this string v)
        {
            return (long)(v.ToDouble() * 100);
        }

        /// <summary>
        /// 转成Int32
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static int ConvertToInt32(this long v)
        {
            return Convert.ToInt32(v);
        }

        /// <summary>
        /// 转成Int32
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static int ConvertToInt32(this short v)
        {
            return Convert.ToInt32(v);
        }
        /// <summary>
        /// 分转元字符串
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static double ConvertToYuan(this long v)
        {
            return (double)v / 100;
        }
        /// <summary>
        /// 分转元字符串
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static long ConvertToYuanLong(this long v)
        {
            return  v / 100;
        }
        /// <summary>
        /// 分转元字符串
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static string ConvertToYuanString(this long v)
        {
            double yuan = (double)v / 100;
            return yuan.ToString();
        }
        /// <summary>
        /// 数字转换距离(m的基准)
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static string ConvertToDistance(this int v)
        {
            if (v < 1000)
                return v.ToString()+"m";
            else
                return v.ToString()[0..^4] +"km";
        }

        /// <summary>
        /// 数字转换距离(m的基准)
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static string ConvertToDistance(this long v)
        {
            if (v < 1000)
                return $"{v}m";
            else
                return $"{v/1000}km";
        }
        /// <summary>
        /// 数字转距离(m的基准)
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static string ConvertToDistance(this double v)
        {
            if (v < 1000)
                return $"{Math.Round(v,0)}m";
            else
                return $"{Math.Round(v / 1000, 1, MidpointRounding.AwayFromZero)}km";
        }

        /// <summary>
        /// 小时转天
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static string ConvertToDay(this long v)
        {
            return $"{Math.Ceiling(((double)v/24))}日";
        }

        /// <summary>
        /// 集合转字符串、拼接
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static string ConvertToString(this List<string> v)
        {
            var name = "";
            foreach (var item in v)
            {
                if (name.Length >0)
                    name += $"·{item}";
                else
                    name += $"{item}";
            }
            return name;
        }
    }
}
