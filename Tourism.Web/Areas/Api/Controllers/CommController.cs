using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using NetCore;
using NetCore.Command;
using NetCore.Command.Image;
using NetCore.Factory;
using NetCore.Tool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Culture.Factory;
using Culture.Factory.QuickImage;
using Culture.STD.Models;
using Culture.Web.FilterController;
using Culture.Command.Components;
using Culture.STD.Models.Content;
using Tourism.DataTypeOper;
using Culture.STD;
using Culture.STD.Comm;

namespace Culture.Web.Areas.Api.Controllers
{
    /// <summary>
    /// 评论相关
    /// </summary>
    [Area("Api")]
    [Route("Api/[controller]/[action]")]
    public class CommController : RuleController
    {
        /// <summary>
        /// 评论内容
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<bool>> EditComm([FromBody] InputComm model)
        {
            var info = await CommContext.Sub(
                HttpContext.RequestServices,
                "",
                model.ContentId,
                model.Content,
                DateTime.Now,
                (await UserInfoForLogin).GetKey(),
                HttpContext.Connection.RemoteIpAddress.ToString(),
                DateTime.Now
                );

            return new InfoModel<bool>()
            {
                Data = true
            };
        }

    }
}
