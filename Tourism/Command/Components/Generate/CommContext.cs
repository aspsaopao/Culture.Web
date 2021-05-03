using System;
using System.Collections.Generic;
using NetCore;
using Culture.Entity;
using NetCore.Command.Components;
using Culture.BusyData;

namespace Culture.Command.Components
{
    /// <summary>
    /// 
    /// </summary>
    public partial class CommContext : AbModule<CL_Comm, Comm>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="entity">实体</param>
        /// <param name="db">数据层</param>
        protected CommContext(
            IServiceProvider serviceProvider,
            CL_Comm entity, 
            Comm db) :
            base(serviceProvider, entity, db, "未找到!")
        {
        }
        
        #region 自动生成
        
        /// <summary>
        /// 处理函数
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="CommID">评论id</param>
        /// <param name="ContentId">内容id</param>
        /// <param name="Content">内容</param>
        /// <param name="Updated">更新时间</param>
        /// <param name="CreateUid">创建用户</param>
        /// <param name="CreateIP">建立IP</param>
        /// <param name="CreateDate">建立时间</param>
        public static async System.Threading.Tasks.Task<CommContext> Sub(
        IServiceProvider serviceProvider,
        GuidEntity CommID
        ,GuidEntity ContentId
                ,StringEntity Content
                ,System.DateTime Updated
                ,GuidEntity CreateUid
                ,StringEntity CreateIP
                ,System.DateTime CreateDate
        )
        {
            CommContext operinfo = await GetInfo(serviceProvider, CommID);
            if (operinfo.IsEmpty())
            {
                Culture.Entity.CL_Comm info = new Culture.Entity.CL_Comm
                {
                    CommID = operinfo.CreateGuid(),
                    ContentId = ContentId,
                    Content = Content,
                    Recycle = 0,
                    Updated = Updated,
                    CreateUid = CreateUid,
                    CreateIP = CreateIP,
                    CreateDate = CreateDate,
                };
                operinfo.SetEntity(info);
                if (!await operinfo.Insert())
                {
                    throw new System.Exception("添加失败!");
                }
            }
            else
            {
                operinfo.GetEntity().ContentId = ContentId;
                operinfo.GetEntity().Content = Content;
                operinfo.GetEntity().Updated = Updated;
                operinfo.GetEntity().CreateUid = CreateUid;
                operinfo.GetEntity().CreateIP = CreateIP;
                operinfo.GetEntity().CreateDate = CreateDate;
                if (!await operinfo.Update())
                {
                    throw new System.Exception("更改失败!");
                }
            }
            return operinfo;
        }
        
        /// <summary>
        /// 返回带空实体的context
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        public static CommContext EmptyContext(IServiceProvider serviceProvider) {
            return new CommContext(serviceProvider, null, new Comm(serviceProvider));
        }
        
        /// <summary>
        /// 返回带空实体的context
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="db">数据层</param>
        public static CommContext EmptyContext(IServiceProvider serviceProvider, Comm db) {
            return new CommContext(serviceProvider, null, db);
        }
        
        /// <summary>
        /// 根据id获取数据
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="CommID">评论id</param>
        /// <returns></returns>
        public static async System.Threading.Tasks.Task<CommContext> GetInfo(
            IServiceProvider serviceProvider,
            GuidEntity CommID)
        {
            Culture.BusyData.Comm db = new Culture.BusyData.Comm(serviceProvider);
            Culture.Entity.CL_Comm entity = await db.GetInfo(CommID);
            return new CommContext(serviceProvider, entity, db);
        }
        /// <summary>
        /// 获取(空信息)
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="page">分页信息</param>
        /// <returns></returns>
        public static async System.Threading.Tasks.Task<List<CommContext>> GetListPage(
            IServiceProvider serviceProvider,
            PageInfo page)
        {
            Culture.BusyData.Comm db = new Culture.BusyData.Comm(serviceProvider);
            return await TransList(
                db.GetListPage(page), 
                t => { return new CommContext(serviceProvider, t, db); });
        }
        
        /// <summary>
        /// 获取主键id(多键抛错)
        /// </summary>
        /// <returns></returns>
        public GuidEntity GetKey()
        {
            if(IsEmpty())
                return GuidEntity.Empty;
            return entity.CommID;
        }
        
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <returns></returns>
        public override async System.Threading.Tasks.Task<bool> Delete()
        {
            if(!IsEmpty())
            {
                return await db.Delete(entity.CommID);
            }
            return false;
        }
        
        /// <summary>
        /// 添加数据
        /// </summary>
        /// <returns></returns>
        public override async System.Threading.Tasks.Task<bool> Insert()
        {
            if(!IsEmpty())
            {
                return await db.Insert(entity);
            }
            return false;
        }
        
        /// <summary>
        /// 更改数据
        /// </summary>
        /// <returns></returns>
        public override async System.Threading.Tasks.Task<bool> Update()
        {
            if(!IsEmpty())
            {
                return await db.Update(entity);
            }
            return false;
        }
        
        /// <summary>
        /// 重载数据
        /// </summary>
        public override async System.Threading.Tasks.Task Reload()
        {
            if(!IsEmpty())
            {
                entity=await db.GetInfo(entity.CommID);
            }
        }
        
        /// <summary>
        /// 更新内容id
        /// </summary>
        /// <param name="ContentId">内容id</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithContentId(GuidEntity ContentId)
        {
            if(IsEmpty())
                return false;
            entity.ContentId = ContentId;
            return await Update();
        }
        
        /// <summary>
        /// 更新内容
        /// </summary>
        /// <param name="Content">内容</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithContent(StringEntity Content)
        {
            if(IsEmpty())
                return false;
            entity.Content = Content;
            return await Update();
        }
        
        /// <summary>
        /// 从回收站回滚
        /// </summary>
        /// <returns></returns>
        public override async System.Threading.Tasks.Task<bool> RestoreFromRecycle()
        {
            if(IsEmpty())
                return false;
            entity.Recycle=0;
            return await Update();
        }
        
        /// <summary>
        /// 移动数据到回收站
        /// </summary>
        /// <returns></returns>
        public override async System.Threading.Tasks.Task<bool> MoveToRecycle()
        {
            if(IsEmpty())
                return false;
            entity.Recycle=1;
            return await Update();
        }
        
        /// <summary>
        /// 更新更新时间
        /// </summary>
        /// <param name="Updated">更新时间</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithUpdated(System.DateTime Updated)
        {
            if(IsEmpty())
                return false;
            entity.Updated = Updated;
            return await Update();
        }
        
        #endregion
    }
}
