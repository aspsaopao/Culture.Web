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
using Culture.STD.Models.Content;
using Culture.Command.Components;

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
        /// 获取列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModelList<OutPutContentInfoItem>> GetListAsync([FromBody] PageInfo pageInfo)
        {

            var list = await ContentContext.GetListPageWithStatus(
                HttpContext.RequestServices,
                pageInfo,
                Macro.TASK_COMPLETE);

            return new InfoModelList<OutPutContentInfoItem>()
            {
                ListData = list.ConvertAll(T => {
                    return new OutPutContentInfoItem()
                    {
                        Introduce = T.GetEntity().Introduce,
                        Content = T.GetEntity().Content.HtmlDecode(),
                        ContentId = T.GetKey(),
                        CreateTiem = T.GetEntity().CreateDate.ToString("yyyy-MM-dd hh:mm:ss"),
                        HeadImage = new TempFileInfo()
                        {
                            ServerDirPath = T.GetDownFileDir(),
                            ServerFileName = T.GetEntity().Image,
                        },
                        Title = T.GetEntity().Title
                    };
                }),
                PageInfo = pageInfo
            };
        }
        /// <summary>
        /// 获取信息详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<OutPutContentInfoItem>> GetInfo([FromForm] string Id)
        {
            var T = await ContentContext.GetInfo(HttpContext.RequestServices, Id);
            T.Ver();

            var list = await CommContext.GetListPageWithContentID(
            HttpContext.RequestServices,
            new PageInfo(0, 1000),
            Id
            );

            return new InfoModel<OutPutContentInfoItem>()
            {
                Data = new OutPutContentInfoItem()
                {
                    Content = T.GetEntity().Content.HtmlDecode(),
                    ContentId = T.GetKey(),
                    CreateTiem = T.GetEntity().CreateDate.ToString("yyyy-MM-dd hh:mm:ss"),
                    HeadImage = new TempFileInfo()
                    {
                        ServerDirPath = T.GetDownFileDir(),
                        ServerFileName = T.GetEntity().Image,
                    },
                    Title = T.GetEntity().Title,
                    CommList = (await Task.WhenAll(list.ConvertAll(async K => {
                        return new Comminfo()
                        {
                            Content = K.GetEntity().Content,
                            DateTime = K.GetEntity().CreateDate.ToString("yyyy-MM-dd HH:mm:ss"),
                            Name = await K.GetCreateName()
                        };
                    }))).ToList()
                }
            };
        }


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
        ///模糊搜索
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<TableOutputReportInfo>> GetListPageLikeName([FromForm] string name)
        {
            var list = await ContentContext.GetListPageLikeName(
                HttpContext.RequestServices,
                new PageInfo(0, 10000),
                name);

            return new InfoModel<TableOutputReportInfo>()
            {
                Data = new TableOutputReportInfo()
                {

                    ReportList = list.ConvertAll(T => {
                        return new OutPutContentInfoItem()
                        {
                            Introduce = T.GetEntity().Introduce,
                            Content = T.GetEntity().Content.HtmlDecode(),
                            ContentId = T.GetKey(),
                            CreateTiem = T.GetEntity().CreateDate.ToString("yyyy-MM-dd hh:mm:ss"),
                            HeadImage = new TempFileInfo()
                            {
                                ServerDirPath = T.GetDownFileDir(),
                                ServerFileName = T.GetEntity().Image,
                            },
                            Title = T.GetEntity().Title,
                        };
                    }),
                },
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