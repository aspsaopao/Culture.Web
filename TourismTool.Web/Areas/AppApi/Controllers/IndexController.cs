using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using NetCore;
using NetCore.Command;
using NetCore.Command.Components;
using NetCoreViewLib.Js;
using Tourism.Command.Components;
using Tourism.Factory;
using Tourism.STD.Models;
using Tourism.STD.Models.Content;
using Tourism.STD.Models.ScenicArea;
using Tourism.STD.Models.TouristArea;
using TourismTool.Web.FilterController;

namespace TourismTool.Web.Areas.AppApi.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Area("AppApi")]
    [Route("AppApi/[controller]/[action]")]
    public class IndexController : AppController
    {

        private ScenicAreaContext SAID { get; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="config"></param>
        /// <param name="serviceProvider"></param>
        public IndexController(IConfiguration config, IServiceProvider serviceProvider)
        {
            var id = config.GetValue<string>("collectionId");
            if (id.IsNullOrEmpty())
                SAID = ScenicAreaContext.GetInfoWithTop1(serviceProvider);
            else
                ScenicAreaContext.GetInfo(
                HttpContext.RequestServices,
                id);
        }

        /// <summary>
        /// 编辑添加光管区
        /// </summary>
        /// <param name="model">模型</param>
        /// <returns></returns>
        [HttpPost]
        public InfoModel<string> EditForTouristArea([FromBody] EditInputForTouristArea model)
        {
            SAID.Ver();
            var info = TouristAreaContext.GetInfo(
                HttpContext.RequestServices,
                model.TaId);
            if (!info.IsEmpty())
                model.ParentId = info.GetEntity().ParentID;
            TouristAreaContext.SubWithBase(
                HttpContext.RequestServices,
                model.TaId,
                model.ParentId,
                SAID.GetKey(),
                model.Lng,
                model.Lat,
                model.Title,
                model.Description,
                model.Remarks,
                model.DescriptionForSecPayment,
                model.PriceForSecPayment.ConvertToCents(),
                DateTime.Now,
                DateTime.Now,
                HttpContext.Connection.RemoteIpAddress.ToString(),
                "");
            return new InfoModel<string>
            {
                Data = "添加成功!"
            };
        }

        /// <summary>
        /// 拉取观景区树
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public InfoModelList<EditInputForTouristArea> PullTouristAreas([FromForm] string parentId)
        {
            var list = TouristAreaContext.GetListPageWithSAid(
                HttpContext.RequestServices,
                new PageInfo(0, 10000),
                parentId,
                SAID.GetKey());
            return new InfoModelList<EditInputForTouristArea>
            {
                ListData = list.ConvertAll(T =>
                {
                    return new EditInputForTouristArea
                    {
                        Description = T.GetEntity().Description,
                        SaId = T.GetEntity().SAid,
                        PriceForSecPayment = T.GetEntity().PriceForSecPayment.ConvertToYuanString(),
                        DescriptionForSecPayment = T.GetEntity().DescriptionForSecPayment,
                        Lat = T.GetEntity().Lat,
                        Lng = T.GetEntity().Lng,
                        ParentId = T.GetEntity().ParentID,
                        Remarks = T.GetEntity().Remarks,
                        TaId = T.GetEntity().TAid,
                        Title = T.GetEntity().Title
                    };
                })
            };
        }

        /// <summary>
        /// 根据观光区获取观光区信息
        /// </summary>
        /// <param name="taId">观光区id</param>
        /// <returns></returns>
        [HttpPost]
        public InfoModel<EditInputForTouristArea> PullTouristArea([FromForm] string taId)
        {
            var info = TouristAreaContext.GetInfo(
                HttpContext.RequestServices,
                taId);
            if (info.IsEmpty())
                return new InfoModel<EditInputForTouristArea> { Data = new EditInputForTouristArea() };
            return new InfoModel<EditInputForTouristArea>
            {
                Data = new EditInputForTouristArea
                {
                    SaId = info.GetKey(),
                    Description = info.GetEntity().Description,
                    DescriptionForSecPayment = info.GetEntity().DescriptionForSecPayment,
                    Lat = info.GetEntity().Lat,
                    Lng = info.GetEntity().Lng,
                    ParentId = info.GetEntity().ParentID,
                    Remarks = info.GetEntity().Remarks,
                    TaId = info.GetEntity().TAid,
                    Title = info.GetEntity().Title
                }
            };
        }

        /// <summary>
        /// 删除观景点
        /// </summary>
        /// <param name="taId">观景点id</param>
        /// <returns></returns>
        [HttpPost]
        public InfoModel<string> DelForTouristArea([FromForm] string taId)
        {
            var touristAreaInfo = TouristAreaContext.GetInfo(
                HttpContext.RequestServices,
                taId);
            touristAreaInfo.Ver();
            touristAreaInfo.MoveToRecycle();
            return new InfoModel<string>
            {
                Data = "操作成功!"
            };
        }
    }
}