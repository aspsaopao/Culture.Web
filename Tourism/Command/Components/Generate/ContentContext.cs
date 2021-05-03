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
    public partial class ContentContext : AbModule<CL_Content, Content>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="entity">实体</param>
        /// <param name="db">数据层</param>
        protected ContentContext(
            IServiceProvider serviceProvider,
            CL_Content entity, 
            Content db) :
            base(serviceProvider, entity, db, "未找到!")
        {
        }
        
        #region 自动生成
        
        /// <summary>
        /// 处理函数
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="ContentId">内容id</param>
        /// <param name="Title">标题</param>
        /// <param name="Image">首图</param>
        /// <param name="Content">内容</param>
        /// <param name="Status">状态 0：未审核 1:审核通过 2：拒绝</param>
        /// <param name="Updated">更新时间</param>
        /// <param name="CreateUid">创建用户</param>
        /// <param name="CreateIP">建立IP</param>
        /// <param name="CreateDate">建立时间</param>
        /// <param name="Introduce">介绍</param>
        public static async System.Threading.Tasks.Task<ContentContext> Sub(
        IServiceProvider serviceProvider,
        GuidEntity ContentId
        ,StringEntity Title
                ,StringEntity Image
                ,StringEntity Content
                ,short Status
                ,System.DateTime Updated
                ,GuidEntity CreateUid
                ,StringEntity CreateIP
                ,System.DateTime CreateDate
                ,StringEntity Introduce
        )
        {
            ContentContext operinfo = await GetInfo(serviceProvider, ContentId);
            if (operinfo.IsEmpty())
            {
                Culture.Entity.CL_Content info = new Culture.Entity.CL_Content
                {
                    ContentId = operinfo.CreateGuid(),
                    Title = Title,
                    Image = Image,
                    Content = Content,
                    Status = Status,
                    Recycle = 0,
                    Updated = Updated,
                    CreateUid = CreateUid,
                    CreateIP = CreateIP,
                    CreateDate = CreateDate,
                    Introduce = Introduce,
                };
                operinfo.SetEntity(info);
                if (!await operinfo.Insert())
                {
                    throw new System.Exception("添加失败!");
                }
            }
            else
            {
                operinfo.GetEntity().Title = Title;
                operinfo.GetEntity().Image = Image;
                operinfo.GetEntity().Content = Content;
                operinfo.GetEntity().Status = Status;
                operinfo.GetEntity().Updated = Updated;
                operinfo.GetEntity().CreateUid = CreateUid;
                operinfo.GetEntity().CreateIP = CreateIP;
                operinfo.GetEntity().CreateDate = CreateDate;
                operinfo.GetEntity().Introduce = Introduce;
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
        public static ContentContext EmptyContext(IServiceProvider serviceProvider) {
            return new ContentContext(serviceProvider, null, new Content(serviceProvider));
        }
        
        /// <summary>
        /// 返回带空实体的context
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="db">数据层</param>
        public static ContentContext EmptyContext(IServiceProvider serviceProvider, Content db) {
            return new ContentContext(serviceProvider, null, db);
        }
        
        /// <summary>
        /// 根据id获取数据
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="ContentId">内容id</param>
        /// <returns></returns>
        public static async System.Threading.Tasks.Task<ContentContext> GetInfo(
            IServiceProvider serviceProvider,
            GuidEntity ContentId)
        {
            Culture.BusyData.Content db = new Culture.BusyData.Content(serviceProvider);
            Culture.Entity.CL_Content entity = await db.GetInfo(ContentId);
            return new ContentContext(serviceProvider, entity, db);
        }
        /// <summary>
        /// 获取(空信息)
        /// </summary>
        /// <param name="serviceProvider">依赖注入接口</param>
        /// <param name="page">分页信息</param>
        /// <returns></returns>
        public static async System.Threading.Tasks.Task<List<ContentContext>> GetListPage(
            IServiceProvider serviceProvider,
            PageInfo page)
        {
            Culture.BusyData.Content db = new Culture.BusyData.Content(serviceProvider);
            return await TransList(
                db.GetListPage(page), 
                t => { return new ContentContext(serviceProvider, t, db); });
        }
        
        /// <summary>
        /// 获取主键id(多键抛错)
        /// </summary>
        /// <returns></returns>
        public GuidEntity GetKey()
        {
            if(IsEmpty())
                return GuidEntity.Empty;
            return entity.ContentId;
        }
        
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <returns></returns>
        public override async System.Threading.Tasks.Task<bool> Delete()
        {
            if(!IsEmpty())
            {
                return await db.Delete(entity.ContentId);
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
                entity=await db.GetInfo(entity.ContentId);
            }
        }
        
        /// <summary>
        /// 更新标题
        /// </summary>
        /// <param name="Title">标题</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithTitle(StringEntity Title)
        {
            if(IsEmpty())
                return false;
            entity.Title = Title;
            return await Update();
        }
        
        /// <summary>
        /// 更新首图
        /// </summary>
        /// <param name="Image">首图</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithImage(StringEntity Image)
        {
            if(IsEmpty())
                return false;
            entity.Image = Image;
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
        /// 更新状态 0：未审核 1:审核通过 2：拒绝
        /// </summary>
        /// <param name="Status">状态 0：未审核 1:审核通过 2：拒绝</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithStatus(short Status)
        {
            if(IsEmpty())
                return false;
            entity.Status = Status;
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
        
        /// <summary>
        /// 更新介绍
        /// </summary>
        /// <param name="Introduce">介绍</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> UpdateWithIntroduce(StringEntity Introduce)
        {
            if(IsEmpty())
                return false;
            entity.Introduce = Introduce;
            return await Update();
        }
        
        #endregion
    }
}
