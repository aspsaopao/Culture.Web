using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Text;
using System.IO;
using System.Text;

namespace Culture.Factory
{
    /// <summary>
    /// 字体服务
    /// </summary>
    public class FontService : IDisposable
    {
        private PrivateFontCollection _ptf;

        private ILogger<FontService> logger;

        /// <summary>
        /// 字体服务
        /// </summary>
        /// <param name="webHostEnvironment"></param>
        /// <param name="logger">日志</param>
        public FontService(
            ILogger<FontService> logger,
            IWebHostEnvironment webHostEnvironment)
        {
            this.logger = logger;
#if DEBUG
            var dir = new DirectoryInfo(Path.Combine(webHostEnvironment.ContentRootPath, "../Culture/font"));
#else
var dir = new DirectoryInfo(Path.Combine(webHostEnvironment.ContentRootPath, "font"));
#endif
            if (!dir.Exists)
                throw new Exception("字体目录不存在");
            _ptf = new PrivateFontCollection();
            foreach (var fileInfo in dir.GetFiles())
            {
                _ptf.AddFontFile(fileInfo.FullName);
            }
            foreach (var font in _ptf.Families)
            {
                logger.LogInformation($"加载字体:{font.Name}");
            }
        }

        /// <summary>
        /// 查找字体
        /// </summary>
        /// <param name="name">名称</param>
        /// <returns></returns>
        public FontFamily Find(string name)
        {
            if (name.IsNullOrEmpty())
                throw new Exception("字体名称必须指定");
            foreach (var font in _ptf.Families)
            {
                if (font.Name == name)
                    return font;
            }
            throw new Exception("未找到字体");
        }

        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
            if (_ptf != null)
            {
                _ptf.Dispose();
                _ptf = null;
            }
        }
    }
}
