/*
 Navicat Premium Data Transfer

 Source Server         : 东屹数旅test
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 192.168.110.31:3306
 Source Schema         : db_tourism

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 23/06/2020 10:48:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Fat_AppFileGroup
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileGroup`;
CREATE TABLE `Fat_AppFileGroup`  (
  `AFGid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用分组',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分组名称',
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`AFGid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限分组' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileGroupRelatDep
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileGroupRelatDep`;
CREATE TABLE `Fat_AppFileGroupRelatDep`  (
  `AFGid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组ID',
  `DepID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`AFGid`, `DepID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限分组与部门关系' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileGroupRelatPost
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileGroupRelatPost`;
CREATE TABLE `Fat_AppFileGroupRelatPost`  (
  `AFGid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组ID',
  `PtID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职务ID',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`AFGid`, `PtID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限分组与职务' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileGroupRelatStaff
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileGroupRelatStaff`;
CREATE TABLE `Fat_AppFileGroupRelatStaff`  (
  `AFGid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用分组',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业id',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Uid`, `Eid`, `AFGid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限分组与员工' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileInfo
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileInfo`;
CREATE TABLE `Fat_AppFileInfo`  (
  `Controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '控制器',
  `Module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块',
  `FileName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称(对应应用程序目录唯一)',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '功能名称',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`FileName`, `Controller`, `Module`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用文件信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileInfoRelatAppFileGroup
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileInfoRelatAppFileGroup`;
CREATE TABLE `Fat_AppFileInfoRelatAppFileGroup`  (
  `AFGid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用分组ID',
  `FileName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称(对应应用程序目录唯一)',
  `Controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '控制器',
  `Module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`AFGid`, `FileName`, `Controller`, `Module`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用文件与权限分组' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileInfoRelatPost
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileInfoRelatPost`;
CREATE TABLE `Fat_AppFileInfoRelatPost`  (
  `PtID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职务',
  `FileName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称(对应应用程序目录唯一)',
  `Controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '控制器',
  `Module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`PtID`, `FileName`, `Controller`, `Module`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用文件与职务' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppFileInfoRelatStaff
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppFileInfoRelatStaff`;
CREATE TABLE `Fat_AppFileInfoRelatStaff`  (
  `FileName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称(对应应用程序目录唯一)',
  `Controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '控制器',
  `Module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业id',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`FileName`, `Uid`, `Controller`, `Module`, `Eid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用文件与员工' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_AppInfo
-- ----------------------------
DROP TABLE IF EXISTS `Fat_AppInfo`;
CREATE TABLE `Fat_AppInfo`  (
  `Controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'mvc控制器',
  `Module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块或域',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应用功能名称',
  `Sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Controller`, `Module`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用目录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Attachment
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Attachment`;
CREATE TABLE `Fat_Attachment`  (
  `Aid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件id',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件标题(长度500)',
  `Remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件简要描述(长度2000)',
  `FilePath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件路径(相对附件目录下的路径,路径由程序而定)',
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '无限级分类(附件分类)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '附件信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Classification
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Classification`;
CREATE TABLE `Fat_Classification`  (
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无限级分类',
  `ParentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系ID(无父系值为0)',
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `Remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
  `Sort` bigint(0) NULL DEFAULT NULL COMMENT '排序',
  `UseType` int(0) NULL DEFAULT NULL COMMENT '使用类型(例如:新闻栏目,地区)',
  `ClidIndex` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '栏目索引',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属企业ID',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Clid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_ClassificationRelatPost
-- ----------------------------
DROP TABLE IF EXISTS `Fat_ClassificationRelatPost`;
CREATE TABLE `Fat_ClassificationRelatPost`  (
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无限级分类',
  `PtID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职务',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`PtID`, `Clid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类与职务信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_ClassificationRelatStaff
-- ----------------------------
DROP TABLE IF EXISTS `Fat_ClassificationRelatStaff`;
CREATE TABLE `Fat_ClassificationRelatStaff`  (
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无限级分类',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业id',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Clid`, `Uid`, `Eid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类与员工信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Department
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Department`;
CREATE TABLE `Fat_Department`  (
  `DepID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `Remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `ParentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系部门',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业',
  `DepType` int(0) NULL DEFAULT NULL COMMENT '部门类型(0:默认,其他扩展)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  PRIMARY KEY (`DepID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Enterprise
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Enterprise`;
CREATE TABLE `Fat_Enterprise`  (
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业',
  `ParentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系ID',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业名称',
  `EntType` int(0) NULL DEFAULT NULL COMMENT '企业类型(扩展,0:企业信息,1...)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Eid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '企业信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Log_Sms
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Log_Sms`;
CREATE TABLE `Fat_Log_Sms`  (
  `Phone` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '短信内容',
  `PassID` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口方账号',
  `Provider` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提供商',
  `Result` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结果',
  `IsError` int(0) NULL DEFAULT NULL COMMENT '是否错误(0:正常,1:错误)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '短信发送日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Noticeinfo
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Noticeinfo`;
CREATE TABLE `Fat_Noticeinfo`  (
  `NoticeID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知公告ID',
  `Title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `Type` int(0) NULL DEFAULT NULL COMMENT '类型1：通知公告2：紧急通知等，可以自己定义',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业ID',
  `Sort` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateIP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建IP',
  PRIMARY KEY (`NoticeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Post
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Post`;
CREATE TABLE `Fat_Post`  (
  `PtID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职务',
  `DepID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职务名称',
  `Remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`PtID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '职务信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_PostRelatUsers
-- ----------------------------
DROP TABLE IF EXISTS `Fat_PostRelatUsers`;
CREATE TABLE `Fat_PostRelatUsers`  (
  `PtID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职务(如果是0,则代表没有职务,这时需要查看DepID)',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户',
  `DepID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门id',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业',
  PRIMARY KEY (`PtID`, `Uid`, `Eid`, `DepID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '职务与员工信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_UserAuths
-- ----------------------------
DROP TABLE IF EXISTS `Fat_UserAuths`;
CREATE TABLE `Fat_UserAuths`  (
  `PassID` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '凭证信息(唯一)',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `IdentityType` int(0) NULL DEFAULT NULL COMMENT '凭证类型(0:系统,1:微信,2:指纹)',
  `PassWord` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '凭证密码',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建ip',
  PRIMARY KEY (`PassID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户登录授权信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_Users
-- ----------------------------
DROP TABLE IF EXISTS `Fat_Users`;
CREATE TABLE `Fat_Users`  (
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息',
  `RealName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名(100字符)',
  `Sex` int(0) NULL DEFAULT NULL COMMENT '性别(1:男,2:女)',
  `Phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `BirthDay` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `Special` tinyint(0) NULL DEFAULT NULL COMMENT '是否属于特殊账号(true:是,false:否)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Source` int(0) NULL DEFAULT NULL COMMENT '用户来源(0:注册,1:微信)',
  `UserType` int(0) NULL DEFAULT NULL COMMENT '用户类型(0:常规,其他扩展)',
  `Nationality` int(0) NULL DEFAULT NULL COMMENT '民族',
  `IdentityNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证',
  `AddressNow` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现居住地',
  `AddressCensus` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户籍地址',
  `CensusType` int(0) NULL DEFAULT NULL COMMENT '户籍类型(1:城市2:农业)',
  `ProfileFileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户基础信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_WeiXinConfig
-- ----------------------------
DROP TABLE IF EXISTS `Fat_WeiXinConfig`;
CREATE TABLE `Fat_WeiXinConfig`  (
  `AppID` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '微信应用ID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配置名称',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业id',
  `AppSecret` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应用密钥',
  `Gid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始id',
  `Token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前token',
  `TimeOut` int(0) NULL DEFAULT NULL COMMENT '超时',
  `GetTime` datetime(0) NULL DEFAULT NULL COMMENT '获取token的时间',
  `Token_K` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务器token_k',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建ip',
  PRIMARY KEY (`AppID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_WeiXinConfigWithJsApi
-- ----------------------------
DROP TABLE IF EXISTS `Fat_WeiXinConfigWithJsApi`;
CREATE TABLE `Fat_WeiXinConfigWithJsApi`  (
  `AppID` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '微信应用ID',
  `TimeOut` int(0) NULL DEFAULT NULL COMMENT 'jsapi超时时间(非结束时间)',
  `GetTime` datetime(0) NULL DEFAULT NULL COMMENT '微信获取配置时间',
  `Ticket` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '票据',
  `NonceStr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '随机字符串',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户id',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建ip',
  PRIMARY KEY (`AppID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信jsapi配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_WeiXinEvent_Log
-- ----------------------------
DROP TABLE IF EXISTS `Fat_WeiXinEvent_Log`;
CREATE TABLE `Fat_WeiXinEvent_Log`  (
  `ToUserName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开发者微信号',
  `FromUserName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送方账号(openid)',
  `MsgType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息类型',
  `Event` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '事件类型',
  `EventKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '事件key值',
  `Ticket` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '二维码的ticket，可用来换取二维码图片',
  `Latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地理位置纬度',
  `Longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地理位置经度',
  `LocationPrecision` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地理位置精度',
  `ResponseContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应内容',
  `CreateTime` datetime(0) NULL DEFAULT NULL COMMENT '消息创建时间(微信返回)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '日志生成时间',
  `CreateIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信事件日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_WeiXinMenu
-- ----------------------------
DROP TABLE IF EXISTS `Fat_WeiXinMenu`;
CREATE TABLE `Fat_WeiXinMenu`  (
  `MenuID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单id',
  `ParentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系菜单id',
  `AppID` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信appid',
  `MenuName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名',
  `MenuType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单类型(view,click)',
  `MenuKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单键',
  `Url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转url地址',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `CreateIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建ip',
  PRIMARY KEY (`MenuID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信菜单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for Fat_WeiXinSubscribe
-- ----------------------------
DROP TABLE IF EXISTS `Fat_WeiXinSubscribe`;
CREATE TABLE `Fat_WeiXinSubscribe`  (
  `Gid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '微信账号',
  `OpenID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户openid',
  `Subscribe` int(0) NULL DEFAULT NULL COMMENT '关注(0:未关注,1:关注)',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `Eid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业id',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建ip',
  PRIMARY KEY (`Gid`, `OpenID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信关注信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for SA_ClassificationForArea
-- ----------------------------
DROP TABLE IF EXISTS `SA_ClassificationForArea`;
CREATE TABLE `SA_ClassificationForArea`  (
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '无限级分类(扩展)',
  `ADCode` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'adcode',
  `CityCode` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区号',
  PRIMARY KEY (`Clid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '行政区域分类信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_Commodity
-- ----------------------------
DROP TABLE IF EXISTS `SA_Commodity`;
CREATE TABLE `SA_Commodity`  (
  `CDid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品管理',
  `Title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品标题',
  `Introduction` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品介绍',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '所需积分',
  `CountSwap` int(0) NULL DEFAULT NULL COMMENT '兑换数',
  `Total` int(0) NULL DEFAULT NULL COMMENT '总数',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`CDid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_Content
-- ----------------------------
DROP TABLE IF EXISTS `SA_Content`;
CREATE TABLE `SA_Content`  (
  `Cid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id(所属景区)',
  `TAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '观光区id',
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属类别',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容标题',
  `SmallTitle` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小标题',
  `CountLike` bigint(0) NULL DEFAULT NULL COMMENT '点赞统计',
  `Details` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容详情',
  `Remarks` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `Sort` bigint(0) NULL DEFAULT NULL COMMENT '排序',
  `CRAidForHeader` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头部信息(附件id)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '内容信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_ContentAtta
-- ----------------------------
DROP TABLE IF EXISTS `SA_ContentAtta`;
CREATE TABLE `SA_ContentAtta`  (
  `CRAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容附件id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件标题',
  `FilePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `AttaType` int(0) NULL DEFAULT NULL COMMENT '附件类型(0:图片,1:视频)',
  `FirstImageForVideo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频首图',
  `Description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简要说明',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`CRAid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '内容附件信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_Exploration
-- ----------------------------
DROP TABLE IF EXISTS `SA_Exploration`;
CREATE TABLE `SA_Exploration`  (
  `EXPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '探索id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `ParentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系id',
  `Icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标名称(文件名称)',
  `DisableIcon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标名称(文件名称),未启用',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '探索标题',
  `Prompt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '探索提示',
  `PromptImage` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务概览图(文件名称)',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '获得积分',
  `DescriptionForSuc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '探索成功描述',
  `DescriptionImageForSuc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '探索成功描述图',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`EXPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '探索信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_ExplorationForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_ExplorationForUsers`;
CREATE TABLE `SA_ExplorationForUsers`  (
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息',
  `EXPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '探索id',
  `Status` int(0) NULL DEFAULT NULL COMMENT '探索状态(0:未完成,1:完成)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Uid`, `EXPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户探索信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_Features
-- ----------------------------
DROP TABLE IF EXISTS `SA_Features`;
CREATE TABLE `SA_Features`  (
  `Fid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能区id',
  `Title` char(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '功能区名称',
  `Description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简要说明',
  `Remarks` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `IconForMap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地图图标',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景区功能信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_FootPrintForExplorationForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_FootPrintForExplorationForUsers`;
CREATE TABLE `SA_FootPrintForExplorationForUsers`  (
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息',
  `EXPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '探索id',
  `FPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户足迹id',
  `Status` int(0) NULL DEFAULT NULL COMMENT '探索状态(0:未完成,1:完成)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Uid`, `EXPid`, `FPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '探索足迹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_FootPrintForTaskWithExplorationForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_FootPrintForTaskWithExplorationForUsers`;
CREATE TABLE `SA_FootPrintForTaskWithExplorationForUsers`  (
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息',
  `FPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户足迹id',
  `Status` int(0) NULL DEFAULT NULL COMMENT '探索状态(0:未完成,1:完成)',
  `PerfectionContent` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完成内容(根据任务的模块id来识别该内容明细,比如:存多个id)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Tid`, `Uid`, `FPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务足迹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_FootPrintForUsersExWithPhoto
-- ----------------------------
DROP TABLE IF EXISTS `SA_FootPrintForUsersExWithPhoto`;
CREATE TABLE `SA_FootPrintForUsersExWithPhoto`  (
  `UFPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户照片id',
  `FPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户足迹id',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`UFPid`, `FPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '照片上传足迹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_FootPrintWithTrack
-- ----------------------------
DROP TABLE IF EXISTS `SA_FootPrintWithTrack`;
CREATE TABLE `SA_FootPrintWithTrack`  (
  `FPTid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '轨迹id',
  `FPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户足迹id',
  `Lng` decimal(20, 16) NULL DEFAULT NULL COMMENT '经度',
  `Lat` decimal(20, 16) NULL DEFAULT NULL COMMENT '维度',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`FPTid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户足迹轨迹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_GameForRead
-- ----------------------------
DROP TABLE IF EXISTS `SA_GameForRead`;
CREATE TABLE `SA_GameForRead`  (
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务id(扩展)',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容标题',
  `SmallTitle` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小标题',
  `CountLike` bigint(0) NULL DEFAULT NULL COMMENT '点赞统计',
  `Details` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容详情',
  PRIMARY KEY (`Tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游戏阅读' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_GameForReadAttr
-- ----------------------------
DROP TABLE IF EXISTS `SA_GameForReadAttr`;
CREATE TABLE `SA_GameForReadAttr`  (
  `TCid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '阅读附件',
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务id',
  `FileType` int(0) NULL DEFAULT NULL COMMENT '文件类型(0:图片,1:视频)',
  `FilePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`TCid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游戏阅读(附件)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_GameForTestBank
-- ----------------------------
DROP TABLE IF EXISTS `SA_GameForTestBank`;
CREATE TABLE `SA_GameForTestBank`  (
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务id',
  `TBid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目id',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Tid`, `TBid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_Hint
-- ----------------------------
DROP TABLE IF EXISTS `SA_Hint`;
CREATE TABLE `SA_Hint`  (
  `Hid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提示语id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `TAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '观光区id',
  `Title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提示语标题',
  `AreaType` int(0) NULL DEFAULT NULL COMMENT '区域类型(0:景区,1:观景区)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Hid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游客打卡提示语' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_KeyWord
-- ----------------------------
DROP TABLE IF EXISTS `SA_KeyWord`;
CREATE TABLE `SA_KeyWord`  (
  `KeyWord` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关键词',
  `Frequency` bigint(0) NULL DEFAULT NULL COMMENT '搜索次数',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`KeyWord`) USING BTREE,
  INDEX `INDEX_KeyWord_Frequency`(`KeyWord`, `Frequency`) USING BTREE,
  INDEX `INDEX_Frequency`(`Frequency`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_LevelForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_LevelForUsers`;
CREATE TABLE `SA_LevelForUsers`  (
  `LFUid` int(0) NOT NULL COMMENT '等级id',
  `TagName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签名称',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '所需积分',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`LFUid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分等级信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_ScenicArea
-- ----------------------------
DROP TABLE IF EXISTS `SA_ScenicArea`;
CREATE TABLE `SA_ScenicArea`  (
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点id',
  `Lng` decimal(20, 16) NULL DEFAULT NULL COMMENT '经度',
  `Lat` decimal(20, 16) NULL DEFAULT NULL COMMENT '维度',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `SmallTitle` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小标题',
  `Details` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详情',
  `Clid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属地区',
  `ClidForCivilization` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文化类别(多个类别使用|分开)',
  `Level` int(0) NULL DEFAULT NULL COMMENT '星数',
  `Collect` int(0) NULL DEFAULT NULL COMMENT '收藏数',
  `PriceForDoor` bigint(0) NULL DEFAULT NULL COMMENT '成人门票价格(分)',
  `PriceForDoorWithChild` bigint(0) NULL DEFAULT NULL COMMENT '儿童票价(分)',
  `HeaderImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首图(文件名)',
  `PinYin` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拼音名字',
  `BeginTimeForBusiness` time(0) NULL DEFAULT NULL COMMENT '开始营业时间',
  `EndTimeForBusiness` time(0) NULL DEFAULT NULL COMMENT '结束营业时间',
  `BgImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '背景宣传图',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`SAid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景区信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_ScenicAreaWithFeatures
-- ----------------------------
DROP TABLE IF EXISTS `SA_ScenicAreaWithFeatures`;
CREATE TABLE `SA_ScenicAreaWithFeatures`  (
  `SARFid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能区与景点关系id',
  `Fid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '功能区id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `Lng` decimal(20, 16) NULL DEFAULT NULL COMMENT '经度',
  `Lat` decimal(20, 16) NULL DEFAULT NULL COMMENT '维度',
  `DescriptionForSecPayment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '二次付费描述',
  `Description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简要说明',
  `PriceForSecPayment` bigint(0) NULL DEFAULT NULL COMMENT '二次付费价格(分),如果大于0代表需要二次付费',
  `HeaderImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首图(文件名)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`SARFid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景点功能区' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_ScenicAreaWithSignal
-- ----------------------------
DROP TABLE IF EXISTS `SA_ScenicAreaWithSignal`;
CREATE TABLE `SA_ScenicAreaWithSignal`  (
  `SASGLid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点信号id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `Lng` decimal(20, 16) NULL DEFAULT NULL COMMENT '经度',
  `Lat` decimal(20, 16) NULL DEFAULT NULL COMMENT '维度',
  `RadiusForTrigger` int(0) NULL DEFAULT NULL COMMENT '坐标触发半径',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`SASGLid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '景点地图位标信号' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_ShareImageForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_ShareImageForUsers`;
CREATE TABLE `SA_ShareImageForUsers`  (
  `TAIid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务分享图id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `Addr` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `Remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`TAIid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务分享图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_TaskWithExploration
-- ----------------------------
DROP TABLE IF EXISTS `SA_TaskWithExploration`;
CREATE TABLE `SA_TaskWithExploration`  (
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务id',
  `EXPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '探索id',
  `ParentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系id',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务标题',
  `Lng` decimal(20, 16) NULL DEFAULT NULL COMMENT '经度',
  `Lat` decimal(20, 16) NULL DEFAULT NULL COMMENT '维度',
  `RadiusForTrigger` int(0) NULL DEFAULT NULL COMMENT '坐标触发半径',
  `Prompt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务提示',
  `ModuleId` int(0) NULL DEFAULT NULL COMMENT '逻辑模块id',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '获得积分',
  `DescriptionForSuc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务成功描述',
  `DescriptionImageForSuc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务成功描述图',
  `IconForMap` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地图图标名称(文件名称)已解锁',
  `DisableIconForMap` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地图图标图标名称(文件名称),未解锁',
  `UnfinishedIconForMap` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地图图标名称(文件名),未完成',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_TaskWithExplorationForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_TaskWithExplorationForUsers`;
CREATE TABLE `SA_TaskWithExplorationForUsers`  (
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息',
  `Status` int(0) NULL DEFAULT NULL COMMENT '探索状态(0:未完成,1:完成)',
  `PerfectionContent` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完成内容(根据任务的模块id来识别该内容明细,比如:存多个id)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Tid`, `Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_TestBank
-- ----------------------------
DROP TABLE IF EXISTS `SA_TestBank`;
CREATE TABLE `SA_TestBank`  (
  `TBid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id(全0代表是通用题目)',
  `Title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目标题',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`TBid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游戏题库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_TestBankAnswer
-- ----------------------------
DROP TABLE IF EXISTS `SA_TestBankAnswer`;
CREATE TABLE `SA_TestBankAnswer`  (
  `TBAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '答案选项id',
  `TBid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目id',
  `Title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案标题',
  `IsTrue` tinyint(0) NULL DEFAULT NULL COMMENT '是否正确答案 0不是 1 是',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`TBAid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题库答案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_TestBankAnswerForUsers
-- ----------------------------
DROP TABLE IF EXISTS `SA_TestBankAnswerForUsers`;
CREATE TABLE `SA_TestBankAnswerForUsers`  (
  `TBid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目id',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点id',
  `Tid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `IsTrue` tinyint(0) NULL DEFAULT NULL COMMENT '是否回答正确 0错误 1正确',
  `Answer` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选择答案',
  `CountForAnswer` int(0) NULL DEFAULT NULL COMMENT '答题次数',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  PRIMARY KEY (`TBid`, `SAid`, `Tid`, `Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户答题记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_TouristArea
-- ----------------------------
DROP TABLE IF EXISTS `SA_TouristArea`;
CREATE TABLE `SA_TouristArea`  (
  `TAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '观光区id',
  `ParentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父系观光区id(所属观景区)',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id(所属景区)',
  `Lng` decimal(20, 16) NULL DEFAULT NULL COMMENT '经度',
  `Lat` decimal(20, 16) NULL DEFAULT NULL COMMENT '维度',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `Description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简要说明',
  `Remarks` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `DescriptionForSecPayment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '二次付费描述',
  `PriceForSecPayment` bigint(0) NULL DEFAULT NULL COMMENT '二次付费价格(分),如果大于零需要二次付费',
  `IconForMap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地图图标',
  `HeaderImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首图(文件名)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`TAid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '观光区(点)信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_UsersEx
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersEx`;
CREATE TABLE `SA_UsersEx`  (
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息(扩展)',
  `LFUid` int(0) NULL DEFAULT NULL COMMENT '等级id',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '总积分',
  `IntegralForCast` int(0) NULL DEFAULT NULL COMMENT '消耗积分',
  `EMail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'email地址',
  `ClidForArea` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在地区分类',
  `Collect` int(0) NULL DEFAULT NULL COMMENT '收藏数',
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户扩展' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_UsersExWithCollect
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersExWithCollect`;
CREATE TABLE `SA_UsersExWithCollect`  (
  `Dataid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息(扩展)',
  `DataType` int(0) NULL DEFAULT NULL COMMENT '数据类型(dataid会根据该类型检索数据)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Dataid`, `Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户收藏信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_UsersExWithCommodity
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersExWithCommodity`;
CREATE TABLE `SA_UsersExWithCommodity`  (
  `UCDid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户兑换id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户信息',
  `CDid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品管理',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '所需积分',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`UCDid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户商品兑换' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SA_UsersExWithFootPrint
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersExWithFootPrint`;
CREATE TABLE `SA_UsersExWithFootPrint`  (
  `FPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户足迹id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户信息',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '积分',
  `Pedometer` int(0) NULL DEFAULT NULL COMMENT '步数',
  `TimeForStay` int(0) NULL DEFAULT NULL COMMENT '分钟',
  `BeginTimeForStay` datetime(0) NULL DEFAULT NULL COMMENT '逗留开始时间',
  `EndTimeForStay` datetime(0) NULL DEFAULT NULL COMMENT '逗留结束时间',
  `PerfectionCountForTask` int(0) NULL DEFAULT NULL COMMENT '任务完成数',
  `PerfectionCountForExploration` int(0) NULL DEFAULT NULL COMMENT '探索完成数',
  `UploadPic` int(0) NULL DEFAULT NULL COMMENT '上传照片数',
  `Status` int(0) NULL DEFAULT NULL COMMENT '是否完成游玩(0:游玩未完成,1:游玩已完成)',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`FPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户足迹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_UsersExWithIntegral
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersExWithIntegral`;
CREATE TABLE `SA_UsersExWithIntegral`  (
  `INTid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '积分id',
  `FPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户足迹id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户信息',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `TAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '观光区id',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '积分',
  `INTTypeId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完成任务类型id(例如:任务id)',
  `INTType` int(0) NULL DEFAULT NULL COMMENT '积分类型(0:完成任务获得...)',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`INTid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_UsersExWithPhoto
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersExWithPhoto`;
CREATE TABLE `SA_UsersExWithPhoto`  (
  `UFPid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户照片id',
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户信息',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点id',
  `ImagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相片路径',
  `Recycle` tinyint(0) NULL DEFAULT NULL COMMENT '回收站',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`UFPid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户拍照相片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for SA_UsersExWithScenicArea
-- ----------------------------
DROP TABLE IF EXISTS `SA_UsersExWithScenicArea`;
CREATE TABLE `SA_UsersExWithScenicArea`  (
  `Uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户信息',
  `SAid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点id',
  `Integral` int(0) NULL DEFAULT NULL COMMENT '积分',
  `Pedometer` int(0) NULL DEFAULT NULL COMMENT '步数',
  `TimeForStay` int(0) NULL DEFAULT NULL COMMENT '分钟',
  `PerfectionCountForTask` int(0) NULL DEFAULT NULL COMMENT '任务完成数',
  `PerfectionCountForExploration` int(0) NULL DEFAULT NULL COMMENT '探索完成数',
  `UploadPic` int(0) NULL DEFAULT NULL COMMENT '上传照片数',
  `Updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '建立时间',
  `CreateIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建立IP',
  `CreateUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Uid`, `SAid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户所在景点信息统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- View structure for SV_AppFileGroupRelatDep
-- ----------------------------
DROP VIEW IF EXISTS `SV_AppFileGroupRelatDep`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_AppFileGroupRelatDep` AS select `AFGRDEP`.`AFGid` AS `AFGid`,`AFGRDEP`.`DepID` AS `DepID`,`AFGRDEP`.`CreateDate` AS `CreateDate`,`AFGRDEP`.`CreateIP` AS `CreateIP`,`AFGRDEP`.`CreateUid` AS `CreateUid`,`DEP`.`Name` AS `DEPName`,`DEP`.`Remark` AS `DEPRemark`,`DEP`.`ParentID` AS `DEPParentID`,`DEP`.`Eid` AS `DEPEid`,`DEP`.`Recycle` AS `DEPRecycle`,`DEP`.`CreateUid` AS `DEPCreateUid`,`DEP`.`CreateIP` AS `DEPCreateIP`,`DEP`.`CreateDate` AS `DEPCreateDate`,`AFG`.`Name` AS `AFGName`,`AFG`.`Description` AS `AFGDescription`,`AFG`.`Recycle` AS `AFGRecycle`,`AFG`.`CreateDate` AS `AFGCreateDate`,`AFG`.`CreateIP` AS `AFGCreateIP`,`AFG`.`CreateUid` AS `AFGCreateUid`,`DEP`.`DepType` AS `DEPDepType` from ((`Fat_AppFileGroupRelatDep` `AFGRDEP` join `Fat_AppFileGroup` `AFG` on((`AFG`.`AFGid` = `AFGRDEP`.`AFGid`))) join `Fat_Department` `DEP` on((`DEP`.`DepID` = `AFGRDEP`.`DepID`)));

-- ----------------------------
-- View structure for SV_AppFileInfoRelatAppFileGroup
-- ----------------------------
DROP VIEW IF EXISTS `SV_AppFileInfoRelatAppFileGroup`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_AppFileInfoRelatAppFileGroup` AS select `Fat_AppFileInfoRelatAppFileGroup`.`AFGid` AS `AFGid`,`Fat_AppFileInfoRelatAppFileGroup`.`FileName` AS `FileName`,`Fat_AppFileInfoRelatAppFileGroup`.`Controller` AS `Controller`,`Fat_AppFileInfoRelatAppFileGroup`.`Module` AS `Module`,`Fat_AppFileInfoRelatAppFileGroup`.`CreateDate` AS `CreateDate`,`Fat_AppFileInfoRelatAppFileGroup`.`CreateIP` AS `CreateIP`,`Fat_AppFileInfoRelatAppFileGroup`.`CreateUid` AS `CreateUid`,`AG`.`Name` AS `AGName`,`AG`.`Description` AS `AGDescription`,`AG`.`Recycle` AS `AGRecycle`,`AG`.`CreateDate` AS `AGCreateDate`,`AG`.`CreateIP` AS `AGCreateIP`,`AG`.`CreateUid` AS `AGCreateUid` from (`Fat_AppFileInfoRelatAppFileGroup` join `Fat_AppFileGroup` `AG` on((`Fat_AppFileInfoRelatAppFileGroup`.`AFGid` = `AG`.`AFGid`)));

-- ----------------------------
-- View structure for SV_PostRelatUsers
-- ----------------------------
DROP VIEW IF EXISTS `SV_PostRelatUsers`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_PostRelatUsers` AS select `PRU`.`PtID` AS `PtID`,`PRU`.`Uid` AS `Uid`,`PRU`.`DepID` AS `DepID`,`PRU`.`Eid` AS `Eid`,`UR`.`RealName` AS `URRealName`,`UR`.`Sex` AS `URSex`,`UR`.`Phone` AS `URPhone`,`UR`.`Special` AS `URSpecial`,`UR`.`Recycle` AS `URRecycle`,`UR`.`Source` AS `URSource`,`UR`.`CreateDate` AS `URCreateDate`,`UR`.`CreateIP` AS `URCreateIP`,`UR`.`CreateUid` AS `URCreateUid`,`UR`.`UserType` AS `URUserType`,`UR`.`BirthDay` AS `URBirthDay`,`UR`.`Nationality` AS `URNationality`,`UR`.`IdentityNumber` AS `URIdentityNumber`,`UR`.`AddressNow` AS `URAddressNow`,`UR`.`AddressCensus` AS `URAddressCensus`,`UR`.`CensusType` AS `URCensusType`,`UR`.`Updated` AS `URUpdated`,`UR`.`ProfileFileName` AS `URProfileFileName` from (`Fat_PostRelatUsers` `PRU` join `Fat_Users` `UR` on((`UR`.`Uid` = `PRU`.`Uid`)));

-- ----------------------------
-- View structure for SV_SA_ScenicAreaWithFeatures
-- ----------------------------
DROP VIEW IF EXISTS `SV_SA_ScenicAreaWithFeatures`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_SA_ScenicAreaWithFeatures` AS select `SA_ScenicAreaWithFeatures`.`SARFid` AS `SARFid`,`SA_ScenicAreaWithFeatures`.`Fid` AS `Fid`,`SA_ScenicAreaWithFeatures`.`SAid` AS `SAid`,`SA_ScenicAreaWithFeatures`.`Lng` AS `Lng`,`SA_ScenicAreaWithFeatures`.`Lat` AS `Lat`,`SA_ScenicAreaWithFeatures`.`DescriptionForSecPayment` AS `DescriptionForSecPayment`,`SA_ScenicAreaWithFeatures`.`Description` AS `Description`,`SA_ScenicAreaWithFeatures`.`PriceForSecPayment` AS `PriceForSecPayment`,`SA_ScenicAreaWithFeatures`.`Updated` AS `Updated`,`SA_ScenicAreaWithFeatures`.`Recycle` AS `Recycle`,`SA_ScenicAreaWithFeatures`.`CreateDate` AS `CreateDate`,`SA_ScenicAreaWithFeatures`.`CreateIP` AS `CreateIP`,`SA_ScenicAreaWithFeatures`.`CreateUid` AS `CreateUid`,`FT`.`Title` AS `FTTitle`,`FT`.`Description` AS `FTDescription`,`FT`.`Remarks` AS `FTRemarks`,`FT`.`Recycle` AS `FTRecycle`,`FT`.`Updated` AS `FTUpdated`,`FT`.`CreateDate` AS `FTCreateDate`,`FT`.`CreateIP` AS `FTCreateIP`,`FT`.`CreateUid` AS `FTCreateUid`,`SA`.`Lng` AS `SALng`,`SA`.`Lat` AS `SALat`,`SA`.`Title` AS `SATitle`,`SA`.`SmallTitle` AS `SASmallTitle`,`SA`.`Details` AS `SADetails`,`SA`.`Clid` AS `SAClid`,`SA`.`ClidForCivilization` AS `SAClidForCivilization`,`SA`.`Level` AS `SALevel`,`SA`.`Collect` AS `SACollect`,`SA`.`PinYin` AS `SAPinYin`,`SA`.`HeaderImage` AS `SAHeaderImage`,`SA`.`PriceForDoor` AS `SAPriceForDoor`,`SA`.`PriceForDoorWithChild` AS `SAPriceForDoorWithChild`,`SA`.`Recycle` AS `SARecycle`,`SA`.`Updated` AS `SAUpdated`,`SA`.`CreateDate` AS `SACreateDate`,`SA`.`CreateIP` AS `SACreateIP`,`SA`.`CreateUid` AS `SACreateUid`,`SA`.`BeginTimeForBusiness` AS `SABeginTimeForBusiness`,`SA`.`EndTimeForBusiness` AS `SAEndTimeForBusiness`,`FT`.`IconForMap` AS `FTIconForMap`,`SA`.`BgImage` AS `SABgImage`,`SA_ScenicAreaWithFeatures`.`HeaderImage` AS `HeaderImage` from ((`SA_ScenicAreaWithFeatures` join `SA_Features` `FT` on((`SA_ScenicAreaWithFeatures`.`Fid` = `FT`.`Fid`))) join `SA_ScenicArea` `SA` on((`SA_ScenicAreaWithFeatures`.`SAid` = `SA`.`SAid`)));

-- ----------------------------
-- View structure for SV_SA_UsersExWithFootPrint
-- ----------------------------
DROP VIEW IF EXISTS `SV_SA_UsersExWithFootPrint`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_SA_UsersExWithFootPrint` AS select `SA_UsersExWithFootPrint`.`FPid` AS `FPid`,`SA_UsersExWithFootPrint`.`Uid` AS `Uid`,`SA_UsersExWithFootPrint`.`SAid` AS `SAid`,`SA_UsersExWithFootPrint`.`Integral` AS `Integral`,`SA_UsersExWithFootPrint`.`Pedometer` AS `Pedometer`,`SA_UsersExWithFootPrint`.`TimeForStay` AS `TimeForStay`,`SA_UsersExWithFootPrint`.`BeginTimeForStay` AS `BeginTimeForStay`,`SA_UsersExWithFootPrint`.`EndTimeForStay` AS `EndTimeForStay`,`SA_UsersExWithFootPrint`.`PerfectionCountForTask` AS `PerfectionCountForTask`,`SA_UsersExWithFootPrint`.`PerfectionCountForExploration` AS `PerfectionCountForExploration`,`SA_UsersExWithFootPrint`.`UploadPic` AS `UploadPic`,`SA_UsersExWithFootPrint`.`Status` AS `Status`,`SA_UsersExWithFootPrint`.`Updated` AS `Updated`,`SA_UsersExWithFootPrint`.`CreateDate` AS `CreateDate`,`SA_UsersExWithFootPrint`.`CreateIP` AS `CreateIP`,`SA_UsersExWithFootPrint`.`CreateUid` AS `CreateUid`,`SA`.`Lng` AS `SALng`,`SA`.`Lat` AS `SALat`,`SA`.`Title` AS `SATitle`,`SA`.`SmallTitle` AS `SASmallTitle`,`SA`.`Details` AS `SADetails`,`SA`.`Clid` AS `SAClid`,`SA`.`ClidForCivilization` AS `SAClidForCivilization`,`SA`.`Level` AS `SALevel`,`SA`.`Collect` AS `SACollect`,`SA`.`PriceForDoor` AS `SAPriceForDoor`,`SA`.`PriceForDoorWithChild` AS `SAPriceForDoorWithChild`,`SA`.`HeaderImage` AS `SAHeaderImage`,`SA`.`PinYin` AS `SAPinYin`,`SA`.`BeginTimeForBusiness` AS `SABeginTimeForBusiness`,`SA`.`EndTimeForBusiness` AS `SAEndTimeForBusiness`,`SA`.`BgImage` AS `SABgImage`,`SA`.`Recycle` AS `SARecycle`,`SA`.`Updated` AS `SAUpdated`,`SA`.`CreateDate` AS `SACreateDate`,`SA`.`CreateIP` AS `SACreateIP`,`SA`.`CreateUid` AS `SACreateUid`,`CL`.`ParentID` AS `CLParentID`,`CL`.`Name` AS `CLName`,`CL`.`Remark` AS `CLRemark`,`CL`.`Sort` AS `CLSort`,`CL`.`UseType` AS `CLUseType`,`CL`.`ClidIndex` AS `CLClidIndex`,`CL`.`Eid` AS `CLEid`,`CL`.`Recycle` AS `CLRecycle`,`CL`.`Updated` AS `CLUpdated`,`CL`.`CreateDate` AS `CLCreateDate`,`CL`.`CreateIP` AS `CLCreateIP`,`CL`.`CreateUid` AS `CLCreateUid` from ((`SA_UsersExWithFootPrint` join `SA_ScenicArea` `SA` on((`SA_UsersExWithFootPrint`.`SAid` = `SA`.`SAid`))) join `Fat_Classification` `CL` on((`SA`.`Clid` = `CL`.`Clid`)));

-- ----------------------------
-- View structure for SV_Users
-- ----------------------------
DROP VIEW IF EXISTS `SV_Users`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_Users` AS select `Fat_Users`.`Uid` AS `Uid`,`Fat_Users`.`RealName` AS `RealName`,`Fat_Users`.`Sex` AS `Sex`,`Fat_Users`.`Phone` AS `Phone`,`Fat_Users`.`Special` AS `Special`,`Fat_Users`.`Recycle` AS `Recycle`,`Fat_Users`.`Source` AS `Source`,`Fat_Users`.`CreateDate` AS `CreateDate`,`Fat_Users`.`CreateIP` AS `CreateIP`,`Fat_Users`.`CreateUid` AS `CreateUid`,`UA`.`IdentityType` AS `IdentityType`,`UA`.`PassID` AS `PassID`,`UA`.`PassWord` AS `PassWord`,`UA`.`CreateUid` AS `UACreateUid`,`UA`.`CreateDate` AS `UACreateDate`,`UA`.`CreateIP` AS `UACreateIP`,`Fat_Users`.`UserType` AS `UserType`,`Fat_Users`.`BirthDay` AS `BirthDay`,`Fat_Users`.`Nationality` AS `Nationality`,`Fat_Users`.`IdentityNumber` AS `IdentityNumber`,`Fat_Users`.`AddressNow` AS `AddressNow`,`Fat_Users`.`AddressCensus` AS `AddressCensus`,`Fat_Users`.`CensusType` AS `CensusType`,`UA`.`Updated` AS `UAUpdated`,`Fat_Users`.`ProfileFileName` AS `ProfileFileName`,`Fat_Users`.`Updated` AS `Updated` from (`Fat_Users` join `Fat_UserAuths` `UA` on((`Fat_Users`.`Uid` = `UA`.`Uid`)));

-- ----------------------------
-- View structure for SV_WeiXinSubscribe
-- ----------------------------
DROP VIEW IF EXISTS `SV_WeiXinSubscribe`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `SV_WeiXinSubscribe` AS select `Fat_WeiXinSubscribe`.`OpenID` AS `OpenID`,`Fat_WeiXinSubscribe`.`Subscribe` AS `Subscribe`,`Fat_WeiXinSubscribe`.`Uid` AS `Uid`,`Fat_WeiXinSubscribe`.`Eid` AS `Eid`,`Fat_WeiXinSubscribe`.`CreateDate` AS `CreateDate`,`Fat_WeiXinSubscribe`.`CreateIP` AS `CreateIP`,`ET`.`Name` AS `ETName`,`ET`.`ParentID` AS `ETParentID`,`UR`.`RealName` AS `URRealName`,`UR`.`Sex` AS `URSex`,`UR`.`Phone` AS `URPhone`,`UR`.`Special` AS `URSpecial`,`UR`.`Recycle` AS `URRecycle`,`UR`.`Source` AS `URSource`,`UR`.`CreateDate` AS `URCreateDate`,`UR`.`CreateIP` AS `URCreateIP`,`UR`.`CreateUid` AS `URCreateUid`,`Fat_WeiXinSubscribe`.`Gid` AS `Gid`,`WXC`.`Name` AS `WXCName`,`WXC`.`AppID` AS `WXCAppID`,`WXC`.`AppSecret` AS `WXCAppSecret`,`WXC`.`Token` AS `WXCToken`,`WXC`.`TimeOut` AS `WXCTimeOut`,`WXC`.`GetTime` AS `WXCGetTime`,`WXC`.`CreateUid` AS `WXCCreateUid`,`WXC`.`CreateDate` AS `WXCCreateDate`,`WXC`.`CreateIP` AS `WXCCreateIP`,`WXC`.`Eid` AS `WXCEid`,`ET`.`CreateDate` AS `ETCreateDate`,`ET`.`CreateIP` AS `ETCreateIP`,`ET`.`CreateUid` AS `ETCreateUid`,`UR`.`UserType` AS `URUserType`,`Fat_WeiXinSubscribe`.`Updated` AS `Updated`,`ET`.`Recycle` AS `ETRecycle`,`ET`.`Updated` AS `ETUpdated`,`UR`.`BirthDay` AS `URBirthDay`,`UR`.`Updated` AS `URUpdated`,`UR`.`ProfileFileName` AS `URProfileFileName`,`UR`.`CensusType` AS `URCensusType`,`UR`.`AddressCensus` AS `URAddressCensus`,`UR`.`AddressNow` AS `URAddressNow`,`UR`.`IdentityNumber` AS `URIdentityNumber`,`UR`.`Nationality` AS `URNationality`,`WXC`.`Updated` AS `WXCUpdated`,`WXC`.`Token_K` AS `WXCToken_K`,`ET`.`EntType` AS `ETEntType` from (((`Fat_WeiXinSubscribe` join `Fat_Enterprise` `ET` on((`Fat_WeiXinSubscribe`.`Eid` = `ET`.`Eid`))) join `Fat_Users` `UR` on((`Fat_WeiXinSubscribe`.`Uid` = `UR`.`Uid`))) join `Fat_WeiXinConfig` `WXC` on((`WXC`.`Gid` = `Fat_WeiXinSubscribe`.`Gid`)));

-- ----------------------------
-- Function structure for Fun_ComputeDistance
-- ----------------------------
DROP FUNCTION IF EXISTS `Fun_ComputeDistance`;
delimiter ;;
CREATE FUNCTION `Fun_ComputeDistance`(`Lat` decimal(20,16),`Lng` decimal(20,16),`LatterLat` decimal(20,16),`LatterLng` decimal(20,16))
 RETURNS int
BEGIN
	#Routine body goes here...
DECLARE sum INT;
SET sum  =
		ROUND(
        6378.138 * 2 * ASIN(
            SQRT(
                POW(
                    SIN(
                        (
                            Lat * PI() / 180 -  LatterLat * PI() / 180
                        ) / 2
                    ),
                    2
                ) + COS(Lat * PI() / 180) * COS( LatterLat * PI() / 180) * POW(
                    SIN(
                        (
                            Lng * PI() / 180 - LatterLng * PI() / 180
                        ) / 2
                    ),
                    2
                )
            )
        ) * 1000
    );
	
	RETURN sum;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
