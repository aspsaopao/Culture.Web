using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using NetCore;
using CultureRazor.Authentication;

namespace Culture.Web.FilterController
{
    /// <summary>
    /// 手机端基类控制器
    /// </summary>
    [Authorize(Policy = AuthenticationDefaults.PolicyRoleName)]
    [Authorize(AuthenticationSchemes = IdentityServerRequirement.AuthenticationScheme)]
    public abstract class PhoneController : NetCoreViewLib.FilterController.WebApiForLoginController
    {
    }
}
