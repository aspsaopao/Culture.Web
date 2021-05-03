using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD
{
    /// <summary>
    /// 名称-类型
    /// </summary>
    public class TypeForName<T, U>
    {
        /// <summary>
        /// id
        /// </summary>
        public T Id { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public U Name { get; set; }
    }
}
