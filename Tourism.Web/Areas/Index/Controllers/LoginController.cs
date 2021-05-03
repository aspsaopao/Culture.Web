using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NetCore;
using NetCore.Command.Components;
using NetCore.Command.Login;
using NetCore.Factory.Ver;
using Culture.STD.Models;
using Culture.STD.Models.Users;
using NetCore.Command;

namespace Culture.Web.Areas.Index.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Area("Index")]
    [Route("Index/[controller]/[action]")]
    [ApiController]
    public class LoginController : Controller
    {
        private Image CodeImage => new Image(
            HttpContext.RequestServices,
            DateTimeOffset.Now.AddMinutes(1),
            "loginver",
            "verimage");

        /// <summary>
        /// 验证码图片
        /// </summary>
        /// <returns></returns>
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<IActionResult> VerImage()
        {
            return File(await CodeImage.Generate(HttpContext), "image/png");
        }

        ///// <summary>
        ///// 拉取POI信息
        ///// </summary>
        ///// <returns></returns>
        //[HttpPost]
        //public async Task<InfoModel<PoiInfo>> PullPoiAsync()
        //{

        //    return new InfoModel<PoiInfo>() { Data = await new MapPoi().PullPoiDataAsync() };
        //}
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="model">登录模型</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<LoginModel>> Login([FromBody] ParamForLogin model)
        {
            if (!await CodeImage.Ver(model.VerCode, HttpContext))
                throw new Exception("验证码输入错误!");
            var userInfo = await View_UsersContext.GetViewInfoWithPassID_PassWord(
                HttpContext.RequestServices,
                model.PassId,
                model.PassWord);
            if (userInfo.IsEmpty())
                throw new Exception("找不到登录用户信息,请确认账号密码是否对应!");
            await userInfo.Login(HttpContext);
            return new InfoModel<LoginModel>
            {
                Data = new LoginModel
                {
                    IsLogin = 1,
                    Name = userInfo.GetEntity().RealName.HtmlDecode(),
                    Remark = "",
                    UId = userInfo.GetKey()
                }
            };
        }

        /// <summary>
        /// 注册账号
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<LoginModel>> Register([FromBody] ParamForLogin model)
        {
            var info =await UserAuthsContext.GetInfo(HttpContext.RequestServices, model.PassId);
            if (!info.IsEmpty())
                throw new Exception("账号已经存在，请换一个试试");

            info = await UserAuthsContext.Sub(HttpContext.RequestServices,
                model.PassId,
                "",
                0,
                model.PassWord.Md5(),
                DateTime.Now,
                "",
                DateTime.Now,
                "");

            var userinfo= await UsersContext.SubWithBase(
                HttpContext.RequestServices,
                "",
                model.Name,
                1,
                "",
                DateTime.Now,
                0,
                0,
                0,
                "",
                "",
                "",
                1,
                DateTime.Now,
                DateTime.Now,
                "",
                "");
           await info.UpdateWithUid(userinfo.GetKey());

            return new InfoModel<LoginModel>()
            {
                Data = new LoginModel
                {
                    IsLogin = 1,
                    Name = userinfo.GetEntity().RealName.HtmlDecode(),
                    Remark = "",
                    UId = userinfo.GetKey()
                }
            };
        }
    }
}