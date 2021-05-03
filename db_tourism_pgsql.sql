/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.60_5432
 Source Server Type    : PostgreSQL
 Source Server Version : 120006
 Source Host           : 192.168.3.60:5432
 Source Catalog        : culture
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120006
 File Encoding         : 65001

 Date: 03/05/2021 15:57:24
*/


-- ----------------------------
-- Table structure for CL_Content
-- ----------------------------
DROP TABLE IF EXISTS "public"."CL_Content";
CREATE TABLE "public"."CL_Content" (
  "ContentId" uuid NOT NULL,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Image" varchar(255) COLLATE "pg_catalog"."default",
  "Content" text COLLATE "pg_catalog"."default",
  "Status" int2,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "Introduce" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."CL_Content"."ContentId" IS '内容id';
COMMENT ON COLUMN "public"."CL_Content"."Title" IS '标题';
COMMENT ON COLUMN "public"."CL_Content"."Image" IS '首图';
COMMENT ON COLUMN "public"."CL_Content"."Content" IS '内容';
COMMENT ON COLUMN "public"."CL_Content"."Status" IS '状态 0：未审核 1:审核通过 2：拒绝';
COMMENT ON COLUMN "public"."CL_Content"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."CL_Content"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."CL_Content"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."CL_Content"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."CL_Content"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."CL_Content"."Introduce" IS '介绍';

-- ----------------------------
-- Table structure for Fat_AppFileGroup
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileGroup";
CREATE TABLE "public"."Fat_AppFileGroup" (
  "AFGid" uuid NOT NULL,
  "Name" varchar(100) COLLATE "pg_catalog"."default",
  "Description" varchar(1000) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."AFGid" IS '应用分组';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."Name" IS '分组名称';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."Description" IS '描述';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileGroup"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileGroup" IS '权限分组';

-- ----------------------------
-- Table structure for Fat_AppFileGroupRelatDep
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileGroupRelatDep";
CREATE TABLE "public"."Fat_AppFileGroupRelatDep" (
  "AFGid" uuid NOT NULL,
  "DepID" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatDep"."AFGid" IS '分组ID';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatDep"."DepID" IS '部门';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatDep"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatDep"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatDep"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileGroupRelatDep" IS '权限分组与部门关系';

-- ----------------------------
-- Table structure for Fat_AppFileGroupRelatPost
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileGroupRelatPost";
CREATE TABLE "public"."Fat_AppFileGroupRelatPost" (
  "AFGid" uuid NOT NULL,
  "PtID" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatPost"."AFGid" IS '分组ID';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatPost"."PtID" IS '职务ID';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatPost"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatPost"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatPost"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileGroupRelatPost" IS '权限分组与职务';

-- ----------------------------
-- Table structure for Fat_AppFileGroupRelatStaff
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileGroupRelatStaff";
CREATE TABLE "public"."Fat_AppFileGroupRelatStaff" (
  "AFGid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "Eid" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatStaff"."AFGid" IS '应用分组';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatStaff"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatStaff"."Eid" IS '企业id';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatStaff"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatStaff"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileGroupRelatStaff"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileGroupRelatStaff" IS '权限分组与员工';

-- ----------------------------
-- Table structure for Fat_AppFileInfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileInfo";
CREATE TABLE "public"."Fat_AppFileInfo" (
  "Controller" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Module" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "FileName" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(100) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."Controller" IS '控制器';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."Module" IS '模块';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."FileName" IS '文件名称(对应应用程序目录唯一)';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."Name" IS '功能名称';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileInfo"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileInfo" IS '应用文件信息';

-- ----------------------------
-- Table structure for Fat_AppFileInfoRelatAppFileGroup
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileInfoRelatAppFileGroup";
CREATE TABLE "public"."Fat_AppFileInfoRelatAppFileGroup" (
  "AFGid" uuid NOT NULL,
  "FileName" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Controller" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Module" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."AFGid" IS '应用分组ID';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."FileName" IS '文件名称(对应应用程序目录唯一)';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."Controller" IS '控制器';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."Module" IS '模块';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatAppFileGroup"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileInfoRelatAppFileGroup" IS '应用文件与权限分组';

-- ----------------------------
-- Table structure for Fat_AppFileInfoRelatPost
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileInfoRelatPost";
CREATE TABLE "public"."Fat_AppFileInfoRelatPost" (
  "PtID" uuid NOT NULL,
  "FileName" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Controller" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Module" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."PtID" IS '职务';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."FileName" IS '文件名称(对应应用程序目录唯一)';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."Controller" IS '控制器';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."Module" IS '模块';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatPost"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileInfoRelatPost" IS '应用文件与职务';

-- ----------------------------
-- Table structure for Fat_AppFileInfoRelatStaff
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppFileInfoRelatStaff";
CREATE TABLE "public"."Fat_AppFileInfoRelatStaff" (
  "FileName" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Controller" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Module" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Uid" uuid NOT NULL,
  "Eid" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."FileName" IS '文件名称(对应应用程序目录唯一)';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."Controller" IS '控制器';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."Module" IS '模块';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."Eid" IS '企业id';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppFileInfoRelatStaff"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppFileInfoRelatStaff" IS '应用文件与员工';

-- ----------------------------
-- Table structure for Fat_AppInfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AppInfo";
CREATE TABLE "public"."Fat_AppInfo" (
  "Controller" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Module" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(191) COLLATE "pg_catalog"."default",
  "Sort" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AppInfo"."Controller" IS 'mvc控制器';
COMMENT ON COLUMN "public"."Fat_AppInfo"."Module" IS '模块或域';
COMMENT ON COLUMN "public"."Fat_AppInfo"."Name" IS '应用功能名称';
COMMENT ON COLUMN "public"."Fat_AppInfo"."Sort" IS '排序';
COMMENT ON COLUMN "public"."Fat_AppInfo"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_AppInfo"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AppInfo"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AppInfo"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AppInfo" IS '应用目录';

-- ----------------------------
-- Table structure for Fat_Attachment
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Attachment";
CREATE TABLE "public"."Fat_Attachment" (
  "Aid" uuid NOT NULL,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Remark" varchar(2000) COLLATE "pg_catalog"."default",
  "FilePath" varchar(200) COLLATE "pg_catalog"."default",
  "Clid" uuid,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_Attachment"."Aid" IS '附件id';
COMMENT ON COLUMN "public"."Fat_Attachment"."Title" IS '附件标题(长度500)';
COMMENT ON COLUMN "public"."Fat_Attachment"."Remark" IS '附件简要描述(长度2000)';
COMMENT ON COLUMN "public"."Fat_Attachment"."FilePath" IS '文件路径(相对附件目录下的路径,路径由程序而定)';
COMMENT ON COLUMN "public"."Fat_Attachment"."Clid" IS '无限级分类(附件分类)';
COMMENT ON COLUMN "public"."Fat_Attachment"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Attachment"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Attachment"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_Attachment"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Attachment"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_Attachment" IS '附件信息';

-- ----------------------------
-- Table structure for Fat_AttributesOfImage
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_AttributesOfImage";
CREATE TABLE "public"."Fat_AttributesOfImage" (
  "IAid" varchar(127) COLLATE "pg_catalog"."default" NOT NULL,
  "Extension" varchar(50) COLLATE "pg_catalog"."default",
  "Width" int4,
  "Height" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."IAid" IS '图片名(不包含扩展名)';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."Extension" IS '扩展名';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."Width" IS '宽度';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."Height" IS '高度';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_AttributesOfImage"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_AttributesOfImage" IS '图片属性';

-- ----------------------------
-- Table structure for Fat_Classification
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Classification";
CREATE TABLE "public"."Fat_Classification" (
  "Clid" uuid NOT NULL,
  "ParentID" uuid,
  "Name" varchar(200) COLLATE "pg_catalog"."default",
  "Remark" varchar(2000) COLLATE "pg_catalog"."default",
  "Sort" int8,
  "UseType" int4,
  "ClidIndex" varchar(200) COLLATE "pg_catalog"."default",
  "Eid" uuid,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_Classification"."Clid" IS '无限级分类';
COMMENT ON COLUMN "public"."Fat_Classification"."ParentID" IS '父系ID(无父系值为0)';
COMMENT ON COLUMN "public"."Fat_Classification"."Name" IS '分类名称';
COMMENT ON COLUMN "public"."Fat_Classification"."Remark" IS '分类描述';
COMMENT ON COLUMN "public"."Fat_Classification"."Sort" IS '排序';
COMMENT ON COLUMN "public"."Fat_Classification"."UseType" IS '使用类型(例如:新闻栏目,地区)';
COMMENT ON COLUMN "public"."Fat_Classification"."ClidIndex" IS '栏目索引';
COMMENT ON COLUMN "public"."Fat_Classification"."Eid" IS '所属企业ID';
COMMENT ON COLUMN "public"."Fat_Classification"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Classification"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Classification"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_Classification"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Classification"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_Classification" IS '分类信息';

-- ----------------------------
-- Table structure for Fat_ClassificationRelatPost
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_ClassificationRelatPost";
CREATE TABLE "public"."Fat_ClassificationRelatPost" (
  "Clid" uuid NOT NULL,
  "PtID" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_ClassificationRelatPost"."Clid" IS '无限级分类';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatPost"."PtID" IS '职务';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatPost"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatPost"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatPost"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_ClassificationRelatPost" IS '分类与职务信息';

-- ----------------------------
-- Table structure for Fat_ClassificationRelatStaff
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_ClassificationRelatStaff";
CREATE TABLE "public"."Fat_ClassificationRelatStaff" (
  "Clid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "Eid" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_ClassificationRelatStaff"."Clid" IS '无限级分类';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatStaff"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatStaff"."Eid" IS '企业id';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatStaff"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatStaff"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_ClassificationRelatStaff"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_ClassificationRelatStaff" IS '分类与员工信息';

-- ----------------------------
-- Table structure for Fat_Department
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Department";
CREATE TABLE "public"."Fat_Department" (
  "DepID" uuid NOT NULL,
  "Name" varchar(100) COLLATE "pg_catalog"."default",
  "Remark" varchar(2000) COLLATE "pg_catalog"."default",
  "ParentID" uuid,
  "Eid" uuid,
  "DepType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."Fat_Department"."DepID" IS '部门';
COMMENT ON COLUMN "public"."Fat_Department"."Name" IS '部门名称';
COMMENT ON COLUMN "public"."Fat_Department"."Remark" IS '说明';
COMMENT ON COLUMN "public"."Fat_Department"."ParentID" IS '父系部门';
COMMENT ON COLUMN "public"."Fat_Department"."Eid" IS '企业';
COMMENT ON COLUMN "public"."Fat_Department"."DepType" IS '部门类型(0:默认,其他扩展)';
COMMENT ON COLUMN "public"."Fat_Department"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Department"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Department"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."Fat_Department"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Department"."CreateDate" IS '建立时间';
COMMENT ON TABLE "public"."Fat_Department" IS '部门信息';

-- ----------------------------
-- Table structure for Fat_Enterprise
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Enterprise";
CREATE TABLE "public"."Fat_Enterprise" (
  "Eid" uuid NOT NULL,
  "ParentID" uuid,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "EntType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_Enterprise"."Eid" IS '企业';
COMMENT ON COLUMN "public"."Fat_Enterprise"."ParentID" IS '父系ID';
COMMENT ON COLUMN "public"."Fat_Enterprise"."Name" IS '企业名称';
COMMENT ON COLUMN "public"."Fat_Enterprise"."EntType" IS '企业类型(扩展,0:企业信息,1...)';
COMMENT ON COLUMN "public"."Fat_Enterprise"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Enterprise"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Enterprise"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_Enterprise"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Enterprise"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_Enterprise" IS '企业信息';

-- ----------------------------
-- Table structure for Fat_Log_Sms
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Log_Sms";
CREATE TABLE "public"."Fat_Log_Sms" (
  "Phone" varchar(250) COLLATE "pg_catalog"."default",
  "Content" text COLLATE "pg_catalog"."default",
  "PassID" varchar(500) COLLATE "pg_catalog"."default",
  "Provider" varchar(500) COLLATE "pg_catalog"."default",
  "Result" varchar(1000) COLLATE "pg_catalog"."default",
  "IsError" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_Log_Sms"."Phone" IS '电话号码';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."Content" IS '短信内容';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."PassID" IS '接口方账号';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."Provider" IS '提供商';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."Result" IS '结果';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."IsError" IS '是否错误(0:正常,1:错误)';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Log_Sms"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_Log_Sms" IS '短信发送日志';

-- ----------------------------
-- Table structure for Fat_Noticeinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Noticeinfo";
CREATE TABLE "public"."Fat_Noticeinfo" (
  "NoticeID" uuid NOT NULL,
  "Title" varchar(500) COLLATE "pg_catalog"."default",
  "Content" text COLLATE "pg_catalog"."default",
  "Type" int4,
  "Eid" uuid,
  "Sort" uuid,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(200) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."NoticeID" IS '通知公告ID';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Title" IS '标题';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Content" IS '内容';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Type" IS '类型1：通知公告2：紧急通知等，可以自己定义';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Eid" IS '企业ID';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Sort" IS '排序';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."Fat_Noticeinfo"."CreateIP" IS '创建IP';
COMMENT ON TABLE "public"."Fat_Noticeinfo" IS '通知信息';

-- ----------------------------
-- Table structure for Fat_Post
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Post";
CREATE TABLE "public"."Fat_Post" (
  "PtID" uuid NOT NULL,
  "DepID" uuid,
  "Name" varchar(100) COLLATE "pg_catalog"."default",
  "Remark" varchar(2000) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_Post"."PtID" IS '职务';
COMMENT ON COLUMN "public"."Fat_Post"."DepID" IS '部门';
COMMENT ON COLUMN "public"."Fat_Post"."Name" IS '职务名称';
COMMENT ON COLUMN "public"."Fat_Post"."Remark" IS '说明';
COMMENT ON COLUMN "public"."Fat_Post"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Post"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Post"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_Post"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Post"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_Post" IS '职务信息';

-- ----------------------------
-- Table structure for Fat_PostRelatUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_PostRelatUsers";
CREATE TABLE "public"."Fat_PostRelatUsers" (
  "PtID" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "DepID" uuid NOT NULL,
  "Eid" uuid NOT NULL
)
;
COMMENT ON COLUMN "public"."Fat_PostRelatUsers"."PtID" IS '职务(如果是0,则代表没有职务,这时需要查看DepID)';
COMMENT ON COLUMN "public"."Fat_PostRelatUsers"."Uid" IS '用户';
COMMENT ON COLUMN "public"."Fat_PostRelatUsers"."DepID" IS '部门id';
COMMENT ON COLUMN "public"."Fat_PostRelatUsers"."Eid" IS '企业';
COMMENT ON TABLE "public"."Fat_PostRelatUsers" IS '职务与员工信息';

-- ----------------------------
-- Table structure for Fat_UserAuths
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_UserAuths";
CREATE TABLE "public"."Fat_UserAuths" (
  "PassID" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Uid" uuid,
  "IdentityType" int4,
  "PassWord" varchar(300) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_UserAuths"."PassID" IS '凭证信息(唯一)';
COMMENT ON COLUMN "public"."Fat_UserAuths"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."Fat_UserAuths"."IdentityType" IS '凭证类型(0:系统,1:微信,2:指纹)';
COMMENT ON COLUMN "public"."Fat_UserAuths"."PassWord" IS '凭证密码';
COMMENT ON COLUMN "public"."Fat_UserAuths"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_UserAuths"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."Fat_UserAuths"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."Fat_UserAuths"."CreateIP" IS '创建ip';
COMMENT ON TABLE "public"."Fat_UserAuths" IS '用户登录授权信息';

-- ----------------------------
-- Table structure for Fat_Users
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_Users";
CREATE TABLE "public"."Fat_Users" (
  "Uid" uuid NOT NULL,
  "RealName" varchar(300) COLLATE "pg_catalog"."default",
  "Sex" int4,
  "Phone" varchar(255) COLLATE "pg_catalog"."default",
  "BirthDay" timestamp(6),
  "Special" int2,
  "Recycle" int2,
  "Source" int4,
  "UserType" int4,
  "Nationality" int4,
  "IdentityNumber" varchar(20) COLLATE "pg_catalog"."default",
  "AddressNow" varchar(512) COLLATE "pg_catalog"."default",
  "AddressCensus" varchar(512) COLLATE "pg_catalog"."default",
  "CensusType" int4,
  "ProfileFileName" varchar(100) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."Fat_Users"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."Fat_Users"."RealName" IS '真实姓名(100字符)';
COMMENT ON COLUMN "public"."Fat_Users"."Sex" IS '性别(1:男,2:女)';
COMMENT ON COLUMN "public"."Fat_Users"."Phone" IS '手机号码';
COMMENT ON COLUMN "public"."Fat_Users"."BirthDay" IS '生日';
COMMENT ON COLUMN "public"."Fat_Users"."Special" IS '是否属于特殊账号(true:是,false:否)';
COMMENT ON COLUMN "public"."Fat_Users"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."Fat_Users"."Source" IS '用户来源(0:注册,1:微信)';
COMMENT ON COLUMN "public"."Fat_Users"."UserType" IS '用户类型(0:常规,其他扩展)';
COMMENT ON COLUMN "public"."Fat_Users"."Nationality" IS '民族';
COMMENT ON COLUMN "public"."Fat_Users"."IdentityNumber" IS '身份证';
COMMENT ON COLUMN "public"."Fat_Users"."AddressNow" IS '现居住地';
COMMENT ON COLUMN "public"."Fat_Users"."AddressCensus" IS '户籍地址';
COMMENT ON COLUMN "public"."Fat_Users"."CensusType" IS '户籍类型(1:城市2:农业)';
COMMENT ON COLUMN "public"."Fat_Users"."ProfileFileName" IS '用户头像';
COMMENT ON COLUMN "public"."Fat_Users"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_Users"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."Fat_Users"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."Fat_Users"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."Fat_Users" IS '用户基础信息';

-- ----------------------------
-- Table structure for Fat_WeiXinConfig
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_WeiXinConfig";
CREATE TABLE "public"."Fat_WeiXinConfig" (
  "AppID" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(500) COLLATE "pg_catalog"."default",
  "Eid" uuid,
  "AppSecret" varchar(500) COLLATE "pg_catalog"."default",
  "Gid" varchar(200) COLLATE "pg_catalog"."default",
  "Token" varchar(200) COLLATE "pg_catalog"."default",
  "TimeOut" int4,
  "GetTime" timestamp(6),
  "Token_K" varchar(512) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."AppID" IS '微信应用ID';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."Name" IS '配置名称';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."Eid" IS '企业id';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."AppSecret" IS '应用密钥';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."Gid" IS '原始id';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."Token" IS '当前token';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."TimeOut" IS '超时';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."GetTime" IS '获取token的时间';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."Token_K" IS '服务器token_k';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."CreateUid" IS '创建人';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."Fat_WeiXinConfig"."CreateIP" IS '创建ip';
COMMENT ON TABLE "public"."Fat_WeiXinConfig" IS '微信配置';

-- ----------------------------
-- Table structure for Fat_WeiXinConfigWithJsApi
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_WeiXinConfigWithJsApi";
CREATE TABLE "public"."Fat_WeiXinConfigWithJsApi" (
  "AppID" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "TimeOut" int4,
  "GetTime" timestamp(6),
  "Ticket" varchar(500) COLLATE "pg_catalog"."default",
  "NonceStr" varchar(500) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."AppID" IS '微信应用ID';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."TimeOut" IS 'jsapi超时时间(非结束时间)';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."GetTime" IS '微信获取配置时间';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."Ticket" IS '票据';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."NonceStr" IS '随机字符串';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."CreateUid" IS '创建用户id';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."Fat_WeiXinConfigWithJsApi"."CreateIP" IS '创建ip';
COMMENT ON TABLE "public"."Fat_WeiXinConfigWithJsApi" IS '微信jsapi配置';

-- ----------------------------
-- Table structure for Fat_WeiXinEvent_Log
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_WeiXinEvent_Log";
CREATE TABLE "public"."Fat_WeiXinEvent_Log" (
  "ToUserName" varchar(500) COLLATE "pg_catalog"."default",
  "FromUserName" varchar(500) COLLATE "pg_catalog"."default",
  "MsgType" varchar(200) COLLATE "pg_catalog"."default",
  "Event" varchar(200) COLLATE "pg_catalog"."default",
  "EventKey" varchar(200) COLLATE "pg_catalog"."default",
  "Ticket" varchar(200) COLLATE "pg_catalog"."default",
  "Latitude" varchar(100) COLLATE "pg_catalog"."default",
  "Longitude" varchar(100) COLLATE "pg_catalog"."default",
  "LocationPrecision" varchar(100) COLLATE "pg_catalog"."default",
  "ResponseContent" text COLLATE "pg_catalog"."default",
  "CreateTime" timestamp(6),
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."ToUserName" IS '开发者微信号';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."FromUserName" IS '发送方账号(openid)';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."MsgType" IS '消息类型';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."Event" IS '事件类型';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."EventKey" IS '事件key值';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."Ticket" IS '二维码的ticket，可用来换取二维码图片';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."Latitude" IS '地理位置纬度';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."Longitude" IS '地理位置经度';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."LocationPrecision" IS '地理位置精度';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."ResponseContent" IS '响应内容';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."CreateTime" IS '消息创建时间(微信返回)';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_WeiXinEvent_Log"."CreateDate" IS '日志生成时间';
COMMENT ON TABLE "public"."Fat_WeiXinEvent_Log" IS '微信事件日志';

-- ----------------------------
-- Table structure for Fat_WeiXinMenu
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_WeiXinMenu";
CREATE TABLE "public"."Fat_WeiXinMenu" (
  "MenuID" uuid NOT NULL,
  "ParentID" uuid,
  "AppID" varchar(191) COLLATE "pg_catalog"."default",
  "MenuName" varchar(500) COLLATE "pg_catalog"."default",
  "MenuType" varchar(200) COLLATE "pg_catalog"."default",
  "MenuKey" varchar(200) COLLATE "pg_catalog"."default",
  "Url" varchar(1000) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."MenuID" IS '菜单id';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."ParentID" IS '父系菜单id';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."AppID" IS '微信appid';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."MenuName" IS '菜单名';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."MenuType" IS '菜单类型(view,click)';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."MenuKey" IS '菜单键';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."Url" IS '跳转url地址';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."CreateUid" IS '用户id';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."CreateDate" IS '创建日期';
COMMENT ON COLUMN "public"."Fat_WeiXinMenu"."CreateIP" IS '创建ip';
COMMENT ON TABLE "public"."Fat_WeiXinMenu" IS '微信菜单';

-- ----------------------------
-- Table structure for Fat_WeiXinSubscribe
-- ----------------------------
DROP TABLE IF EXISTS "public"."Fat_WeiXinSubscribe";
CREATE TABLE "public"."Fat_WeiXinSubscribe" (
  "Gid" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "OpenID" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "Subscribe" int4,
  "Uid" uuid,
  "Eid" uuid,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."Gid" IS '微信账号';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."OpenID" IS '用户openid';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."Subscribe" IS '关注(0:未关注,1:关注)';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."Eid" IS '企业id';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."Fat_WeiXinSubscribe"."CreateIP" IS '创建ip';
COMMENT ON TABLE "public"."Fat_WeiXinSubscribe" IS '微信关注信息';

-- ----------------------------
-- Function structure for Fun_ComputeDistance
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."Fun_ComputeDistance"("lat" numeric, "lng" numeric, "latterlat" numeric, "latterlng" numeric);
CREATE OR REPLACE FUNCTION "public"."Fun_ComputeDistance"("lat" numeric, "lng" numeric, "latterlat" numeric, "latterlng" numeric)
  RETURNS "pg_catalog"."int8" AS $BODY$
	DECLARE sm "pg_catalog"."int8";
	BEGIN
	-- Routine body goes here...
  sm  :=ROUND(
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
	RETURN sm;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- View structure for SV_AppFileGroupRelatDep
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_AppFileGroupRelatDep";
CREATE VIEW "public"."SV_AppFileGroupRelatDep" AS  SELECT "AFGRDEP"."AFGid",
    "AFGRDEP"."DepID",
    "AFGRDEP"."CreateDate",
    "AFGRDEP"."CreateIP",
    "AFGRDEP"."CreateUid",
    "DEP"."Name" AS "DEPName",
    "DEP"."Remark" AS "DEPRemark",
    "DEP"."ParentID" AS "DEPParentID",
    "DEP"."Eid" AS "DEPEid",
    "DEP"."Recycle" AS "DEPRecycle",
    "DEP"."CreateUid" AS "DEPCreateUid",
    "DEP"."CreateIP" AS "DEPCreateIP",
    "DEP"."CreateDate" AS "DEPCreateDate",
    "AFG"."Name" AS "AFGName",
    "AFG"."Description" AS "AFGDescription",
    "AFG"."Recycle" AS "AFGRecycle",
    "AFG"."CreateDate" AS "AFGCreateDate",
    "AFG"."CreateIP" AS "AFGCreateIP",
    "AFG"."CreateUid" AS "AFGCreateUid",
    "DEP"."DepType" AS "DEPDepType"
   FROM "Fat_AppFileGroupRelatDep" "AFGRDEP"
     JOIN "Fat_AppFileGroup" "AFG" ON "AFG"."AFGid" = "AFGRDEP"."AFGid"
     JOIN "Fat_Department" "DEP" ON "DEP"."DepID" = "AFGRDEP"."DepID";

-- ----------------------------
-- View structure for SV_AppFileInfoRelatAppFileGroup
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_AppFileInfoRelatAppFileGroup";
CREATE VIEW "public"."SV_AppFileInfoRelatAppFileGroup" AS  SELECT "Fat_AppFileInfoRelatAppFileGroup"."AFGid",
    "Fat_AppFileInfoRelatAppFileGroup"."FileName",
    "Fat_AppFileInfoRelatAppFileGroup"."Controller",
    "Fat_AppFileInfoRelatAppFileGroup"."Module",
    "Fat_AppFileInfoRelatAppFileGroup"."CreateDate",
    "Fat_AppFileInfoRelatAppFileGroup"."CreateIP",
    "Fat_AppFileInfoRelatAppFileGroup"."CreateUid",
    "AG"."Name" AS "AGName",
    "AG"."Description" AS "AGDescription",
    "AG"."Recycle" AS "AGRecycle",
    "AG"."CreateDate" AS "AGCreateDate",
    "AG"."CreateIP" AS "AGCreateIP",
    "AG"."CreateUid" AS "AGCreateUid"
   FROM "Fat_AppFileInfoRelatAppFileGroup"
     JOIN "Fat_AppFileGroup" "AG" ON "Fat_AppFileInfoRelatAppFileGroup"."AFGid" = "AG"."AFGid";

-- ----------------------------
-- View structure for SV_PostRelatUsers
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_PostRelatUsers";
CREATE VIEW "public"."SV_PostRelatUsers" AS  SELECT "PRU"."PtID",
    "PRU"."Uid",
    "PRU"."DepID",
    "PRU"."Eid",
    "UR"."RealName" AS "URRealName",
    "UR"."Sex" AS "URSex",
    "UR"."Phone" AS "URPhone",
    "UR"."Special" AS "URSpecial",
    "UR"."Recycle" AS "URRecycle",
    "UR"."Source" AS "URSource",
    "UR"."CreateDate" AS "URCreateDate",
    "UR"."CreateIP" AS "URCreateIP",
    "UR"."CreateUid" AS "URCreateUid",
    "UR"."UserType" AS "URUserType",
    "UR"."BirthDay" AS "URBirthDay",
    "UR"."Nationality" AS "URNationality",
    "UR"."IdentityNumber" AS "URIdentityNumber",
    "UR"."AddressNow" AS "URAddressNow",
    "UR"."AddressCensus" AS "URAddressCensus",
    "UR"."CensusType" AS "URCensusType",
    "UR"."Updated" AS "URUpdated",
    "UR"."ProfileFileName" AS "URProfileFileName"
   FROM "Fat_PostRelatUsers" "PRU"
     JOIN "Fat_Users" "UR" ON "UR"."Uid" = "PRU"."Uid";

-- ----------------------------
-- View structure for SV_Users
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_Users";
CREATE VIEW "public"."SV_Users" AS  SELECT "Fat_Users"."Uid",
    "Fat_Users"."RealName",
    "Fat_Users"."Sex",
    "Fat_Users"."Phone",
    "Fat_Users"."Special",
    "Fat_Users"."Recycle",
    "Fat_Users"."Source",
    "Fat_Users"."CreateDate",
    "Fat_Users"."CreateIP",
    "Fat_Users"."CreateUid",
    "UA"."IdentityType",
    "UA"."PassID",
    "UA"."PassWord",
    "UA"."CreateUid" AS "UACreateUid",
    "UA"."CreateDate" AS "UACreateDate",
    "UA"."CreateIP" AS "UACreateIP",
    "Fat_Users"."UserType",
    "Fat_Users"."BirthDay",
    "Fat_Users"."Nationality",
    "Fat_Users"."IdentityNumber",
    "Fat_Users"."AddressNow",
    "Fat_Users"."AddressCensus",
    "Fat_Users"."CensusType",
    "UA"."Updated" AS "UAUpdated",
    "Fat_Users"."ProfileFileName",
    "Fat_Users"."Updated"
   FROM "Fat_Users"
     JOIN "Fat_UserAuths" "UA" ON "Fat_Users"."Uid" = "UA"."Uid";

-- ----------------------------
-- View structure for SV_WeiXinSubscribe
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_WeiXinSubscribe";
CREATE VIEW "public"."SV_WeiXinSubscribe" AS  SELECT "Fat_WeiXinSubscribe"."OpenID",
    "Fat_WeiXinSubscribe"."Subscribe",
    "Fat_WeiXinSubscribe"."Uid",
    "Fat_WeiXinSubscribe"."Eid",
    "Fat_WeiXinSubscribe"."CreateDate",
    "Fat_WeiXinSubscribe"."CreateIP",
    "ET"."Name" AS "ETName",
    "ET"."ParentID" AS "ETParentID",
    "UR"."RealName" AS "URRealName",
    "UR"."Sex" AS "URSex",
    "UR"."Phone" AS "URPhone",
    "UR"."Special" AS "URSpecial",
    "UR"."Recycle" AS "URRecycle",
    "UR"."Source" AS "URSource",
    "UR"."CreateDate" AS "URCreateDate",
    "UR"."CreateIP" AS "URCreateIP",
    "UR"."CreateUid" AS "URCreateUid",
    "Fat_WeiXinSubscribe"."Gid",
    "WXC"."Name" AS "WXCName",
    "WXC"."AppID" AS "WXCAppID",
    "WXC"."AppSecret" AS "WXCAppSecret",
    "WXC"."Token" AS "WXCToken",
    "WXC"."TimeOut" AS "WXCTimeOut",
    "WXC"."GetTime" AS "WXCGetTime",
    "WXC"."CreateUid" AS "WXCCreateUid",
    "WXC"."CreateDate" AS "WXCCreateDate",
    "WXC"."CreateIP" AS "WXCCreateIP",
    "WXC"."Eid" AS "WXCEid",
    "ET"."CreateDate" AS "ETCreateDate",
    "ET"."CreateIP" AS "ETCreateIP",
    "ET"."CreateUid" AS "ETCreateUid",
    "UR"."UserType" AS "URUserType",
    "Fat_WeiXinSubscribe"."Updated",
    "ET"."Recycle" AS "ETRecycle",
    "ET"."Updated" AS "ETUpdated",
    "UR"."BirthDay" AS "URBirthDay",
    "UR"."Updated" AS "URUpdated",
    "UR"."ProfileFileName" AS "URProfileFileName",
    "UR"."CensusType" AS "URCensusType",
    "UR"."AddressCensus" AS "URAddressCensus",
    "UR"."AddressNow" AS "URAddressNow",
    "UR"."IdentityNumber" AS "URIdentityNumber",
    "UR"."Nationality" AS "URNationality",
    "WXC"."Updated" AS "WXCUpdated",
    "WXC"."Token_K" AS "WXCToken_K",
    "ET"."EntType" AS "ETEntType"
   FROM "Fat_WeiXinSubscribe"
     JOIN "Fat_Enterprise" "ET" ON "Fat_WeiXinSubscribe"."Eid" = "ET"."Eid"
     JOIN "Fat_Users" "UR" ON "Fat_WeiXinSubscribe"."Uid" = "UR"."Uid"
     JOIN "Fat_WeiXinConfig" "WXC" ON "WXC"."Gid"::text = "Fat_WeiXinSubscribe"."Gid"::text;

-- ----------------------------
-- Primary Key structure for table CL_Content
-- ----------------------------
ALTER TABLE "public"."CL_Content" ADD CONSTRAINT "CL_Content_pkey" PRIMARY KEY ("ContentId");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileGroup
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileGroup" ADD CONSTRAINT "Fat_AppFileGroup_pkey" PRIMARY KEY ("AFGid");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileGroupRelatDep
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileGroupRelatDep" ADD CONSTRAINT "Fat_AppFileGroupRelatDep_pkey" PRIMARY KEY ("AFGid", "DepID");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileGroupRelatPost
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileGroupRelatPost" ADD CONSTRAINT "Fat_AppFileGroupRelatPost_pkey" PRIMARY KEY ("AFGid", "PtID");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileGroupRelatStaff
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileGroupRelatStaff" ADD CONSTRAINT "Fat_AppFileGroupRelatStaff_pkey" PRIMARY KEY ("Uid", "Eid", "AFGid");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileInfo
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileInfo" ADD CONSTRAINT "Fat_AppFileInfo_pkey" PRIMARY KEY ("FileName", "Controller", "Module");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileInfoRelatAppFileGroup
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileInfoRelatAppFileGroup" ADD CONSTRAINT "Fat_AppFileInfoRelatAppFileGroup_pkey" PRIMARY KEY ("AFGid", "FileName", "Controller", "Module");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileInfoRelatPost
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileInfoRelatPost" ADD CONSTRAINT "Fat_AppFileInfoRelatPost_pkey" PRIMARY KEY ("PtID", "FileName", "Controller", "Module");

-- ----------------------------
-- Primary Key structure for table Fat_AppFileInfoRelatStaff
-- ----------------------------
ALTER TABLE "public"."Fat_AppFileInfoRelatStaff" ADD CONSTRAINT "Fat_AppFileInfoRelatStaff_pkey" PRIMARY KEY ("FileName", "Uid", "Controller", "Module", "Eid");

-- ----------------------------
-- Primary Key structure for table Fat_AppInfo
-- ----------------------------
ALTER TABLE "public"."Fat_AppInfo" ADD CONSTRAINT "Fat_AppInfo_pkey" PRIMARY KEY ("Controller", "Module");

-- ----------------------------
-- Primary Key structure for table Fat_Attachment
-- ----------------------------
ALTER TABLE "public"."Fat_Attachment" ADD CONSTRAINT "Fat_Attachment_pkey" PRIMARY KEY ("Aid");

-- ----------------------------
-- Primary Key structure for table Fat_AttributesOfImage
-- ----------------------------
ALTER TABLE "public"."Fat_AttributesOfImage" ADD CONSTRAINT "Fat_AttributesOfImage_pkey" PRIMARY KEY ("IAid");

-- ----------------------------
-- Primary Key structure for table Fat_Classification
-- ----------------------------
ALTER TABLE "public"."Fat_Classification" ADD CONSTRAINT "Fat_Classification_pkey" PRIMARY KEY ("Clid");

-- ----------------------------
-- Primary Key structure for table Fat_ClassificationRelatPost
-- ----------------------------
ALTER TABLE "public"."Fat_ClassificationRelatPost" ADD CONSTRAINT "Fat_ClassificationRelatPost_pkey" PRIMARY KEY ("PtID", "Clid");

-- ----------------------------
-- Primary Key structure for table Fat_ClassificationRelatStaff
-- ----------------------------
ALTER TABLE "public"."Fat_ClassificationRelatStaff" ADD CONSTRAINT "Fat_ClassificationRelatStaff_pkey" PRIMARY KEY ("Clid", "Uid", "Eid");

-- ----------------------------
-- Primary Key structure for table Fat_Department
-- ----------------------------
ALTER TABLE "public"."Fat_Department" ADD CONSTRAINT "Fat_Department_pkey" PRIMARY KEY ("DepID");

-- ----------------------------
-- Primary Key structure for table Fat_Enterprise
-- ----------------------------
ALTER TABLE "public"."Fat_Enterprise" ADD CONSTRAINT "Fat_Enterprise_pkey" PRIMARY KEY ("Eid");

-- ----------------------------
-- Primary Key structure for table Fat_Noticeinfo
-- ----------------------------
ALTER TABLE "public"."Fat_Noticeinfo" ADD CONSTRAINT "Fat_Noticeinfo_pkey" PRIMARY KEY ("NoticeID");

-- ----------------------------
-- Primary Key structure for table Fat_Post
-- ----------------------------
ALTER TABLE "public"."Fat_Post" ADD CONSTRAINT "Fat_Post_pkey" PRIMARY KEY ("PtID");

-- ----------------------------
-- Primary Key structure for table Fat_PostRelatUsers
-- ----------------------------
ALTER TABLE "public"."Fat_PostRelatUsers" ADD CONSTRAINT "Fat_PostRelatUsers_pkey" PRIMARY KEY ("PtID", "Uid", "Eid", "DepID");

-- ----------------------------
-- Primary Key structure for table Fat_UserAuths
-- ----------------------------
ALTER TABLE "public"."Fat_UserAuths" ADD CONSTRAINT "Fat_UserAuths_pkey" PRIMARY KEY ("PassID");

-- ----------------------------
-- Primary Key structure for table Fat_Users
-- ----------------------------
ALTER TABLE "public"."Fat_Users" ADD CONSTRAINT "Fat_Users_pkey" PRIMARY KEY ("Uid");

-- ----------------------------
-- Primary Key structure for table Fat_WeiXinConfig
-- ----------------------------
ALTER TABLE "public"."Fat_WeiXinConfig" ADD CONSTRAINT "Fat_WeiXinConfig_pkey" PRIMARY KEY ("AppID");

-- ----------------------------
-- Primary Key structure for table Fat_WeiXinConfigWithJsApi
-- ----------------------------
ALTER TABLE "public"."Fat_WeiXinConfigWithJsApi" ADD CONSTRAINT "Fat_WeiXinConfigWithJsApi_pkey" PRIMARY KEY ("AppID");

-- ----------------------------
-- Primary Key structure for table Fat_WeiXinMenu
-- ----------------------------
ALTER TABLE "public"."Fat_WeiXinMenu" ADD CONSTRAINT "Fat_WeiXinMenu_pkey" PRIMARY KEY ("MenuID");

-- ----------------------------
-- Primary Key structure for table Fat_WeiXinSubscribe
-- ----------------------------
ALTER TABLE "public"."Fat_WeiXinSubscribe" ADD CONSTRAINT "Fat_WeiXinSubscribe_pkey" PRIMARY KEY ("Gid", "OpenID");
