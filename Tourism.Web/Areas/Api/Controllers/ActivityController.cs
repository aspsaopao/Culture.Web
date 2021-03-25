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

namespace Culture.Web.Areas.Api.Controllers
{
    /// <summary>
    /// 活动相关控制器
    /// </summary>
    [Area("Api")]
    [Route("Api/[controller]/[action]")]
    public class ActivityController : RuleController
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public  InfoModel<string> Test()
        {
            return new InfoModel<string>()
            {
                Data = "Cg"
            };
        }
    }
}
