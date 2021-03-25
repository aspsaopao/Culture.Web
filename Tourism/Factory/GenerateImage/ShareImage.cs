using ICSharpCode.SharpZipLib.GZip;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using NetCore;
using NetCore.Command;
using NetCore.Command.Components;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Drawing;
using System.Threading.Tasks;

namespace Culture.Factory.GenerateImage
{
    /// <summary>
    /// 分享图片生成
    /// </summary>
    public class ShareImage : IShareImage
    {

        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 标题下部备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 地址
        /// </summary>
        public string Addr { get; set; }

        /// <summary>
        /// 时间
        /// </summary>
        public string Time { get; set; }

        /// <summary>
        /// 二维码左侧备注
        /// </summary>
        public string QrRemark { get; set; }

        /// <summary>
        /// 底部贴图文件信息
        /// </summary>
        public FileInfo BottomImageFileInfo { get; set; }

        /// <summary>
        /// 顶部贴图文件信息
        /// </summary>
        public FileInfo TopImageFileInfo { get; set; }

        /// <summary>
        /// 日志
        /// </summary>
        private ILogger<ShareImage> Logger { get; }

        private IServiceProvider ServiceProvider { get; }

        /// <summary>
        /// 分享图片生成
        /// </summary>
        /// <param name="serviceProvider">依赖注入</param>
        public ShareImage(
            IServiceProvider serviceProvider)
        {
            ServiceProvider = serviceProvider;
            Logger = serviceProvider.GetService<ILogger<ShareImage>>();
        }

        void DrawText(
            Graphics graphics,
            string content,
            string fontname,
            float fontSize,
            float x,
            float y,
            string colorName)
        {
            using FontFamily fontFamily = new FontFamily(fontname);
            if (fontFamily == null)
                return;
            using var font = new Font(fontFamily, fontSize, FontStyle.Regular, GraphicsUnit.Pixel);
            Color color = ColorTranslator.FromHtml(colorName);
            using var brush = new SolidBrush(color);
            graphics.DrawString(content, font, brush, new PointF
            {
                X = x,
                Y = y
            });
        }

        static OSPlatform Platform
        {
            get
            {
                if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                    return OSPlatform.Windows;
                return OSPlatform.Linux;
            }
        }

        void TopImage(
            Graphics graphics)
        {
            using var image = Image.FromFile(TopImageFileInfo.FullName);
            using var newImage = new Bitmap(650, 822);
            using var gra = Graphics.FromImage(newImage);
            gra.DrawImage(image, new Rectangle
            {
                X = 0,
                Y = 0,
                Width = 650,
                Height = 822
            });
            graphics.DrawImage(newImage, new Point(0, 0));
            DrawText(graphics, Title, Platform == OSPlatform.Windows ? "苹方 粗体" : "PingFang SC Bold", 48, 38, 580, "#fff");
            DrawText(graphics, Remark, Platform == OSPlatform.Windows ? "苹方 中等" : "PingFang SC Medium", 28, 34, 652, "#fff");
            DrawText(graphics, Addr, Platform == OSPlatform.Windows ? "苹方 中等" : "PingFang SC Medium", 22, 53, 780, "#fff");
            DrawText(graphics, Time, Platform == OSPlatform.Windows ? "苹方 中等" : "PingFang SC Medium", 22, 366, 780, "#fff");
        }

        void BottomImage(
            Graphics graphics)
        {
            using var img = new Bitmap(650, 184);
            using var gra = Graphics.FromImage(img);
            using var qrImg = Image.FromFile(BottomImageFileInfo.FullName);
            Color penColor = ColorTranslator.FromHtml("#fff");
            using var pen = new Pen(penColor);
            gra.DrawRectangle(pen, new Rectangle(0, 0, 650, 184));
            DrawText(gra, Remark, Platform == OSPlatform.Windows ? "苹方 中等" : "PingFang SC Medium", 24, 42, 56, "#585858");
            gra.DrawImage(qrImg, new Rectangle(449, 32, 117, 117));
            graphics.DrawImage(img, 0, 822);
        }

        void WriteGzip(FileInfo writeFileInfo)
        {
            if (writeFileInfo.Exists)
            {
                FileInfo gzFile = new FileInfo(Path.Combine(writeFileInfo.FullName, ".gz"));
                using var fileIn = writeFileInfo.OpenRead();
                using var fileOut = gzFile.OpenWrite();
                GZip.Compress(fileIn, fileOut, false);
            }
        }

        /// <summary>
        /// 保存文件并返回文件名
        /// </summary>
        /// <param name="inputFileName">输入文件名</param>
        /// <param name="shareInfo">分享目录</param>
        /// <param name="output">输出文件信息</param>
        /// <returns></returns>
        public bool Save(
            IDir shareInfo,
            string inputFileName,
            out TempFileInfo output)
        {
            output = null;
            string filepath = shareInfo.GetUpFilePathWithSystem(inputFileName);
            if (!filepath.IsNullOrEmpty())
            {
                FileInfo fileInfo = new FileInfo(filepath);
                if (fileInfo.Exists)
                {
                    output = new TempFileInfo
                    {
                        ServerDirPath = shareInfo.GetDownFileDir(),
                        ServerFileName = inputFileName,
                        LocalFileName = inputFileName
                    };
                    return false;
                }
            }
            if (BottomImageFileInfo.IsNull())
                throw new Exception("底部贴图属性必须设定");
            if (!BottomImageFileInfo.Exists)
                throw new Exception("未找到底部贴图");
            if (TopImageFileInfo.IsNull())
                throw new Exception("顶部贴图属性必须设定");
            if (!TopImageFileInfo.Exists)
                throw new Exception("未找到顶部贴图");
            string filename = $"{Guid.NewGuid()}.png";
            FileInfo writeFileInfo = new FileInfo(Path.Combine(shareInfo.GetUpFileDirWithSystem(), filename));
            using var image = new Bitmap(650, 1002);
            using var graphics = Graphics.FromImage(image);
            graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            using var brush = new SolidBrush(Color.FromArgb(255));
            using var pen = new Pen(brush);
            graphics.DrawRectangle(pen, 0, 0, 650, 1002);
            TopImage(graphics);
            BottomImage(graphics);
            image.Save(writeFileInfo.FullName);
            //WriteGzip(writeFileInfo);
            output = new TempFileInfo
            {
                ServerDirPath = shareInfo.GetDownFileDir(),
                ServerFileName = filename,
                LocalFileName = filename
            };
            return true;
        }
    }
}
