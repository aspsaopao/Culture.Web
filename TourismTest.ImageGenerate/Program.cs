using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NetCore;
using NetCore.Command;
using System;
using System.Drawing.Text;
using Tourism.Factory.GenerateImage;

namespace TourismTest.ImageGenerate
{
    class Program
    {
        static void Main(string[] args)
        {
            var host = CreateHostBuilder(args).Build();
            using var scope = host.Services.CreateScope();
            TestDir testDir = new TestDir(scope.ServiceProvider);
            ShareImageForCheckPoint shareImageForCheckPoint = new ShareImageForCheckPoint(3, scope.ServiceProvider)
            {
                BackImagePath = testDir.GetUpFilePathWithSystem("1602639718180.jpg"),
                HeaderImagePath = testDir.GetUpFilePathWithSystem("1602639718180.jpg"),
                QrImagePath = testDir.GetUpFilePathWithSystem("1602639718180.jpg"),
                BackImageText = "你来一趟人间，你要看看太阳，和你的心上人，一起 走在大街上...",
                Title = "周末爱浪周末爱浪周末爱浪",
                SmallTitle = "2020年9月8日 星期二",
                LocationImagePath = testDir.GetUpFilePathWithSystem("location.png"),
                LocationText = "贵州·贵阳青岩古镇"
            };
            TempFileInfo tempFileInfo;
            shareImageForCheckPoint.Save(testDir, "", out tempFileInfo);
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
       Host.CreateDefaultBuilder(args)
           .ConfigureServices((hostContext, services) =>
           {

           })
            .ConfigureLogging(log =>
            {
                log.AddConsole();
                log.AddDebug();
            });
    }
}
