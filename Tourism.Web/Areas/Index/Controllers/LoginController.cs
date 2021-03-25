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
#if !DEBUG
            if (!await CodeImage.Ver(model.VerCode, HttpContext))
                throw new Exception("验证码输入错误!");
#endif
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
    }
}