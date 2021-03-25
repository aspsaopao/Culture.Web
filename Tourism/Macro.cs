using System;
using System.Collections.Generic;
using System.Text;

namespace Culture
{
    /// <summary>
    /// 常量类
    /// </summary>
    public class Macro
    {
        /// <summary>
        /// 附近距离
        /// </summary>
        public const int DISTANCE = 10000;

        #region 小程序图
        /// <summary>
        /// 小程序二维码图
        /// </summary>
        public const string QRCODEIMG = "wwwroot/qrcode/gh_7d03de5db99f_430.jpg";
        /// <summary>
        /// 分享图 没有的话取这张
        /// </summary>
        public const string QRBACKIMAGEPATH = "wwwroot/qrcode/610f98861f4ea5687c214612839ca0a5.jpg";
        /// <summary>
        /// 
        /// </summary>
        public const string WWWROOT = "wwwroot";
        #endregion

        #region 目录

        /// <summary>
        /// 内容附件路径键
        /// </summary>
        public const string DIR_CONTENTATTR = "DIR_CONTENTATTR";

        /// <summary>
        /// 探索目录键
        /// </summary>
        public const string DIR_Exploration = "DIR_Exploration";

        /// <summary>
        /// 内容上传路径键
        /// </summary>
        public const string DIR_Content = "DIR_Content";

        /// <summary>
        /// 探索任务图标
        /// </summary>
        public const string DIR_TaskWithExploration = "DIR_TaskWithExploration";

        /// <summary>
        /// 地理附件目录键
        /// </summary>
        public const string DIR_LocationInfo = "DIR_LocationInfo";
        /// <summary>
        /// 观光点目录键
        /// </summary>
        public const string DIR_TouristArea = "DIR_TouristArea";

        /// <summary>
        /// 功能区目录
        /// </summary>
        public const string DIR_Features = "DIR_Features";

        /// <summary>
        /// 游戏阅读目录
        /// </summary>
        public const string DIR_GameForReadAttr = "DIR_GameForReadAttr";

        /// <summary>
        /// 用户照片路径
        /// </summary>
        public const string DIR_UsersForPhoto = "DIR_UsersForPhoto";

        /// <summary>
        /// 用户照片路径
        /// </summary>
        public const string DIR_ShareImage = "DIR_ShareImage";

        /// <summary>
        /// 风物图标
        /// </summary>
        public const string DIR_Article = "DIR_Article";
        /// <summary>
        /// 活动目录
        /// </summary>
        public const string DIR_Activity = "DIR_Activity";

        /// <summary>
        /// 知识点目录
        /// </summary>
        public const string DIR_Knowledge = "DIR_Knowledge";

        /// <summary>
        /// 攻略目录
        /// </summary>
        public const string DIR_Tips = "DIR_Tips";

        /// <summary>
        /// 区域图片目录
        /// </summary>
        public const string DIR_ClassificationForArea = "DIR_ClassificationForArea";
        /// <summary>
        /// 打卡点图片目录
        /// </summary>
        public const string DIR_UsersExWithPhoto = "DIR_UsersExWithPhoto";

        /// <summary>
        /// 非遗图片目录
        /// </summary>
        public const string DIR_IntangibleCulturalHeritage = "DIR_IntangibleCulturalHeritage";

        #endregion

        #region 分类类型

        /// <summary>
        /// 行政区划类型
        /// </summary>
        public const int CLID_AREA = 1;

        /// <summary>
        /// 内容分类
        /// </summary>
        public const int CLID_CONTENT = 2;

        /// <summary>
        /// 景区分类(类别)
        /// </summary>
        public const int CLID_Civilization = 3;

        /// <summary>
        /// 攻略主题分类
        /// </summary>
        public const int CLID_TipsForTheme = 4;
        /// <summary>
        /// 知识点分类
        /// </summary>
        public const int CLID_KnowledgeCivilization = 5;
        /// <summary>
        /// 地理位置信息分类类型
        /// </summary>
        public const int CLID_ClockPoint = 6;
        /// <summary>
        /// 非遗分类
        /// </summary>
        public const int CLID_IntangibleHeritage = 7;
        /// <summary>
        /// 帮助分类
        /// </summary>
        public const int CLID_Help = 8;
        /// <summary>
        /// 地理位置信息标签
        /// </summary>
        public const int CLID_AddressLabel = 9;
        /// <summary>
        /// 地理位置信息Poi分类
        /// </summary>
        public const int CLid_AddressPoiType = 10;

        #endregion

        #region 探索完成状态
        /// <summary>
        /// 完成
        /// </summary>
        public const int EXP_COMPLETE = 1;
        /// <summary>
        /// 未完成
        /// </summary>
        public const int EXP_UNDONE = 0;
        #endregion

        #region 任务完成状态
        /// <summary>
        /// 未完成
        /// </summary>
        public const int TASK_UNDONE = 0;
        /// <summary>
        /// 完成
        /// </summary>
        public const int TASK_COMPLETE = 1;
        /// <summary>
        /// 错过
        /// </summary>
        public const int TASK_MISS = 2;

