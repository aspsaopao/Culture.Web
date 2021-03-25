using Microsoft.Extensions.Logging;
using NetCore;
using NetCore.Command;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using System.Drawing;
using System.IO;
using System.Drawing.Drawing2D;
using System.Runtime.InteropServices;

namespace Culture.Factory.GenerateImage
{
    /// <summary>
    /// 打卡点分享
    /// </summary>
    public class ShareImageForCheckPoint : IShareImage
    {
        readonly IServiceProvider serviceProvider;

        readonly ILogger<ShareImageForCheckPoint> logger;

        readonly int pixel;

        /// <summary>
        /// 打卡点分享
        /// </summary>
        /// <param name="pixel">单位像素(dp,pt转换值)</param>
        /// <param name="serviceProvider"></param>
        public ShareImageForCheckPoint(
            int pixel,
            IServiceProvider serviceProvider)
        {
            this.pixel = pixel;
            this.serviceProvider = serviceProvider;
            logger = serviceProvider.GetService<ILogger<ShareImageForCheckPoint>>();
        }

        /// <summary>
        /// 获取真实像素
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        private float GetPixel(float v)
        {
            return pixel * v;
        }

        /// <summary>
        /// 大背景图上的描述
        /// </summary>
        public string BackImageText { get; set; }

        /// <summary>
        /// 标题(头像右边黑色)
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 小标题(头像右边灰色)
        /// </summary>
        public string SmallTitle { get; set; }

        /// <summary>
        /// 地理信息描述
        /// </summary>
        public string LocationText { get; set; }

        /// <summary>
        /// 大背景图绝对路径
        /// </summary>
        public string BackImagePath { get; set; }

        /// <summary>
        /// 头像图片绝对路径
        /// </summary>
        public string HeaderImagePath { get; set; }

        /// <summary>
        /// 二维码绝对路径
        /// </summary>
        public string QrImagePath { get; set; }

        /// <summary>
        /// 地理图标绝对路径
        /// </summary>
        public string LocationImagePath { get; set; }

