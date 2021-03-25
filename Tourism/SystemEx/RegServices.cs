using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetCore;
using NetCore.Authentication;
using System;
using System.Collections.Generic;
using System.Text;
using Culture.Factory;

namespace Culture.SystemEx
{
    /// <summary>
    /// 注册服务
    /// </summary>
    public static class RegServices
    {
        /// <summary>
        /// 添加服务
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration">配置项</param>
        /// <returns></returns>
        public static IServiceCollection AddService<T>(
            this IServiceCollection services, 
            IConfiguration configuration) where T : ILoginRequirement
        {
            var pulltoken = configuration.GetValue<string>("pulltoken").ToInt32();
            services.AddHttpClient(Macro.HTTPCLIENT);
            services.AddHttpClient(Macro.HTTPCLIENT_AMAP);
            services.AddHttpClient(Macro.HTTPCLIENT_IMAGE);
            services.AddHttpClient(Macro.HTTPCLIENT_TOKEN);
      
            services.AddHandlerForNetCore<T>();
            services.AddSingleton<FontService>();
            return services;
        }
    }
}
