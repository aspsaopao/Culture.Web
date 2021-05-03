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
    public partial class Comm : Common
    {
        /// <summary>
        /// 数据层
        /// </summary>
        /// <param name="serviceProvider">依赖注入</param>
        public Comm(IServiceProvider serviceProvider) : base(serviceProvider) { }
        
        #region 自动生成
        
        
        /// <summary>
        /// 数据读取器
        /// </summary>
        /// <param name="row">数据游标</param>
        /// <returns></returns>
        public static CL_Comm DataReader(DbDataReader row)
        {
            return DataReaderEx<CL_Comm>(row);
        }
        
        /// <summary>
        /// 数据读取器
        /// </summary>
        /// <param name="row">数据游标</param>
        /// <typeparam name="T">数据类型</typeparam>
        /// <returns></returns>
        public static T DataReaderEx<T>(DbDataReader row) where T : CL_Comm, new()
        {
            T entity = new T
            {
                CommID = row.GetGuidEntityEx(row.GetOrdinal("CommID")),
                ContentId = row.GetGuidEntityEx(row.GetOrdinal("ContentId")),
                Content = row.GetStringEntityEx(row.GetOrdinal("Content")),
                Recycle = row.GetInt16Ex(row.GetOrdinal("Recycle")),
                Updated = row.GetDateTimeEx(row.GetOrdinal("Updated")),
                CreateUid = row.GetGuidEntityEx(row.GetOrdinal("CreateUid")),
                CreateIP = row.GetStringEntityEx(row.GetOrdinal("CreateIP")),
                CreateDate = row.GetDateTimeEx(row.GetOrdinal("CreateDate")),
            };
            return entity;
        }
        
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> Insert(CL_Comm entity)
        {
            string sql = $"insert into {ReName($"{Prefix}Comm")}({ReName("CommID")},{ReName("ContentId")},{ReName("Content")},{ReName("Recycle")},{ReName("Updated")},{ReName("CreateUid")},{ReName("CreateIP")},{ReName("CreateDate")})values(@CommID,@ContentId,@Content,@Recycle,@Updated,@CreateUid,@CreateIP,@CreateDate)";
            List<DbParameter> parlist = new List<DbParameter>();
            parlist.Add(CreateParam("@CommID",entity.CommID));
            parlist.Add(CreateParam("@ContentId",entity.ContentId));
            parlist.Add(CreateParam("@Content",entity.Content));
            parlist.Add(CreateParam("@Recycle",entity.Recycle));
            parlist.Add(CreateParam("@Updated",entity.Updated));
            parlist.Add(CreateParam("@CreateUid",entity.CreateUid));
            parlist.Add(CreateParam("@CreateIP",entity.CreateIP));
            parlist.Add(CreateParam("@CreateDate",entity.CreateDate));
            if(await ExecuteNonQueryMem(sql,parlist.ToArray()))
                return true;
            return false;
        }
        
        /// <summary>
        /// 更新数据
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> Update(CL_Comm entity)
        {
            string sql = $"update {ReName($"{Prefix}Comm")} set {ReName("ContentId")}=@ContentId,{ReName("Content")}=@Content,{ReName("Recycle")}=@Recycle,{ReName("Updated")}=@Updated where {ReName("CommID")}=@CommID";
            List<DbParameter> parlist = new List<DbParameter>();
            parlist.Add(CreateParam("@CommID",entity.CommID));
            parlist.Add(CreateParam("@ContentId",entity.ContentId));
            parlist.Add(CreateParam("@Content",entity.Content));
            parlist.Add(CreateParam("@Recycle",entity.Recycle));
            parlist.Add(CreateParam("@Updated",entity.Updated));
            return await ExecuteNonQueryMem(sql,parlist.ToArray());
        }
        
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="CommID">评论id</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<bool> Delete(GuidEntity CommID)
        {
            string sql = $"DELETE FROM {ReName($"{Prefix}Comm")} WHERE {ReName("CommID")}=@CommID;";
            List<DbParameter> parlist = new List<DbParameter>();
            parlist.Add(CreateParam("@CommID",CommID));
            return await ExecuteNonQueryMem(sql,parlist.ToArray());
        }
        
        /// <summary>
        /// 根据id获取数据
        /// </summary>
        /// <param name="CommID">评论id</param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<CL_Comm> GetInfo(GuidEntity CommID)
        {
            string sql = $"SELECT * FROM {ReName($"{Prefix}Comm")} WHERE {ReName("CommID")}=@CommID;";
            List<DbParameter> parlist = new List<DbParameter>();
            parlist.Add(CreateParam("@CommID",CommID));
            return await QueryInfo(sql,$"GetInfo:{CommID}",DataReader,parlist.ToArray());
        }
         
        #endregion
    }
}