        /// <summary>
        /// 绘制文字
        /// </summary>
        /// <param name="graphics"></param>
        /// <param name="content"></param>
        /// <param name="fontname"></param>
        /// <param name="fontSize"></param>
        /// <param name="contentRect">文字绘制区域</param>
        /// <param name="colorName"></param>
        /// <param name="stringFormat">文字格式</param>
        /// <param name="fontStyle">字体样式</param>
        void DrawText(
            Graphics graphics,
            string content,
            string fontname,
            float fontSize,
            RectangleF contentRect,
            string colorName,
            FontStyle fontStyle,
            StringFormat stringFormat = null)
        {
            if (content.IsNullOrEmpty())
                return;
            using FontFamily fontFamily = new FontFamily(fontname);
            if (fontFamily == null)
                return;
            using var font = new Font(fontFamily, fontSize, fontStyle, GraphicsUnit.Pixel);
            Color color = ColorTranslator.FromHtml(colorName);
            using var brush = new SolidBrush(color);
            if (stringFormat.IsNull())
                graphics.DrawString(content, font, brush, contentRect);
            else
                graphics.DrawString(content, font, brush, contentRect, stringFormat);
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

        private void DrawQr(Graphics graphics)
        {
            if (QrImagePath.IsNullOrEmpty())
                return;
            FileInfo fileInfo = new FileInfo(QrImagePath);
            if (!fileInfo.Exists)
                return;
            SizeF size = new SizeF(GetPixel(64.5f), GetPixel(64.5f));
            using var image = Image.FromFile(fileInfo.FullName);
            graphics.DrawImage(image, new RectangleF(new PointF(GetPixel(289f), GetPixel(526.5f)), size));
        }

        private void DrawLocation(Graphics graphics)
        {
            if (LocationImagePath.IsNullOrEmpty())
                return;
            FileInfo fileInfo = new FileInfo(LocationImagePath);
            if (!fileInfo.Exists)
                return;
            SizeF size = new SizeF(GetPixel(10), GetPixel(12));
            using var image = Image.FromFile(fileInfo.FullName);
            graphics.DrawImage(image, new RectangleF(new PointF(GetPixel(32), GetPixel(572.5f)), size));
        }

        private void Cut(FileInfo fileInfo, SizeF size, Graphics graphics)
        {
            using var image = Image.FromFile(fileInfo.FullName);
            PointF newPosi = PointF.Empty;
            RectangleF imageBox = RectangleF.Empty;
            if (image.Width > image.Height)
            {
                float scale = image.Height / size.Height;
                float width = scale * size.Width;
                var x = (image.Width - width) / 2f;
                imageBox = new RectangleF(x, 0, width, image.Height);
            }
            else
            {
                float scale = image.Width / size.Width;
                float height = scale * size.Height;
                var y = (image.Height - height) / 2f;
                imageBox = new RectangleF(0, y, image.Width, height);
            }
            using var bitmap = new Bitmap((int)size.Width, (int)size.Height);
            using var g = Graphics.FromImage(bitmap);
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            g.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
            g.DrawImage(image, new RectangleF(0, 0, size.Width, size.Height), imageBox, GraphicsUnit.Pixel);
            g.Save();
            graphics.DrawImage(bitmap, 0, 0);
        }

        /// <summary>
        /// 绘制头像
        /// </summary>
        /// <param name="graphics"></param>
        private void DrawHeader(Graphics graphics)
        {
            if (HeaderImagePath.IsNullOrEmpty())
                return;
            FileInfo fileInfo = new FileInfo(HeaderImagePath);
            if (!fileInfo.Exists)
                return;
            SizeF size = new SizeF(GetPixel(17.5f), GetPixel(17.5f));
            using var bitmapPass = new Bitmap((int)size.Width, (int)size.Height);
            using var g_pass = Graphics.FromImage(bitmapPass);
            GraphicsPath pathBounds = new GraphicsPath();
            pathBounds.AddEllipse(new RectangleF(new PointF(0f, 0f), size));
            g_pass.SetClip(pathBounds);
            Cut(fileInfo, size, g_pass);
            g_pass.Save();
            graphics.DrawImage(bitmapPass, new RectangleF(new PointF(GetPixel(24.5f), GetPixel(532)), size));
        }

        private void DrawBgImage(Graphics graphics)
        {
            if (BackImagePath.IsNullOrEmpty())
                BackImagePath = Macro.QRBACKIMAGEPATH;
            FileInfo backImageInfo = new FileInfo(BackImagePath);
            if (!backImageInfo.Exists)
                return;
            Cut(backImageInfo, new SizeF(GetPixel(375), GetPixel(500)), graphics);
        }

        /// <summary>
        /// 保存文件并返回文件名
        /// </summary>
        /// <param name="inputFileName">输入文件名</param>
        /// <param name="shareInfo">分享目录</param>
        /// <param name="output">输出文件信息</param>
        /// <returns></returns>
        public bool Save(IDir shareInfo, string inputFileName, out TempFileInfo output)
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
            using var image = new Bitmap((int)GetPixel(375), (int)GetPixel(620));
            using var graphics = Graphics.FromImage(image);
            graphics.Clear(Color.White);
            graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            DrawBgImage(graphics);
            DrawText(
                graphics,
                BackImageText,
                Platform == OSPlatform.Windows ? "黑体" : "PingFang SC Bold",
                GetPixel(14),
                new RectangleF(GetPixel(24.5f), GetPixel(444.5f), GetPixel(330f), GetPixel(36f)),
                "#ffffff",
                 FontStyle.Bold);
            DrawHeader(graphics);
            DrawText(
                graphics,
                Title.Length > 16 ? Title.Substring(0, 13) + "..." : Title,
                Platform == OSPlatform.Windows ? "黑体" : "PingFang SC Bold",
                GetPixel(13),
                new RectangleF(GetPixel(47f), GetPixel(533), GetPixel(230f), GetPixel(16)),
                "#222222",
                 FontStyle.Bold);
            DrawText(
                graphics,
                SmallTitle,
                Platform == OSPlatform.Windows ? "黑体" : "PingFang SC Bold",
                GetPixel(12),
                new RectangleF(GetPixel(47f), GetPixel(550), GetPixel(230f), GetPixel(16)),
                "#999999",
                 FontStyle.Regular);
            DrawQr(graphics);
            DrawLocation(graphics);
            DrawText(
                graphics,
                LocationText.Length>20?LocationText.Substring(0,17)+"...": LocationText,
                Platform == OSPlatform.Windows ? "黑体" : "PingFang SC Bold",
                GetPixel(12),
                new RectangleF(GetPixel(47), GetPixel(571f), GetPixel(230f), GetPixel(16)),
                "#222222",
                 FontStyle.Regular);
            graphics.Save();
            var outputFileName = $"{Guid.NewGuid()}.png";
            image.Save(shareInfo.GetUpFilePathWithSystem(outputFileName));
            output = new TempFileInfo
            {
                ServerDirPath = shareInfo.GetDownFileDir(),
                ServerFileName = outputFileName,
                LocalFileName = outputFileName
            };
            return true;
        }
    }
}
