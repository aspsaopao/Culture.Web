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
    public partial class Comm
    {
        
        /// <summary>
        /// 根据分页参数获取数据列表
        /// </summary>
        /// <param name="page">分页信息</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<List<CL_Comm>> GetListPage(PageInfo page)
        {
            return await QueryListPage($"{ReName($"{Prefix}Comm")}", "GetListPage", DataReader, page);
        
        }
        /// <summary>
        /// 获取内容的评论信息
        /// </summary>
        /// <param name="page"></param>
        /// <param name="ContentId"></param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<List<CL_Comm>> GetListPageWithContentID(
            PageInfo page,
            GuidEntity ContentId)
        {
            return await QueryListPage(
                $"{ReName($"{Prefix}Comm")}",
                $"GetListPageWithContentID:{ContentId}", 
                DataReader, 
                page,
                $"{ReName("ContentId")} = '{ContentId}'",
                "*",
                 $"order by {ReName("CreateDate")} DESC");

        }

        
    }
}
