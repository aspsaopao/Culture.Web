using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using NetCore;
using NetCore.Command.ExceptionEx;
using NetCoreViewLib.Controllers;
using NetCoreViewLib.Models;
using Culture.ExceptionEx;
using Culture.Factory;

namespace Culture.Web.Areas.Index.Controllers
{
    /// <summary>
    /// 错误定向
    /// </summary>
    [Area("Index")]
    public class SystemErrorController : ErrorController
    {
        /// <summary>
        /// 获取ajax
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        protected override AjaxInfo GetAjaxInfo(ErrorModel model)
        {
            if (model.Exception is LocationException exception)
                return new AjaxInfoOfLocation
                {
                    IsSuccess=false,
                    Code=exception.ErrorCode,
                    DataEx=exception.DataEx,
                    Message=model.ErrorMessage()
                };
            return base.GetAjaxInfo(model);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="feature"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        protected override bool CustomError(IExceptionHandlerFeature feature, ErrorModel model)
        {
            if (feature.Error is System.Security.Cryptography.CryptographicException)
            {
                if (feature.Error.Source == "Microsoft.AspNetCore.DataProtection")
                {
                    foreach (var cookiesKey in Request.Cookies.Keys)
                    {
                        Response.Cookies.Delete(cookiesKey);
                    }
                    model.Exception = new LoginException("登录超时!", feature.Error);
                    return true;
                }
            }
            else if (feature.Error is WxException exception)
            {
                model.Code = exception.ErrorCode;
                model.Exception = exception;
                if (!exception.Header.IsNull())
                {
                    foreach (var kv in exception.Header)
                    {
                        Response.Headers.Add(kv.Key, kv.Value);
                    }
                }
                return true;
            }
            return base.CustomError(feature, model);
        }
    }
}