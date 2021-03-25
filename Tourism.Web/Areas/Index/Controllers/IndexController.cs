using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using NetCore;
using NetCore.Authentication;
using NetCore.Command.Components;
using NetCore.Factory.Ver;
using Culture.STD.Models;

namespace Culture.Web.Areas.Index.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Area("Index")]
    [Route("Index/[controller]/[action]")]
    [ApiController]
    public class IndexController : Controller
    {

        /// <summary>
        /// 安装系统
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<string>> Setup([FromForm] string passId, [FromForm] string passWord)
        {
            var userList = await NetCore.Command.Components.UsersContext.GetListPage(
                HttpContext.RequestServices,
                new PageInfo(0, 1));
            if (userList.Count > 0)
                throw new Exception("您在做非安全操作!系统已经记录");
            await NetCore.Factory.Setup.OnStart(
                HttpContext.RequestServices,
                passId,
                passWord,
                DateTime.Now,
                HttpContext.Connection.RemoteIpAddress.ToString());
            return new InfoModel<string>
            {
                Data = "安装成功!"
            };
        }

        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<LoginModel>> GetUserInfo()
        {
            var result = await HttpContext.AuthenticateAsync(AuthenticationDefaults.SchemeNameForLogin);
            var loginModel = new LoginModel
            {
                Name = ""
            };
            if (result.Succeeded)
            {
                var uid = result.Principal.FindFirstValueEx(NetCore.Macro.COOKIESLOGIN_UID);
                var userInfo = await UsersContext.GetInfo(
                    HttpContext.RequestServices,
                    uid);
                if (!userInfo.IsEmpty())
                {
                    loginModel.Name = userInfo.GetEntity().RealName.HtmlDecode();
                    loginModel.UId = userInfo.GetKey();
                    loginModel.IsLogin = 1;
                }
            }
            return new InfoModel<LoginModel>
            {
                Data = loginModel
            };
        }
    }
}