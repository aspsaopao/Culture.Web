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

namespace Culture.Web.Areas.Api.Controllers
{
    /// <summary>
    /// 活动相关控制器
    /// </summary>
    [Area("Api")]
    [Route("Api/[controller]/[action]")]
    public class ContentController : RuleController
    {
     

        /// <summary>
        /// 上传活动宣传图临时文件
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        [RequestFormLimits(MultipartBodyLengthLimit = 256 * 1024 * 1024)]
        [RequestSizeLimit(256 * 1024 * 1024)]
        [HttpPost]
        public async Task<InfoModel<TempFileInfo>> UploadForActivityTempFile([FromForm] IFormFile file)
        {
            UserTempDir tempFileDir = (await UserInfoForLogin).GetUserTempDirForActivity();

            TempFileInfo tempFileInfo = new TempFileInfo();

            if (!tempFileDir.SaveTempFile(file, tempFileInfo))
            {
                throw new Exception("上传失败!");
            }

            return new InfoModel<TempFileInfo>
            {
                Data = tempFileInfo
            };
        }


        /// <summary>
        /// 上传内容
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<bool>> EditActivity([FromBody] InputAddEditForContent model)
        {

            var info = await ContentContext.Sub(
                HttpContext.RequestServices,
                model.Aid,
                model.Title,
                model.HeadImage.ServerFileName,
                model.Details,
                0,
                DateTime.Now,
                (await UserInfoForLogin).GetKey(),
                HttpContext.Connection.RemoteIpAddress.ToString(),
                DateTime.Now,
                model.Introduce
                );


            UserTempDir userTempDir = (await UserInfoForLogin).GetUserTempDirForActivity();
            if (userTempDir.MoveTempFile(info, model.HeadImage))
            {
                await info.UpdateWithImage(model.HeadImage.ServerFileName);
                var thimage = info.CreateQuickImage<QuickImageGDI>(model.HeadImage.ServerFileName);
                var thName = thimage.ThumbnailWithRatio(800);

                await HttpContext.RequestServices.RefreshSizeOfImage(
                                info,
                                thName,
                                HttpContext.Connection.RemoteIpAddress.ToString(),
                                (await UserInfoForLogin).GetKey());
            }

            return new InfoModel<bool>()
            {
                Data = true
            };
        }
        /// <summary>
        /// 审核
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<bool>> ExaContent([FromForm] string id,[FromForm] int status)
        {
            var info =await ContentContext.GetInfo(HttpContext.RequestServices, id);
            info.Ver();
            await info.UpdateWithStatus((short)status);
            return new InfoModel<bool>()
            {
                Data = true
            };
        }
    
    }
}
