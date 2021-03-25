using NetCore.Command.Components;
using NetCoreViewLib.Js;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Culture.Web.FilterController
{
    /// <summary>
    /// 数据树
    /// </summary>
    public static class TreeData
    {
        private static async Task FindParent(
            IServiceProvider serviceProvider,
            string selectId,
            List<string> outList)
        {
            var classInfo = await ClassificationContext.GetInfo(serviceProvider, selectId);
            if (classInfo.IsEmpty())
                return;
            outList.Add(classInfo.GetKey());
            await FindParent(serviceProvider, classInfo.GetEntity().ParentID, outList);
        }

        /// <summary>
        /// 拉取分类树
        /// </summary>
        /// <param name="useType"></param>
        /// <param name="selectIds"></param>
        /// <param name="serviceProvider">依赖注入</param>
        /// <returns></returns>
        public static async Task<List<Dictionary<string, object>>> PullTree(
    this IServiceProvider serviceProvider,
    int useType,
    params string[] selectIds)
        {
            var parentKeyList = new Dictionary<string, List<string>>();
            var resultForSelectIds = await Task.WhenAll(selectIds.Select(async T =>
             {
                 List<string> outList = new List<string>();
                 await FindParent(serviceProvider, T, outList);
                 return (T, outList);
             }));
            foreach (var resultInfo in resultForSelectIds)
            {
                if (resultInfo.T.IsNullOrEmpty())
                    continue;
                if (parentKeyList.ContainsKey(resultInfo.T))
                    continue;
                parentKeyList.TryAdd(resultInfo.T, resultInfo.outList);
            }
            var classList = await ClassificationContext.GetListPageWithUseType_ParentID(
                serviceProvider,
                new NetCore.PageInfo(0, 10000),
                useType,
                ClassificationContext.EmptyContext(serviceProvider));
            List<Dictionary<string, object>> outTree = new List<Dictionary<string, object>>();
            await JsTree.LoadWithzTree(
                serviceProvider,
                classList,
                outTree,
                async (treeData, itree) =>
                {
                    var treeId = await itree.TreeId();
                    if (parentKeyList.ContainsKey(treeId))
                    {
                        treeData["selected"] = true;
                        treeData["expanded"] = true;
                    }
                    else
                    {
                        treeData["selected"] = false;
                        var result = from KV in parentKeyList where KV.Value.Exists(V => V == treeId) select true;
                        if (result.Count() > 0)
                            treeData["expanded"] = true;
                        else
                            treeData["expanded"] = false;
                    }
                    treeData["title"] = await itree.TreeName();
                    treeData["key"] = await itree.TreeId();
                },
                true);
            return outTree;
        }
    }
}
