using NetCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Culture.STD.Models.Content
{
    /// <summary>
    /// 首页返回列表
    /// </summary>
    public class OutPutContentInfoItem
    {
        /// <summary>
        /// id
        /// </summary>
        public string ContentId { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public  string Content { get; set; }
        /// <summary>
        /// 发布日期
        /// </summary>
        public string CreateTiem { get; set; }
        /// <summary>
        /// 首图
        /// </summary>
        public TempFileInfo HeadImage { get; set; }
        /// <summary>
        /// 介绍
        /// </summary>
        public string Introduce { get; set; }
        /// <summary>
        /// 审核状态
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 状态名称
        /// </summary>
        public  string StstusName { get; set; }
        /// <summary>
        /// 审核状态列表
        /// </summary>
        public List<TypeForName<int, string>> ExamineList { get; set; }
        /// <summary>
        /// 评论信息列表
        /// </summary>
        public List<Comminfo> CommList { get; set; }
    }
    /// <summary>
    /// 评论信息
    /// </summary>
    public class Comminfo
    {
        /// <summary>
        /// 评论人名字
        /// </summary>
        public  string Name { get; set; }
        /// <summary>
        /// 评论内容
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 评论日期
        /// </summary>
        public string DateTime { get; set; }

    }
}
