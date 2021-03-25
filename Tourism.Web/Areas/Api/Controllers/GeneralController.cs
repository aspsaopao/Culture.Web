using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NetCore.Command.Components;
using NetCore.Factory.Rule;
using NetCoreViewLib;
using NetCore.Command.Login;
using Culture.Web.FilterController;
using Culture.STD.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Culture.Web.Areas.Api.Controllers
{
    /// <summary>
    /// 常规控制器(菜单等通用接口)
    /// </summary>
    [Area("Api")]
    [Route("Api/[controller]/[action]")]
    public class GeneralController : RuleController
    {
        /// <summary>
        /// 获取菜单
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<List<NavBarItem>>> Menu()
        {
            var menu = HttpContext.RequestServices.GetMenu<NavBarItem>("menu", null);
            menu = await IsRule(menu);
            return new InfoModel<List<NavBarItem>>
            {
                Data = menu
            };
        }

        /// <summary>
        /// 登出
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<InfoModel<string>> LoginOut()
        {
            await HttpContext.LoginOut();
            return new InfoModel<string>();
        }

        /// <summary>
        /// 递归判断用户菜单权限
        /// </summary>
        /// <param name="navBarItems"></param>
        /// <returns></returns>
        private async Task<List<NavBarItem>> IsRule(List<NavBarItem> navBarItems)
        {
            //筛选子节点
            foreach (var item in navBarItems)
            {
                if (item.Children != null)
                {
                    item.Children = await IsRule(item.Children);
                }
            }
            var newItems = navBarItems.Select(async F =>
             {
                 //子项筛选之后为空则判断父级菜单自身权限
                 if (F.Children != null ? (F.Children.Count > 0 ? false : true) : true)
                 {
                     if (F.Module == null)
                         return new
                         {
                             Info = F,
                             Value = true
                         };
                     if (F.Module.Count < 1)
                         return new
                         {
                             Info = F,
                             Value = true
                         };
                     if (F.Module[0].Split('/').Length < 3)
                         return new
                         {
                             Info = F,
                             Value = true
                         };

                     //判断权限
                     return new
                     {
                         Info = F,
                         Value = await Rule.IsRule_NSpecial(
                          HttpContext.RequestServices,
                          EnterpriseContext.EmptyContext(HttpContext.RequestServices),
                          (await UserInfoForLogin),
                          F.Module[0].Split('/')[1],
                          F.Module[0].Split('/')[0],
                          F.Module[0].Split('/')[2])
                     };
                 }
                 //子项筛选之后有值则默认显示父级菜单
                 return new
                 {
                     Info = F,
                     Value = true
                 };
             });
            var result = await Task.WhenAll(newItems);
            navBarItems = (from T in result where T.Value select T.Info).ToList();
            return navBarItems;
        }
    }
}
