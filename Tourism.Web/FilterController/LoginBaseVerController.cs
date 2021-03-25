using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using NetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Culture.Web.FilterController
{
    /// <summary>
    /// 验证版本号登录控制器
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public abstract class LoginBaseVerController<T> : LoginBaseController<T>
    {
        /// <summary>
        /// 验证版本号登录控制器
        /// </summary>
        /// <param name="provider"></param>
        /// <param name="configuration"></param>
        /// <param name="logger"></param>
        protected LoginBaseVerController(
            IDataProtectionProvider provider,
            IConfiguration configuration,
            ILogger<T> logger) : base(provider, configuration, logger)
        {
        }
    }
}
