using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NetCore.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace TourismTest.ImageGenerate
{
    /// <summary>
    /// 测试目录
    /// </summary>
    public class TestDir : IDir
    {
        readonly IServiceProvider serviceProvider;

        /// <summary>
        /// 测试目录
        /// </summary>
        /// <param name="serviceProvider"></param>
        public TestDir(IServiceProvider serviceProvider)
        {
            this.serviceProvider = serviceProvider;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string GetDownFileDir()
        {
            return "";
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string GetUpFileDirWithSystem()
        {
            var env = serviceProvider.GetService<IHostEnvironment>();
            return $"{env.ContentRootPath}/";
        }
    }
}
