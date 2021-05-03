using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using NetCore;
using NetCore.Data;
using Culture.Entity;

namespace Culture.BusyData
{
    /// <summary>
    /// 数据层
    /// </summary>
    public partial class Content
    {
        
        /// <summary>
        /// 根据分页参数获取数据列表
        /// </summary>
        /// <param name="page">分页信息</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<List<CL_Content>> GetListPage(PageInfo page)
        {
            return await QueryListPage($"{ReName($"{Prefix}Content")}", "GetListPage", DataReader, page);
        }


        /// <summary>
        /// 根据分页参数获取数据列表
        /// </summary>
        /// <param name="page">分页信息</param>
        /// <param name="status">审核状态</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<List<CL_Content>> GetListPageWithStatus(
            PageInfo page,
            int status)
        {
            return await QueryListPage(
                $"{ReName($"{Prefix}Content")}",
                "GetListPage", 
                DataReader, 
                page,
                $"{ReName("Status")} = {status} ");
        }

    }
}
