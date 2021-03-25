using NetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Culture.Factory
{
    /// <summary>
    /// 向量扩展类
    /// </summary>
    public static class VectorEx
    {
        /// <summary>
        /// 遍历树并返回所有节点
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="root"></param>
        /// <param name="outList"></param>
        public static async Task VectorOfTree<T>(this T root, List<T> outList) where T : ITree
        {
            if (root.IsEmpty())
                return;
            outList.Add(root);
            foreach (var child in await root.Children())
            {
                outList.Add((T)child);
                await VectorOfTree((T)child, outList);
            }
        }
    }
}
