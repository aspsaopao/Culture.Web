using IdentityServer4.Extensions;
using IdentityServer4.ResponseHandling;
using IdentityServer4.Validation;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CultureRazor.IdentityServer
{
    /// <summary>
    /// 认证服务器注册
    /// </summary>
    public static class IdentityServerServices
    {
        /// <summary>
        /// 获取键
        /// </summary>
        /// <param name="subId"></param>
        /// <returns></returns>
        internal static string GetKey(this string subId)
        {
            return $"{nameof(MandatoryExpTokenResponseGenerator)}_{subId}";
        }

        /// <summary>
        /// 添加认证服务
        /// </summary>
        /// <param name="builder"></param>
        /// <returns></returns>
        public static IIdentityServerBuilder AddIdentityServerForTourism(this IIdentityServerBuilder builder)
        {
            builder.Services.AddTransient<ITokenResponseGenerator, MandatoryExpTokenResponseGenerator>();
            builder.Services.AddTransient<ICustomTokenValidator, MandatoryExpCustomTokenValidator>();
            return builder;
        }
    }
}