        #endregion


        #region 附件类型
        /// <summary>
        /// 图片
        /// </summary>
        public const int CONTENTIMG = 0;
        /// <summary>
        /// 视频
        /// </summary>
        public const int CONTENTVIDEO = 1;
        #endregion

        #region 密码
        /// <summary>
        /// 初始密码
        /// </summary>
        public const string INITPASSWORD = "huayishulv#2020";
        #endregion

        #region http客户端
        /// <summary>
        /// http客户端
        /// </summary>
        public const string HTTPCLIENT = "HTTPCLIENT";

        /// <summary>
        /// 高德地图客户端
        /// </summary>
        public const string HTTPCLIENT_AMAP = "HTTPCLIENT_AMAP";

        /// <summary>
        /// 图片客户端
        /// </summary>
        public const string HTTPCLIENT_IMAGE = "HTTPCLIENT_IMAGE";

        /// <summary>
        /// 拉去token客户端
        /// </summary>
        public const string HTTPCLIENT_TOKEN = "HTTPCLIENT_TOKEN";
        #endregion;


        #region 扣除积分
        /// <summary>
        /// 扣除积分
        /// </summary>
        public const int DEDUCTIONINTEGRAL= 5;
        #endregion

        #region 搜索类型
        /// <summary>
        /// 景区
        /// </summary>
        public const int SEARCHTYPE_SCENIC = 1;
        /// <summary>
        /// 城市
        /// </summary>
        public const int SEARCHTYPE_CITY = 2;
        /// <summary>
        /// 攻略
        /// </summary>
        public const int SEARCHTYPE_TIPS = 3;

        #endregion

        #region 账号类型

        /// <summary>
        /// 微信openid
        /// </summary>
        public const int PASSIDTYPE_WX_OpenId = 1;

        /// <summary>
        /// 微信unionid
        /// </summary>
        public const int PASSIDTYPE_WX_UnionId = 2;

        /// <summary>
        /// 手机号
        /// </summary>
        public const int PASSIDTYPE_Phone = 3;
        /// <summary>
        /// IOS appleID
        /// </summary>
        public const int PASSIDTYPE_AppleId = 4;

        #endregion


        #region 关注状态

        /// <summary>
        /// 关注
        /// </summary>
        public const int ATTENTION_YES = 0;
        /// <summary>
        /// 不关注
        /// </summary>
        public const int ATTENTION_NO = 1;


        #endregion


        #region 是否快速打卡

        /// <summary>
        /// 不是
        /// </summary>
        public const int Clock_NoSpeed = 0;
        /// <summary>
        /// 是
        /// </summary>
        public const int Clock_YesSpeed = 1;


        #endregion 举报审核状态
        #region 举报审核
        /// <summary>
        /// 未处理
        /// </summary>
        public const int COMPLAINTS_UNTREATED = 0;
        /// <summary>
        /// 已处理违规
        /// </summary>
        public const int COMPLAINTS_VIOLATIONS = 1;
        /// <summary>
        /// 已处理不违规
        /// </summary>
        public const int COMPLAINTS_NOVIOLATIONS = 2;
        #endregion

        #region 监测名称
        /// <summary>
        /// 打开次数
        /// </summary>
        public const string AppOpenCount = "打开次数";
        /// <summary>
        /// 打开人数
        /// </summary>
        public const string AppOpenForPersonCount = "打开人数";
        /// <summary>
        /// 用户新增
        /// </summary>
        public const string AppUserNewCount = "用户新增";
        /// <summary>
        /// 攻略
        /// </summary>
        public const string AppForTipsCount = "攻略";
        /// <summary>
        /// 打卡
        /// </summary>
        public const string AppForClockCount = "打卡";
        /// <summary>
        /// 景区
        /// </summary>
        public const string AppForSceniceCount = "景区";

        #endregion

        #region 用户源

        /// <summary>
        /// 网站用户
        /// </summary>
        public const int USERSOURCE_Web = 0;

        /// <summary>
        /// 微信用户
        /// </summary>
        public const int USERSOURCE_WX = 1;

        /// <summary>
        /// 苹果用户
        /// </summary>
        public const int USERSOURCE_APPLE = 2;
        #endregion


        #region 消息推送文本

        /// <summary>
        /// 打开彩蛋
        /// </summary>
        public const string Push_EggsForOpen = "你的“彩蛋”已被打开，快去看看是谁>>";
        /// <summary>
        /// 指定彩蛋
        /// </summary>
        public const string Push_EggsForSpecified = "有人给你投放一颗“彩蛋”，快去看看是谁>>";
        /// <summary>
        /// 附近彩蛋
        /// </summary>
        public const string Push_EggsForDistance = "Hi,有人在你附近埋置了一个彩蛋，快去打开它>>";
        /// <summary>
        /// 点赞作品
        /// </summary>
        public const string Push_LikeWorks = "有人点赞了你的作品>>";



        #endregion
    }
}
