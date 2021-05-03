using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using NetCore;
using NetCore.Entity.Json;

namespace Culture.Entity
{
    /// <summary>
    /// 
    /// </summary>
    public class CL_Content
    {
        
        /// <summary>
        /// 内容id
        /// </summary>
        [JsonConverter(typeof(GuidEntityJsonConverter))]
        public GuidEntity ContentId
        {
            get;
            set;
        }
        
        /// <summary>
        /// 标题
        /// </summary>
        [JsonConverter(typeof(StringEntityJsonConverter))]
        public StringEntity Title
        {
            get;
            set;
        }
        
        /// <summary>
        /// 首图
        /// </summary>
        [JsonConverter(typeof(StringEntityJsonConverter))]
        public StringEntity Image
        {
            get;
            set;
        }
        
        /// <summary>
        /// 内容
        /// </summary>
        [JsonConverter(typeof(StringEntityJsonConverter))]
        public StringEntity Content
        {
            get;
            set;
        }
        
        /// <summary>
        /// 状态 0：未审核 1:审核通过 2：拒绝
        /// </summary>
        public short Status
        {
            get;
            set;
        }
        
        /// <summary>
        /// 回收站
        /// </summary>
        public short Recycle
        {
            get;
            set;
        }
        
        /// <summary>
        /// 更新时间
        /// </summary>
        public System.DateTime Updated
        {
            get;
            set;
        }
        
        /// <summary>
        /// 创建用户
        /// </summary>
        [JsonConverter(typeof(GuidEntityJsonConverter))]
        public GuidEntity CreateUid
        {
            get;
            set;
        }
        
        /// <summary>
        /// 建立IP
        /// </summary>
        [JsonConverter(typeof(StringEntityJsonConverter))]
        public StringEntity CreateIP
        {
            get;
            set;
        }
        
        /// <summary>
        /// 建立时间
        /// </summary>
        public System.DateTime CreateDate
        {
            get;
            set;
        }
        
        /// <summary>
        /// 介绍
        /// </summary>
        [JsonConverter(typeof(StringEntityJsonConverter))]
        public StringEntity Introduce
        {
            get;
            set;
        }
    }
}
