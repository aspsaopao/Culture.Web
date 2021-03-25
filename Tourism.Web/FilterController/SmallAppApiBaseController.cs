using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NetCore;
using NetCore.Command.Components;
using NetCoreViewLib.FilterController;
using CultureRazor.Authentication;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Culture.Web.FilterController
{
    /// <summary>
    /// 小程序api基类
    /// </summary>
    [Authorize(Policy = AuthenticationDefaults.PolicyRoleName)]
    [Authorize(AuthenticationSchemes = IdentityServerRequirement.AuthenticationScheme)]
    public abstract class SmallAppApiBaseController : WebApiForLoginController
    {
        
    }
}
