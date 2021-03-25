using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using NetCore.Command.Components;
using Culture.Factory.Model.DataView;
using Culture.Web.FilterController;

namespace Culture.Web.Areas.DataView
{
    /// <summary>
    /// dataview控制器
    /// </summary>
    [Area("DataView")]
    [Route("DataView/[controller]/[action]")]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class IndexController : DataViewBaseController
    {

        private IDistributedCache DistributedCache { get; }

        /// <summary>
        /// dataview控制器
        /// </summary>
        /// <param name="distributedCache"></param>
        public IndexController(IDistributedCache distributedCache)
        {
            DistributedCache = distributedCache;
        }

        /// <summary>
        /// 游客统计
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<CountInfo> PullForCountInfoForTourist()
        {
            var model = PullForHistogramForTourist();
            float value = 0;
            foreach (var item in model)
            {
                value += item.Y;
            }
            return new List<CountInfo>
            {
                new CountInfo{
                    Value=(int)value
                }
            };
        }

        /// <summary>
        /// 游客统计,同比增长
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<CountInfo> PullForCountInfoForTouristAdd()
        {
            return new List<CountInfo>
            {
                new CountInfo{
                    Value=12.5f
                }
            };
        }

        /// <summary>
        /// 拉取版面中心统计数字
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<CountInfo> PullForCountInfoForCenter()
        {
            var model = new CountInfo
            {
                Value = GetRandomForInt(58850, 58900)
            };
            return new List<CountInfo>
            {
                model
            };
        }

        /// <summary>
        /// 拉取经纬度气泡
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<LatLngForBubble> PullForLatLngForBubble()
        {
            var listSrc = PullForLatLngForLocationInfo();
            List<LatLngForBubble> list = new List<LatLngForBubble>();
            foreach (var info in listSrc)
            {
                list.Add(new LatLngForBubble
                {
                    Lat = info.Lat,
                    Lng = info.Lng,
                    Type = 1,
                    Value = 1
                });
            }
            return list;
        }

        /// <summary>
        /// 地图地理信息列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<LatLngForLocationInfo> PullForLatLngForLocationInfo()
        {
            return new List<LatLngForLocationInfo>
            {
                new LatLngForLocationInfo{
                    Lat=25.983043,
                    Lng=105.66709,
                    Info="黄果树"
                },
                new LatLngForLocationInfo{
                    Lat=27.718346,
                    Lng=109.191555,
                    Info="梵净山"
                },
                new LatLngForLocationInfo{
                    Lat=26.381027,
                    Lng=108.079613,
                    Info="西江苗寨"
                },
                new LatLngForLocationInfo{
                    Lat=25.412239,
                    Lng=107.8838,
                    Info="小七孔"
                },
                new LatLngForLocationInfo{
                    Lat=26.668497,
                    Lng=105.768997,
                    Info="织金洞"
                },
                new LatLngForLocationInfo{
                    Lat=26.10687,
                    Lng=105.877481,
                    Info="龙宫"
                }
            };
        }

        /// <summary>
        /// 拉取柱状图-景区人流量
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<Histogramcs> PullForHistogramForAir()
        {
            List<Histogramcs> list = new List<Histogramcs>
            {
                new Histogramcs
                {
                    S="1",
                    X="黄果树",
                    Y=17500
                },
                new Histogramcs{
                    S="1",
                    X="梵净山",
                    Y=10400
                },
                new Histogramcs{
                    S="1",
                    X="小七孔",
                    Y=GetRandomForInt(11500,12500)
                },
                new Histogramcs{
                    S="1",
                    X="西江千户苗寨",
                    Y=GetRandomForInt(10500,11000)
                },
                new Histogramcs{
                    S="1",
                    X="织金洞",
                    Y=GetRandomForInt(2500,3000)
                },
                new Histogramcs{
                    S="1",
                    X="小七孔",
                    Y=GetRandomForInt(3500,4500)
                }
            };
            Random random = new Random();
            var v = random.Next(list.Count);
            list[v].Y++;
            return list;
        }

        /// <summary>
        /// 拉取柱状图-客源
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<Histogramcs> PullForHistogramForCustomerSource()
        {
            List<Histogramcs> list = new List<Histogramcs>
            {
                new Histogramcs{
                    S="1",
                    X="广东",
                    Y=GetRandomForFloat(8664.5f,9129.5f,10)
                },
                new Histogramcs{
                    S="1",
                    X="北京",
                    Y=GetRandomForInt(6149,6479)
                },
                new Histogramcs{
                    S="1",
                    X="上海",
                    Y=GetRandomForInt(5590,5890)
                },
                new Histogramcs{
                    S="1",
                    X="江苏",
                    Y=GetRandomForFloat(5310.5f,5595.5f,10)
                },
                new Histogramcs{
                    S="1",
                    X="重庆",
                    Y=GetRandomForFloat(4583.8f,4829.8f,10)
                },
                new Histogramcs{
                    S="1",
                    X="四川",
                    Y=GetRandomForFloat(4527.9f,4770.9f,10)
                },
                new Histogramcs{
                    S="1",
                    X="湖北",
                    Y=GetRandomForFloat(3521.7f,3710.7f,10)
                },
                new Histogramcs{
                    S="1",
                    X="天津",
                    Y=GetRandomForFloat(1956.5f,2061.5f,10)
                },
                new Histogramcs{
                    S="1",
                    X="西安",
                    Y=GetRandomForFloat(1788.8f,1884.8f,10)
                },
                new Histogramcs{
                    S="1",
                    X="广西",
                    Y=GetRandomForFloat(1285.7f,1354.7f,10)
                }
            };
            Random random = new Random();
            var v = random.Next(list.Count);
            list[v].Y += 10;
            return list;
        }

        /// <summary>
        /// 拉取饼图-平均停留时间
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<PieChart> PullForPieChartForStopTime()
        {
            List<PieChart> list = new List<PieChart>
            {
                new PieChart{
                    X="黄果树",
                    Y=4.5f
                },
                new PieChart{
                    X="西江千户苗寨",
                    Y=8f
                },
                new PieChart{
                    X="织金洞",
                    Y=3f
                },
                new PieChart{
                    X="小七孔",
                    Y=4f
                },
                new PieChart{
                    X="梵净山",
                    Y=4f
                },
                new PieChart{
                    X="龙宫",
                    Y=3.5f
                }
            };
            return list;
        }

        private int GetRandomForFloat(float min, float max, int multiple)
        {
            if (multiple == 0)
                multiple = 1;
            return new Random().Next((int)(min * multiple), (int)(max * multiple)) / multiple;
        }

        private int GetRandomForInt(int min, int max)
        {
            return new Random().Next(min, max);
        }

        /// <summary>
        /// 拉取饼图-花费
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<PieChart> PullForPieChartForSpend()
        {
            List<PieChart> list = new List<PieChart>
            {
                new PieChart{
                    X="黄果树",
                    Y=110f
                },
                new PieChart{
                    X="西江千户苗寨",
                    Y=225f
                },
                new PieChart{
                    X="织金洞",
                    Y=95f
                },
                new PieChart{
                    X="小七孔",
                    Y=120f
                },
                new PieChart{
                    X="梵净山",
                    Y=115f
                },
                new PieChart{
                    X="龙宫",
                    Y=80f
                }
            };
            return list;
        }

        private string GetMonthDescri(int index)
        {
            string descri = "";
            switch (index)
            {
                case 1:
                    descri = "一月";
                    break;
                case 2:
                    descri = "二月";
                    break;
                case 3:
                    descri = "三月";
                    break;
                case 4:
                    descri = "四月";
                    break;
                case 5:
                    descri = "五月";
                    break;
                case 6:
                    descri = "六月";
                    break;
                case 7:
                    descri = "七月";
                    break;
                case 8:
                    descri = "八月";
                    break;
                case 9:
                    descri = "九月";
                    break;
                case 10:
                    descri = "十月";
                    break;
                case 11:
                    descri = "十一月";
                    break;
                case 12:
                    descri = "十二月";
                    break;
            }
            return descri;
        }

        /// <summary>
        /// 游客统计折线图
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public List<Histogramcs> PullForHistogramForTourist()
        {
            List<Histogramcs> list = new List<Histogramcs>();
            for (int i = 1; i <= DateTime.Now.Month; i++)
            {
                var item = new Histogramcs
                {
                    X = GetMonthDescri(i),
                    S = "1",
                    Y = i
                };
                if (i == 1)
                    item.Y = 4128.83f;
                if (i == 2)
                    item.Y = 4272.88f;
                if (i == 3)
                    item.Y = 4522.08f;
                if (i == 4)
                    item.Y = 7298.95f;
                if (i == 5)
                    item.Y = 11822.5f;
                if (i == 6)
                    item.Y = 14306.37f;
                if (i == 7)
                    item.Y = 17581.72f;
                list.Add(item);
            }
            return list;
        }
    }
}
