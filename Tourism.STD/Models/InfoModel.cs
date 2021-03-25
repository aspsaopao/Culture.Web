using NetStd.Interface.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models
{
    /// <summary>
    /// 模型
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class InfoModel<T> : EntityInfo<T>
    {

        /// <summary>
        /// 模型
        /// </summary>
        public InfoModel()
        {
            IsSuccess = true;
            Message = "操作成功!";
        }
    }
}
