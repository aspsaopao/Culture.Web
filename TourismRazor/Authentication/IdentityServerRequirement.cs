using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using NetCore;
using NetCore.Command.Components;
using NetCore.Factory.Rule;
using NetCoreViewLib.Authentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace CultureRazor.Authentication
{
    /// <summary>
    /// 认证授权处理
    /// </summary>
    public class IdentityServerRequirement : HandleRequirement
    {
        /// <summary>
        /// 认证方案名称
        /// </summary>
        public const string AuthenticationScheme = "Bearer";

        /// <summary>
        /// 验证
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        protected override bool Vail(AuthorizationHandlerContext context)
        {
            if (base.Vail(context))
                return true;
            if (context.User.Identity.AuthenticationType.Contains(AuthenticationScheme))
            {
                GuidEntity uid = context.User.FindFirstValue(NetCore.Macro.COOKIESLOGIN_UID);
                if (uid == GuidEntity.Empty)
                    return false;
                return true;
            }
            return false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceProvider"></param>
        /// <param name="context"></param>
        /// <param name="uid"></param>
        /// <returns></returns>
        protected override async Task VailOfRole(
            IServiceProvider serviceProvider,
            AuthorizationHandlerContext context,
            string uid)
        {
            if (context.Resource is not DefaultHttpContext httpContext)
                return;
            var res = httpContext.GetEndpoint();
            var routePattern = httpContext.GetRouteData().Values;
            var module = res.Metadata.GetMetadata<RuleModuleAttribute>();
            var method = res.Metadata.GetMetadata<RuleMethodAttribute>();
            if (module == null && method == null)
            {
                context.Succeed(this);
                return;
            }
            UsersContext usersContext = await UsersContext.GetInfo(
                serviceProvider,
                uid);
            string area = routePattern.ContainsKey("area") ? routePattern["area"].ToStringEx() : "";
            if (await Rule.IsRule_NSpecial(
                serviceProvider,
                await EnterpriseContext.GetInfo(serviceProvider, ClaimsPrincipalEx.FindFirstValueEx(context.User, Macro.COOKIESLOGIN_EID)),
                usersContext,
                ConvertEx.ToStringEx(routePattern["controller"]),
                area,
                ConvertEx.ToStringEx(routePattern["action"])))
                context.Succeed(this);
        }
    }
}
