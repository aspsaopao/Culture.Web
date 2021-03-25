using NetCore;
using NetCore.Command;
using NetCore.Command.Components;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Culture.Factory
{
    /// <summary>
    /// 临时文件操作类
    /// </summary>
    public static class TempFile
    {

        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <param name="userInfo">用户信息</param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForUserTmp(this UsersContext userInfo)
        {
            return new UserTempDir(userInfo, "UserTmp/");
        }

        /// <summary>
        /// 获取内容附件临时目录信息
        /// </summary>
        /// <param name="userInfo">用户信息</param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForContentAttr(this UsersContext userInfo)
        {
            return new UserTempDir(userInfo, "ContentAttr/");
        }

        /// <summary>
        /// 探索临时文件
        /// </summary>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForExploration(this UsersContext userInfo)
        {
            return new UserTempDir(userInfo, "Exploration/");
        }

        /// <summary>
        /// 获取任务上传临时文件
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForTaskWithExploration(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "TaskWithExploration/");
        }

        /// <summary>
        /// 分享文件上传临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForShare(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Share/");
        }

        /// <summary>
        /// 反馈上传临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForFeedback(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Feedback/");
        }

        /// <summary>
        /// 景点临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForScenicArea(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "ScenicArea/");
        }

        /// <summary>
        /// 获取功能区临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForFeatures(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Features/");
        }

        /// <summary>
        /// 游戏阅读临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForGameForReadAttr(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "GameForReadAttr/");
        }

        /// <summary>
        /// 观景点临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForTouristArea(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "TouristArea/");
        }

        /// <summary>
        /// 获取风物临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForArticleInfo(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "ArticleInfo/");
        }

        /// <summary>
        /// 获取知识点临时目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForKnowledge(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Knowledge/");
        }

        /// <summary>
        /// 获取攻略临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForTips(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Tips/");
        }

        /// <summary>
        /// 获取区域临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForClassificationForArea(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "ClassificationForArea/");
        }

        /// <summary>
        /// 获取打卡图片临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForUsersExWithPhoto(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "UsersExWithPhoto/");
        }

        /// <summary>
        /// 获取非遗留临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForIntangibleHeritage(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "IntangibleHeritage/");
        }

        /// <summary>
        /// 获取信息临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForUsers(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Users/");
        }


        /// <summary>
        /// 获取系统附件临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForAtta(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Atta/");
        }

        /// <summary>
        /// 获取地理信息临时上传目录
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForLocationInfo(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "LocationInfo/");
        }

        /// <summary>
        /// 获取活动上传临时文件
        /// </summary>
        /// <param name="usersContext"></param>
        /// <returns></returns>
        public static UserTempDir GetUserTempDirForActivity(this UsersContext usersContext)
        {
            return new UserTempDir(usersContext, "Activity/");
        }


    }
}
