using System;
using System.Collections.Generic;
using NetCore;
using Culture.Entity;
using NetCore.Command.Components;
using Culture.BusyData;
using System.Threading.Tasks;

namespace Culture.Command.Components
{
    /// <summary>
    /// 
    /// </summary>
    public partial class CommContext
    {
        /// <summary>
        /// 获取(空信息)
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="page">分页信息</param>
        /// <param name="ContentId"></param>
        /// <returns></returns>
        public static async System.Threading.Tasks.Task<List<CommContext>> GetListPageWithContentID(
            IServiceProvider serviceProvider,
            PageInfo page,
            GuidEntity ContentId)
        {
            Culture.BusyData.Comm db = new Culture.BusyData.Comm(serviceProvider);
            return await TransList(
                db.GetListPageWithContentID(page, ContentId),
                t => { return new CommContext(serviceProvider, t, db); });
        }
        /// <summary>
        /// 获取评论人姓名
        /// </summary>
        /// <returns></returns>
        public  async Task<string> GetCreateName()
        {
            if (IsEmpty())
                return "";
            var info =await UsersContext.GetInfo(ServiceProvider, entity.CreateUid);
            return info.IsEmpty() ? "" : info.GetEntity().RealName;
        }

    }
}