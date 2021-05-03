using System;
using System.Collections.Generic;
using NetCore;
using Culture.Entity;
using NetCore.Command.Components;
using Culture.BusyData;
using NetCore.Command;
using Microsoft.Extensions.DependencyInjection;
using NetCore.Entity.Config;

namespace Culture.Command.Components
{
    /// <summary>
    /// 
    /// </summary>
    public partial class ContentContext:IDir
    {
        /// <summary>
        /// 根据状态获取信息列表
        /// </summary>
        /// <param name="serviceProvider"></param>
        /// <param name="page"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public static async System.Threading.Tasks.Task<List<ContentContext>> GetListPageWithStatus(
         IServiceProvider serviceProvider,
         PageInfo page,
         int status)
        {
            Culture.BusyData.Content db = new Culture.BusyData.Content(serviceProvider);
            return await TransList(
                db.GetListPageWithStatus(page, status),
                t => { return new ContentContext(serviceProvider, t, db); });
        }


        /// <summary>
        /// 获取下载路径
        /// </summary>
        /// <returns></returns>
        public string GetDownFileDir()
        {
            if (IsEmpty())
                return "";
            return $"{ServiceProvider.GetServiceForConfig<RootPath>(Macro.DIR_Activity).Downpath}{GetKey()}/";
        }

        /// <summary>
        /// 获取物理路径
        /// </summary>
        /// <returns></returns>
        public string GetUpFileDirWithSystem()
        {
            if (IsEmpty())
                return "";
            string dir = $"{ServiceProvider.GetUpFileDirWithSystem_Static(Macro.DIR_Activity)}{GetKey()}/";
            FileOper.CreateDir(dir);
            return dir;
        }
    }
}