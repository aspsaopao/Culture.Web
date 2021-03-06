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

namespace Culture.Web.Areas.Api.Controllers
{
    /// <summary>
    /// 内容相关控制器
    /// </summary>
    [Area("Api")]
    [Route("Api/[controller]/[action]")]
    public class ContentController : RuleController
    {
        /// <summary>
        /// 获取列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<TableOutputReportInfo>> GetListAsync([FromBody] TableOutputReportInput model)
        {

            var list = await ContentContext.GetListPageWithStatus(
                HttpContext.RequestServices,
                model.PageInfo,
                model.Status);

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
                            Status = T.GetEntity().Status,
                            StstusName = HttpContext.RequestServices.GetDataTypeForConstant<ContentStatusType>().FindDataTypeForValue(T.GetEntity().Status)
                        };
                    }),
                    Page= model.PageInfo,
                    ExamineList = HttpContext.RequestServices.GetDataTypeForConstant<ContentStatusType>().DataType.ConvertAll(T =>
                    {
                        return new TypeForName<int, string>()
                        {
                            Id = T.Id,
                            Name = T.Value
                        };
                    }),
                } ,
            };
        }

        /// <summary>
        ///我的发布列表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<TableOutputReportInfo>> GetListPageCreateID([FromBody] TableOutputReportInput model)
        {

            var list = await ContentContext.GetListPageCreateID(
                HttpContext.RequestServices,
                model.PageInfo,
                (await UserInfoForLogin).GetKey(),
                model.Status)  ;

            return new InfoModel<TableOutputReportInfo>()
            {
                Data = new TableOutputReportInfo()
                {
                    Page = model.PageInfo,
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
                            StstusName = HttpContext.RequestServices.GetDataTypeForConstant<ContentStatusType>().FindDataTypeForValue(T.GetEntity().Status)
                        };
                    }),
                    ExamineList = HttpContext.RequestServices.GetDataTypeForConstant<ContentStatusType>().DataType.ConvertAll(T =>
                    {
                        return new TypeForName<int, string>()
                        {
                            Id = T.Id,
                            Name = T.Value
                        };
                    }),
                },
            };
        }


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
                    Status = T.GetEntity().Status,
                    Introduce = T.GetEntity().Introduce,
                    ExamineList = HttpContext.RequestServices.GetDataTypeForConstant<ContentStatusType>().DataType.ConvertAll(T =>
                    {
                        return new TypeForName<int, string>()
                        {
                            Id = T.Id,
                            Name = T.Value
                        };
                    }),
                    CommList  = (await Task.WhenAll( list.ConvertAll(async K=> {
                        return new Comminfo()
                        {
                            Content = K.GetEntity().Content,
                            DateTime = K.GetEntity().CreateDate.ToString("yyyy-MM-dd HH:mm:ss"),
                            Name =await K.GetCreateName()
                        };
                    }))).ToList()
                }
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

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<bool>> DeleteContent([FromForm] string id)
        {
            var info = await ContentContext.GetInfo(HttpContext.RequestServices, id);
            info.Ver();
            await info.MoveToRecycle();
            return new InfoModel<bool>()
            {
                Data = true
            };
        }

    }
}
