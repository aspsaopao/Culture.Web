using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using NetCore.Factory.Rule;
using NetCore.Command.Components;
using NetCore;
using NetCore.Factory.Models;
using Microsoft.AspNetCore.Authorization;
using System.IO;
using NetCore.Command;
using System.Drawing;
using Culture.STD.Models;

namespace Culture.Web.FilterController
{
    /// <summary>
    /// 权限控制器
    /// </summary>
    [Authorize(Policy = AuthenticationDefaults.PolicyRoleName)]
    public abstract class RuleController : NetCoreViewLib.FilterController.WebApiForLoginController
    {
        /// <summary>
        /// 保存base64文件
        /// </summary>
        /// <param name="base64"></param>
        /// <param name="dir">目录信息</param>
        /// <returns></returns>
        protected TempFileInfo SaveBase64Image(string base64, IDir dir)
        {
            if (base64.IsNullOrEmpty())
                return new TempFileInfo();
            Span<byte> span = new Span<byte>(new byte[base64.Length]);
            int outLen;
            if (!Convert.TryFromBase64String(base64, span, out outLen))
                return new TempFileInfo();
            using var memStream = new MemoryStream(span.ToArray());
            using var bitmap = new Bitmap(memStream);
            var fileName = $"{Guid.NewGuid()}.jpg";
            FileInfo fileInfo = new FileInfo(dir.GetUpFilePathWithSystem(fileName));
            using var fileStream = fileInfo.Create();
            bitmap.Save(fileStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            return new TempFileInfo
            {
                ServerDirPath = dir.GetDownFileDir(),
                ServerFileName = fileName
            };
        }
    }
}