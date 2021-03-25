using NetStd.Interface.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models
{
    /// <summary>
    /// 列表模型
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class InfoModelList<T> : EntityList<T>
    {

        /// <summary>
        /// 列表模型
        /// </summary>
        public InfoModelList()
        {
            IsSuccess = true;
            Message = "操作成功!";
        }
    }
}
