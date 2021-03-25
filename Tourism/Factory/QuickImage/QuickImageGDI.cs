using NetCore.Command;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;

namespace Culture.Factory.QuickImage
{
    /// <summary>
    /// gdi快速处理图像
    /// </summary>
    public class QuickImageGDI : NetCore.Command.Image.QuickImage
    {

        const string EXTS = ".png,.jpg,.jpeg";
        /// <summary>
        /// 
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        public override string CropCenter(SizeF size)
        {
            return "";
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        public override string Thumbnail(SizeF size)
        {
            return "";
        }

        /// <summary>
        /// 查找解码器
        /// </summary>
        /// <returns></returns>
        ImageCodecInfo FindImageCodecInfo()
        {
            var codes = ImageCodecInfo.GetImageEncoders();
            return codes.Single(T => T.MimeType.ToLower() == "image/jpeg");
        }

        /// <summary>
        /// 获取等比缩略图文件名
        /// </summary>
        /// <param name="retuenNull">默认是否返回null</param>
        public string PathForThumbnailWithRatio(bool retuenNull = false)
        {
            string serverPath = Path.Combine(Dir.GetUpFileDirWithSystem(), $"thumbnail_{FileName}");
            FileInfo fileInfo = new FileInfo(serverPath);
            if (fileInfo.Exists)
                return fileInfo.Name;
            if (!retuenNull)
                return FileName;
            return "";
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="width"></param>
        /// <returns></returns>
        public override string ThumbnailWithRatio(int width)
        {
            string serverPath = Dir.GetUpFilePathWithSystem(FileName);
            if (serverPath.IsNull())
                return "";
            FileInfo fileInfo = new FileInfo(serverPath);
            if (!fileInfo.Exists)
                return "";
            string ext = fileInfo.Extension.ToLower();
            if (!EXTS.Contains(ext))
                return "";
            try
            {
                using var image = Image.FromFile(serverPath);
                if (image.IsNull())
                    return "";
                if (image.Width == 0)
                    return "";
                if (width >= image.Width)
                    return "";
                float ratio = (float)width / (float)image.Width;
                float height = ratio * image.Height;
                using var newImage = new Bitmap((int)width, (int)height);
                using var gra = Graphics.FromImage(newImage);
                gra.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
                gra.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                gra.DrawImage(image, 0, 0, newImage.Width, newImage.Height);
                var codeInfo = FindImageCodecInfo();
                string filename = Path.Combine(Dir.GetUpFileDirWithSystem(), $"thumbnail_{fileInfo.Name}");
                if (codeInfo.IsNull())
                    newImage.Save(filename);
                else
                {
                    using var param = new EncoderParameters(1);
                    param.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, (long)80);
                    newImage.Save(filename, codeInfo, param);
                }
                return $"thumbnail_{fileInfo.Name}";
            }
            catch
            {
                return "";
            }
        }
    }
}
