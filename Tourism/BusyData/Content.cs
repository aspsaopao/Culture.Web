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
                $"{ReName("Status")} = {status} AND {Recycle()} ");
        }


        /// <summary>
        /// 根据分页参数获取数据列表
        /// </summary>
        /// <param name="page">分页信息</param>
        /// <param name="name">搜索关键字</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<List<CL_Content>> GetListPageLikeName(
            PageInfo page,
            StringEntity name)
        {
            return await QueryListPage(
                $"{ReName($"{Prefix}Content")}",
                $"GetListPageLikeName:{name}",
                DataReader,
                page,
                $" ({ReName("Title")} like  '%{name}%' OR  {ReName("Content")} like '%{name}%'  OR {ReName("Introduce")}  like '%{name}%' ) AND {Recycle()} AND  {ReName("Status")} = 1 ");
        }
        /// <summary>
        /// 根据分页参数获取数据列表
        /// </summary>
        /// <param name="page">分页信息</param>
        /// <param name="uid">审核状态</param>
        /// <param name="status">状态</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<List<CL_Content>> GetListPageCreateID(
            PageInfo page,
            GuidEntity uid,
            int status)
        {
            return await QueryListPage(
                $"{ReName($"{Prefix}Content")}",
                $"GetListPageCreateID:{uid}:status:{status}",
                DataReader,
                page,
                $"{ReName("CreateUid")} =  '{uid}'  AND {Recycle()}  AND  {ReName("Status")} = {status} ");
        }

    }
}
