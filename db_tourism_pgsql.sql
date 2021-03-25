/*
 Navicat Premium Data Transfer

 Source Server         : 东屹数旅test
 Source Server Type    : PostgreSQL
 Source Server Version : 120003
 Source Host           : 192.168.110.31:5432
 Source Catalog        : db_tourism
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120003
 File Encoding         : 65001

 Date: 26/01/2021 15:26:04
*/


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
-- Table structure for SA_Activity
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Activity";
CREATE TABLE "public"."SA_Activity" (
  "Aid" uuid NOT NULL,
  "ParentID" uuid,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "HeadImage" varchar(255) COLLATE "pg_catalog"."default",
  "Details" varchar(255) COLLATE "pg_catalog"."default",
  "BegTime" timestamp(6),
  "EndTime" timestamp(6),
  "Participation" int8,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Activity"."Aid" IS '活动id';
COMMENT ON COLUMN "public"."SA_Activity"."ParentID" IS '父系id';
COMMENT ON COLUMN "public"."SA_Activity"."Title" IS '活动名称';
COMMENT ON COLUMN "public"."SA_Activity"."HeadImage" IS '活动图片';
COMMENT ON COLUMN "public"."SA_Activity"."Details" IS '活动详情';
COMMENT ON COLUMN "public"."SA_Activity"."BegTime" IS '开始时间';
COMMENT ON COLUMN "public"."SA_Activity"."EndTime" IS '结束时间';
COMMENT ON COLUMN "public"."SA_Activity"."Participation" IS '参与人数';
COMMENT ON COLUMN "public"."SA_Activity"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Activity"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Activity"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Activity"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Activity"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Activity" IS '活动信息表';

-- ----------------------------
-- Table structure for SA_ActivityForModulesData
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ActivityForModulesData";
CREATE TABLE "public"."SA_ActivityForModulesData" (
  "Aid" uuid NOT NULL,
  "DataId" uuid NOT NULL,
  "Modules" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "HeadImage" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."Aid" IS '活动id';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."DataId" IS '活动关联id(景区 攻略等。。）';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."Modules" IS '活动类型(参考EnumActivityType)';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_ActivityForModulesData"."HeadImage" IS '宣传图片';
COMMENT ON TABLE "public"."SA_ActivityForModulesData" IS '活动关联数据类型';

-- ----------------------------
-- Table structure for SA_Article
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Article";
CREATE TABLE "public"."SA_Article" (
  "SASid" uuid NOT NULL,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "SmallTitle" varchar(127) COLLATE "pg_catalog"."default",
  "Icon" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Integral" int4,
  "Content" varchar(2048) COLLATE "pg_catalog"."default",
  "SAid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Article"."SASid" IS '风物id';
COMMENT ON COLUMN "public"."SA_Article"."Title" IS '内容标题';
COMMENT ON COLUMN "public"."SA_Article"."SmallTitle" IS '小标题';
COMMENT ON COLUMN "public"."SA_Article"."Icon" IS '图标文件名(非全路径)';
COMMENT ON COLUMN "public"."SA_Article"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Article"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Article"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Article"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Article"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_Article"."Integral" IS '获得积分';
COMMENT ON COLUMN "public"."SA_Article"."Content" IS '内容';
COMMENT ON COLUMN "public"."SA_Article"."SAid" IS '景点id';
COMMENT ON TABLE "public"."SA_Article" IS '风物信息';

-- ----------------------------
-- Table structure for SA_ArticleForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ArticleForUsers";
CREATE TABLE "public"."SA_ArticleForUsers" (
  "SASid" uuid NOT NULL,
  "Tid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "EXPid" uuid NOT NULL,
  "Integral" int4,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "SAid" uuid NOT NULL
)
;
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."SASid" IS '风物id';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."EXPid" IS '探索id';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."Integral" IS '获得积分';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_ArticleForUsers"."SAid" IS '攻略轨迹id(打卡时获得的风物)';
COMMENT ON TABLE "public"."SA_ArticleForUsers" IS '用户获得的风物';

-- ----------------------------
-- Table structure for SA_ArticleRelatTask
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ArticleRelatTask";
CREATE TABLE "public"."SA_ArticleRelatTask" (
  "Tid" uuid NOT NULL,
  "SASid" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_ArticleRelatTask"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_ArticleRelatTask"."SASid" IS '风物id';
COMMENT ON COLUMN "public"."SA_ArticleRelatTask"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ArticleRelatTask"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ArticleRelatTask"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_ArticleRelatTask" IS '任务与风物关联';

-- ----------------------------
-- Table structure for SA_AuditForExplain
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_AuditForExplain";
CREATE TABLE "public"."SA_AuditForExplain" (
  "DataId" uuid NOT NULL,
  "DataType" int4,
  "Explain" varchar(255) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "AEid" uuid NOT NULL
)
;
COMMENT ON COLUMN "public"."SA_AuditForExplain"."DataId" IS '数据id';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."DataType" IS '数据类型（EnumAuditInstructionsType）';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."Explain" IS '相关说明';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_AuditForExplain"."AEid" IS '记录id';
COMMENT ON TABLE "public"."SA_AuditForExplain" IS '数据审核和举报处理相关记录';

-- ----------------------------
-- Table structure for SA_ClassificationForArea
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ClassificationForArea";
CREATE TABLE "public"."SA_ClassificationForArea" (
  "Clid" uuid NOT NULL,
  "ADCode" varchar(256) COLLATE "pg_catalog"."default",
  "CityCode" varchar(128) COLLATE "pg_catalog"."default",
  "Lng" numeric(20,16),
  "Lat" numeric(20,16),
  "BgImage" varchar(255) COLLATE "pg_catalog"."default",
  "Tags" varchar(1023) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."Clid" IS '无限级分类(扩展)';
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."ADCode" IS 'adcode';
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."CityCode" IS '区号';
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."Lng" IS '经度';
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."Lat" IS '维度';
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."BgImage" IS '背景图';
COMMENT ON COLUMN "public"."SA_ClassificationForArea"."Tags" IS '印象标签';
COMMENT ON TABLE "public"."SA_ClassificationForArea" IS '行政区域分类信息';

-- ----------------------------
-- Table structure for SA_ClassificationForLocation
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ClassificationForLocation";
CREATE TABLE "public"."SA_ClassificationForLocation" (
  "ParentID" uuid NOT NULL,
  "Clid" uuid NOT NULL,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."ParentID" IS '无限级分类(扩展) 父系id';
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."Clid" IS '无限级分类(扩展) 子标签id';
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ClassificationForLocation"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_ClassificationForLocation" IS '地理位置类型包含标签信息';

-- ----------------------------
-- Table structure for SA_Commodity
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Commodity";
CREATE TABLE "public"."SA_Commodity" (
  "CDid" uuid NOT NULL,
  "Title" varchar(512) COLLATE "pg_catalog"."default",
  "Introduction" varchar(2048) COLLATE "pg_catalog"."default",
  "Integral" int4,
  "CountSwap" int4,
  "Total" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Commodity"."CDid" IS '商品管理';
COMMENT ON COLUMN "public"."SA_Commodity"."Title" IS '商品标题';
COMMENT ON COLUMN "public"."SA_Commodity"."Introduction" IS '商品介绍';
COMMENT ON COLUMN "public"."SA_Commodity"."Integral" IS '所需积分';
COMMENT ON COLUMN "public"."SA_Commodity"."CountSwap" IS '兑换数';
COMMENT ON COLUMN "public"."SA_Commodity"."Total" IS '总数';
COMMENT ON COLUMN "public"."SA_Commodity"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Commodity"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Commodity"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Commodity"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Commodity"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Commodity" IS '商品信息';

-- ----------------------------
-- Table structure for SA_Complaints
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Complaints";
CREATE TABLE "public"."SA_Complaints" (
  "CoId" uuid NOT NULL,
  "DataId" uuid,
  "RId" uuid,
  "CoType" int2,
  "Content" varchar(511) COLLATE "pg_catalog"."default",
  "Status" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Complaints"."CoId" IS '举报id ';
COMMENT ON COLUMN "public"."SA_Complaints"."DataId" IS '数据id';
COMMENT ON COLUMN "public"."SA_Complaints"."RId" IS '原因id';
COMMENT ON COLUMN "public"."SA_Complaints"."CoType" IS '数据类型 EnumCollectLikeDelReportCommentType枚举';
COMMENT ON COLUMN "public"."SA_Complaints"."Content" IS '文本内容';
COMMENT ON COLUMN "public"."SA_Complaints"."Status" IS '状态 0 未解决  1 已处理 2：无违规';
COMMENT ON COLUMN "public"."SA_Complaints"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Complaints"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Complaints"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Complaints"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Complaints" IS '用户举报';

-- ----------------------------
-- Table structure for SA_Content
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Content";
CREATE TABLE "public"."SA_Content" (
  "Cid" uuid NOT NULL,
  "SAid" uuid,
  "TAid" uuid,
  "Clid" uuid,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "SmallTitle" varchar(127) COLLATE "pg_catalog"."default",
  "CountLike" int8,
  "Details" varchar(2048) COLLATE "pg_catalog"."default",
  "Remarks" varchar(1024) COLLATE "pg_catalog"."default",
  "Sort" int8,
  "CRAidForHeader" uuid,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Content"."Cid" IS '内容id';
COMMENT ON COLUMN "public"."SA_Content"."SAid" IS '景点id(所属景区)';
COMMENT ON COLUMN "public"."SA_Content"."TAid" IS '观光区id';
COMMENT ON COLUMN "public"."SA_Content"."Clid" IS '所属类别';
COMMENT ON COLUMN "public"."SA_Content"."Title" IS '内容标题';
COMMENT ON COLUMN "public"."SA_Content"."SmallTitle" IS '小标题';
COMMENT ON COLUMN "public"."SA_Content"."CountLike" IS '点赞统计';
COMMENT ON COLUMN "public"."SA_Content"."Details" IS '内容详情';
COMMENT ON COLUMN "public"."SA_Content"."Remarks" IS '备注';
COMMENT ON COLUMN "public"."SA_Content"."Sort" IS '排序';
COMMENT ON COLUMN "public"."SA_Content"."CRAidForHeader" IS '头部信息(附件id)';
COMMENT ON COLUMN "public"."SA_Content"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Content"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Content"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Content"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Content"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Content" IS '内容信息';

-- ----------------------------
-- Table structure for SA_ContentAtta
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ContentAtta";
CREATE TABLE "public"."SA_ContentAtta" (
  "CRAid" uuid NOT NULL,
  "SAid" uuid,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "FilePath" varchar(255) COLLATE "pg_catalog"."default",
  "AttaType" int4,
  "FirstImageForVideo" varchar(255) COLLATE "pg_catalog"."default",
  "Description" varchar(512) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_ContentAtta"."CRAid" IS '内容附件id';
COMMENT ON COLUMN "public"."SA_ContentAtta"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_ContentAtta"."Title" IS '附件标题';
COMMENT ON COLUMN "public"."SA_ContentAtta"."FilePath" IS '文件名称';
COMMENT ON COLUMN "public"."SA_ContentAtta"."AttaType" IS '附件类型(0:图片,1:视频)';
COMMENT ON COLUMN "public"."SA_ContentAtta"."FirstImageForVideo" IS '视频首图';
COMMENT ON COLUMN "public"."SA_ContentAtta"."Description" IS '简要说明';
COMMENT ON COLUMN "public"."SA_ContentAtta"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_ContentAtta"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ContentAtta"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ContentAtta"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ContentAtta"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_ContentAtta" IS '内容附件信息';

-- ----------------------------
-- Table structure for SA_Exploration
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Exploration";
CREATE TABLE "public"."SA_Exploration" (
  "EXPid" uuid NOT NULL,
  "SAid" uuid,
  "ParentID" uuid,
  "Icon" varchar(128) COLLATE "pg_catalog"."default",
  "DisableIcon" varchar(128) COLLATE "pg_catalog"."default",
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Prompt" varchar COLLATE "pg_catalog"."default",
  "PromptImage" varchar(128) COLLATE "pg_catalog"."default",
  "Integral" int4,
  "DescriptionForSuc" varchar(255) COLLATE "pg_catalog"."default",
  "DescriptionImageForSuc" varchar(128) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Difficulty" int4,
  "CountDownTime" int4,
  "IsRelease" int2
)
;
COMMENT ON COLUMN "public"."SA_Exploration"."EXPid" IS '探索id';
COMMENT ON COLUMN "public"."SA_Exploration"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_Exploration"."ParentID" IS '父系id';
COMMENT ON COLUMN "public"."SA_Exploration"."Icon" IS '图标名称(文件名称)';
COMMENT ON COLUMN "public"."SA_Exploration"."DisableIcon" IS '图标名称(文件名称),未启用';
COMMENT ON COLUMN "public"."SA_Exploration"."Title" IS '探索标题';
COMMENT ON COLUMN "public"."SA_Exploration"."Prompt" IS '探索提示';
COMMENT ON COLUMN "public"."SA_Exploration"."PromptImage" IS '任务概览图(文件名称)';
COMMENT ON COLUMN "public"."SA_Exploration"."Integral" IS '获得积分';
COMMENT ON COLUMN "public"."SA_Exploration"."DescriptionForSuc" IS '探索成功描述';
COMMENT ON COLUMN "public"."SA_Exploration"."DescriptionImageForSuc" IS '探索成功描述图';
COMMENT ON COLUMN "public"."SA_Exploration"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Exploration"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Exploration"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Exploration"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Exploration"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_Exploration"."Difficulty" IS '探索难度';
COMMENT ON COLUMN "public"."SA_Exploration"."CountDownTime" IS '倒计时(小时)';
COMMENT ON COLUMN "public"."SA_Exploration"."IsRelease" IS '是否发布探索 0:不发布 1:发布(管理平台不可做任何修改)';
COMMENT ON TABLE "public"."SA_Exploration" IS '探索信息';

-- ----------------------------
-- Table structure for SA_ExplorationForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ExplorationForUsers";
CREATE TABLE "public"."SA_ExplorationForUsers" (
  "Uid" uuid NOT NULL,
  "EXPid" uuid NOT NULL,
  "Status" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."EXPid" IS '探索id';
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."Status" IS '探索状态(0:未完成,1:完成)';
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ExplorationForUsers"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_ExplorationForUsers" IS '用户探索信息';

-- ----------------------------
-- Table structure for SA_Features
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Features";
CREATE TABLE "public"."SA_Features" (
  "Fid" uuid NOT NULL,
  "Title" varchar(127) COLLATE "pg_catalog"."default",
  "Description" varchar(512) COLLATE "pg_catalog"."default",
  "Remarks" varchar(1024) COLLATE "pg_catalog"."default",
  "IconForMap" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Features"."Fid" IS '功能区id';
COMMENT ON COLUMN "public"."SA_Features"."Title" IS '功能区名称';
COMMENT ON COLUMN "public"."SA_Features"."Description" IS '简要说明';
COMMENT ON COLUMN "public"."SA_Features"."Remarks" IS '备注';
COMMENT ON COLUMN "public"."SA_Features"."IconForMap" IS '地图图标';
COMMENT ON COLUMN "public"."SA_Features"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Features"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Features"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Features"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Features"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Features" IS '景区功能信息';

-- ----------------------------
-- Table structure for SA_FootPrintForActivityForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_FootPrintForActivityForUsers";
CREATE TABLE "public"."SA_FootPrintForActivityForUsers" (
  "Aid" uuid NOT NULL,
  "FPid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "PerfectionContent" varchar(1024) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."Aid" IS '活动id';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."PerfectionContent" IS '完成内容(根据任务的模块id来识别该内容明细,比如:存多个id)';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_FootPrintForActivityForUsers"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_FootPrintForActivityForUsers" IS '活动关联用户足迹';

-- ----------------------------
-- Table structure for SA_FootPrintForExplorationForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_FootPrintForExplorationForUsers";
CREATE TABLE "public"."SA_FootPrintForExplorationForUsers" (
  "Uid" uuid NOT NULL,
  "EXPid" uuid NOT NULL,
  "FPid" uuid NOT NULL,
  "Status" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."EXPid" IS '探索id';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."Status" IS '探索状态(0:未完成,1:完成)';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_FootPrintForExplorationForUsers"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_FootPrintForExplorationForUsers" IS '探索足迹';

-- ----------------------------
-- Table structure for SA_FootPrintForTaskForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_FootPrintForTaskForUsers";
CREATE TABLE "public"."SA_FootPrintForTaskForUsers" (
  "Tid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "FPid" uuid NOT NULL,
  "Status" int4,
  "PerfectionContent" varchar(1024) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."Status" IS '任务状态(0:未完成,1:完成)';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."PerfectionContent" IS '完成内容(根据任务的模块id来识别该内容明细,比如:存多个id)';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_FootPrintForTaskForUsers"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_FootPrintForTaskForUsers" IS '任务足迹';

-- ----------------------------
-- Table structure for SA_FootPrintForUsersExWithPhoto
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_FootPrintForUsersExWithPhoto";
CREATE TABLE "public"."SA_FootPrintForUsersExWithPhoto" (
  "UFPid" uuid NOT NULL,
  "FPid" uuid NOT NULL,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_FootPrintForUsersExWithPhoto"."UFPid" IS '用户照片id';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersExWithPhoto"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersExWithPhoto"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersExWithPhoto"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersExWithPhoto"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersExWithPhoto"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_FootPrintForUsersExWithPhoto" IS '照片上传足迹';

-- ----------------------------
-- Table structure for SA_FootPrintForUsersWithFeedBack
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_FootPrintForUsersWithFeedBack";
CREATE TABLE "public"."SA_FootPrintForUsersWithFeedBack" (
  "FPid" uuid NOT NULL,
  "Content" varchar(511) COLLATE "pg_catalog"."default",
  "Status" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."FPid" IS '反馈足迹id';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."Content" IS '用户反馈内容';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."Status" IS '状态 0 未解决  1 已解决';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_FootPrintForUsersWithFeedBack"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_FootPrintForUsersWithFeedBack" IS '用户反馈足迹';

-- ----------------------------
-- Table structure for SA_FootPrintWithTrack
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_FootPrintWithTrack";
CREATE TABLE "public"."SA_FootPrintWithTrack" (
  "FPTid" uuid NOT NULL,
  "FPid" uuid,
  "Lng" numeric(20,16),
  "Lat" numeric(20,16),
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."FPTid" IS '轨迹id';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."Lng" IS '经度';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."Lat" IS '维度';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_FootPrintWithTrack"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_FootPrintWithTrack" IS '用户足迹轨迹';

-- ----------------------------
-- Table structure for SA_GameForRead
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_GameForRead";
CREATE TABLE "public"."SA_GameForRead" (
  "Tid" uuid NOT NULL,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "SmallTitle" varchar(127) COLLATE "pg_catalog"."default",
  "CountLike" int8,
  "Details" varchar(2048) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_GameForRead"."Tid" IS '任务id(扩展)';
COMMENT ON COLUMN "public"."SA_GameForRead"."Title" IS '内容标题';
COMMENT ON COLUMN "public"."SA_GameForRead"."SmallTitle" IS '小标题';
COMMENT ON COLUMN "public"."SA_GameForRead"."CountLike" IS '点赞统计';
COMMENT ON COLUMN "public"."SA_GameForRead"."Details" IS '内容详情';
COMMENT ON TABLE "public"."SA_GameForRead" IS '游戏阅读';

-- ----------------------------
-- Table structure for SA_GameForReadAttr
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_GameForReadAttr";
CREATE TABLE "public"."SA_GameForReadAttr" (
  "TCid" uuid NOT NULL,
  "Tid" uuid,
  "FileType" int4,
  "FilePath" varchar(255) COLLATE "pg_catalog"."default",
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."TCid" IS '阅读附件';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."FileType" IS '文件类型(0:图片,1:视频)';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."FilePath" IS '文件名';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."Title" IS '原始文件名';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_GameForReadAttr"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_GameForReadAttr" IS '游戏阅读(附件)';

-- ----------------------------
-- Table structure for SA_GameForTestBank
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_GameForTestBank";
CREATE TABLE "public"."SA_GameForTestBank" (
  "Tid" uuid NOT NULL,
  "TBid" uuid NOT NULL,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_GameForTestBank"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_GameForTestBank"."TBid" IS '题目id';
COMMENT ON COLUMN "public"."SA_GameForTestBank"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_GameForTestBank"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_GameForTestBank"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_GameForTestBank" IS '任务题目';

-- ----------------------------
-- Table structure for SA_Hint
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Hint";
CREATE TABLE "public"."SA_Hint" (
  "Hid" uuid NOT NULL,
  "SAid" uuid,
  "TAid" uuid,
  "Title" varchar(512) COLLATE "pg_catalog"."default",
  "AreaType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Hint"."Hid" IS '提示语id';
COMMENT ON COLUMN "public"."SA_Hint"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_Hint"."TAid" IS '观光区id';
COMMENT ON COLUMN "public"."SA_Hint"."Title" IS '提示语标题';
COMMENT ON COLUMN "public"."SA_Hint"."AreaType" IS '区域类型(0:景区,1:观景区)';
COMMENT ON COLUMN "public"."SA_Hint"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Hint"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Hint"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Hint"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Hint"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Hint" IS '游客打卡提示语';

-- ----------------------------
-- Table structure for SA_History
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_History";
CREATE TABLE "public"."SA_History" (
  "Hid" uuid NOT NULL,
  "PassID" varchar(191) COLLATE "pg_catalog"."default",
  "Uid" uuid,
  "Updated" timestamp(6),
  "CreateUid" uuid,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_History"."Hid" IS '历史id';
COMMENT ON COLUMN "public"."SA_History"."PassID" IS '凭证信息(唯一)';
COMMENT ON COLUMN "public"."SA_History"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_History"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_History"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_History"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."SA_History"."CreateIP" IS '创建ip';
COMMENT ON TABLE "public"."SA_History" IS '账号追溯表';

-- ----------------------------
-- Table structure for SA_Hotel
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Hotel";
CREATE TABLE "public"."SA_Hotel" (
  "SAid" uuid NOT NULL,
  "Level" int2
)
;
COMMENT ON COLUMN "public"."SA_Hotel"."SAid" IS '酒店(扩展)';
COMMENT ON COLUMN "public"."SA_Hotel"."Level" IS '酒店等级';
COMMENT ON TABLE "public"."SA_Hotel" IS '酒店信息';

-- ----------------------------
-- Table structure for SA_IntangibleCulturalHeritage
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_IntangibleCulturalHeritage";
CREATE TABLE "public"."SA_IntangibleCulturalHeritage" (
  "ICHid" uuid NOT NULL,
  "Clid" uuid,
  "Title" varchar(511) COLLATE "pg_catalog"."default",
  "Level" int2,
  "ImagePath" varchar(255) COLLATE "pg_catalog"."default",
  "Details" varchar(40960) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Summary" varchar(2047) COLLATE "pg_catalog"."default",
  "Collect" int8,
  "Liker" int8,
  "Comment" int8
)
;
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."ICHid" IS '非遗id';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Clid" IS '分类';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Title" IS '标题';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Level" IS '级别(0:国家级)';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."ImagePath" IS '图片名称';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Details" IS '内容详情';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Summary" IS '概要';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Collect" IS '收藏数';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Liker" IS '点赞数';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritage"."Comment" IS '评论数';
COMMENT ON TABLE "public"."SA_IntangibleCulturalHeritage" IS '非物质文化遗产';

-- ----------------------------
-- Table structure for SA_IntangibleCulturalHeritageWithArea
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_IntangibleCulturalHeritageWithArea";
CREATE TABLE "public"."SA_IntangibleCulturalHeritageWithArea" (
  "ICHid" uuid NOT NULL,
  "Clid" uuid NOT NULL,
  "PersonOfInherited" varchar(255) COLLATE "pg_catalog"."default",
  "Remarks" varchar(1024) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritageWithArea"."ICHid" IS '非遗id';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritageWithArea"."Clid" IS '无限级分类(地区)';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritageWithArea"."PersonOfInherited" IS '传承人';
COMMENT ON COLUMN "public"."SA_IntangibleCulturalHeritageWithArea"."Remarks" IS '备注';
COMMENT ON TABLE "public"."SA_IntangibleCulturalHeritageWithArea" IS '非遗关联地区';

-- ----------------------------
-- Table structure for SA_KeyWord
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_KeyWord";
CREATE TABLE "public"."SA_KeyWord" (
  "KeyWord" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "Frequency" int8,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_KeyWord"."KeyWord" IS '关键词';
COMMENT ON COLUMN "public"."SA_KeyWord"."Frequency" IS '搜索次数';
COMMENT ON COLUMN "public"."SA_KeyWord"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_KeyWord"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_KeyWord"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_KeyWord" IS '搜索关键字';

-- ----------------------------
-- Table structure for SA_Knowledge
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Knowledge";
CREATE TABLE "public"."SA_Knowledge" (
  "Kid" uuid NOT NULL,
  "Clid" uuid,
  "Title" varchar(511) COLLATE "pg_catalog"."default",
  "SmallTitle" varchar(1024) COLLATE "pg_catalog"."default",
  "BgImage" varchar(127) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Introduce" varchar(2048) COLLATE "pg_catalog"."default",
  "Collect" int4,
  "ClidForCivilization" varchar(2048) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_Knowledge"."Kid" IS '知识点id';
COMMENT ON COLUMN "public"."SA_Knowledge"."Clid" IS '地区id';
COMMENT ON COLUMN "public"."SA_Knowledge"."Title" IS '大标题';
COMMENT ON COLUMN "public"."SA_Knowledge"."SmallTitle" IS '小标题';
COMMENT ON COLUMN "public"."SA_Knowledge"."BgImage" IS '背景图';
COMMENT ON COLUMN "public"."SA_Knowledge"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Knowledge"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Knowledge"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Knowledge"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Knowledge"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_Knowledge"."Introduce" IS '描述';
COMMENT ON COLUMN "public"."SA_Knowledge"."Collect" IS '收藏数';
COMMENT ON COLUMN "public"."SA_Knowledge"."ClidForCivilization" IS '文化类别(多个类别使用|分开)';
COMMENT ON TABLE "public"."SA_Knowledge" IS '知识点';

-- ----------------------------
-- Table structure for SA_LevelForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_LevelForUsers";
CREATE TABLE "public"."SA_LevelForUsers" (
  "LFUid" int4 NOT NULL,
  "TagName" varchar(128) COLLATE "pg_catalog"."default",
  "Integral" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_LevelForUsers"."LFUid" IS '等级id';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."TagName" IS '标签名称';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."Integral" IS '所需积分';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_LevelForUsers"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_LevelForUsers" IS '用户积分等级信息';

-- ----------------------------
-- Table structure for SA_LocationInfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_LocationInfo";
CREATE TABLE "public"."SA_LocationInfo" (
  "SAid" uuid NOT NULL,
  "Lng" numeric(20,16),
  "Lat" numeric(20,16),
  "Clid" uuid,
  "Addr" varchar(1023) COLLATE "pg_catalog"."default",
  "PlaceType" int4,
  "PublishType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Name" varchar(511) COLLATE "pg_catalog"."default",
  "Phone" varchar(255) COLLATE "pg_catalog"."default",
  "Email" varchar(255) COLLATE "pg_catalog"."default",
  "IsParking" int2,
  "Remark" varchar(255) COLLATE "pg_catalog"."default",
  "PlaceTypeForClid" uuid
)
;
COMMENT ON COLUMN "public"."SA_LocationInfo"."SAid" IS '地点id';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Lng" IS '经度';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Lat" IS '维度';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Clid" IS '所属地区';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Addr" IS '景区地址(有字数限制)';
COMMENT ON COLUMN "public"."SA_LocationInfo"."PlaceType" IS '地点分类(1:景点.....程序常量集合)';
COMMENT ON COLUMN "public"."SA_LocationInfo"."PublishType" IS '发布类型(0:为审核,1:审核中,2:审核通过并发布,只有值是2才能显示出来)';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_LocationInfo"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_LocationInfo"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_LocationInfo"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Name" IS '地点名称';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Phone" IS '电话';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Email" IS '电子邮箱';
COMMENT ON COLUMN "public"."SA_LocationInfo"."IsParking" IS '是否有停车场';
COMMENT ON COLUMN "public"."SA_LocationInfo"."Remark" IS '描述备注';
COMMENT ON COLUMN "public"."SA_LocationInfo"."PlaceTypeForClid" IS '地理位置类型';
COMMENT ON TABLE "public"."SA_LocationInfo" IS '地点信息(打卡点)';

-- ----------------------------
-- Table structure for SA_LocationInfoWithImage
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_LocationInfoWithImage";
CREATE TABLE "public"."SA_LocationInfoWithImage" (
  "SAid" uuid NOT NULL,
  "ImagePath" varchar(127) COLLATE "pg_catalog"."default" NOT NULL,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "UseType" int4
)
;
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."SAid" IS '地址信息id';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."ImagePath" IS '图片名称';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_LocationInfoWithImage"."UseType" IS '使用类型(0:未在应用程序中使用,1:应用使用中)';
COMMENT ON TABLE "public"."SA_LocationInfoWithImage" IS '地址图片信息';

-- ----------------------------
-- Table structure for SA_LocationInfoWithTag
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_LocationInfoWithTag";
CREATE TABLE "public"."SA_LocationInfoWithTag" (
  "SAid" uuid NOT NULL,
  "Clid" uuid NOT NULL,
  "PublishType" int4,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_LocationInfoWithTag"."SAid" IS '地点id';
COMMENT ON COLUMN "public"."SA_LocationInfoWithTag"."Clid" IS '无限级分类(标签分类id)';
COMMENT ON COLUMN "public"."SA_LocationInfoWithTag"."PublishType" IS '发布类型(0:为审核,1:审核中,2:审核通过并发布,只有值是2才能显示出来)';
COMMENT ON COLUMN "public"."SA_LocationInfoWithTag"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_LocationInfoWithTag"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_LocationInfoWithTag"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_LocationInfoWithTag" IS '地理信息标签';

-- ----------------------------
-- Table structure for SA_Log_PushMsg
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Log_PushMsg";
CREATE TABLE "public"."SA_Log_PushMsg" (
  "Uid" uuid,
  "PushTokenType" int2,
  "ClientId" varchar(255) COLLATE "pg_catalog"."default",
  "PushContent" varchar(1023) COLLATE "pg_catalog"."default",
  "Result" varchar(511) COLLATE "pg_catalog"."default",
  "Code" varchar(127) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."Uid" IS '用户信息(全局可不记录)';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."PushTokenType" IS '用户app推送token类型(1:小米,2:华为)';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."ClientId" IS '客户端id';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."PushContent" IS '推送内容(保存json)';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."Result" IS '推送结果';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."Code" IS '结果代码';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Log_PushMsg"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Log_PushMsg" IS '推送日志';

-- ----------------------------
-- Table structure for SA_MonitorForApp
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_MonitorForApp";
CREATE TABLE "public"."SA_MonitorForApp" (
  "MoDate" date NOT NULL,
  "MoTypeID" int4 NOT NULL,
  "MoTypeName" varchar(255) COLLATE "pg_catalog"."default",
  "Frequency" int8
)
;
COMMENT ON COLUMN "public"."SA_MonitorForApp"."MoDate" IS '主键';
COMMENT ON COLUMN "public"."SA_MonitorForApp"."MoTypeID" IS '监测类型 常量集合 EnumMonitorType';
COMMENT ON COLUMN "public"."SA_MonitorForApp"."MoTypeName" IS '监测名称';
COMMENT ON COLUMN "public"."SA_MonitorForApp"."Frequency" IS '次数';

-- ----------------------------
-- Table structure for SA_MonitorForOpenUser
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_MonitorForOpenUser";
CREATE TABLE "public"."SA_MonitorForOpenUser" (
  "Uid" uuid,
  "CreateDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."SA_MonitorForOpenUser"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_MonitorForOpenUser"."CreateDate" IS '打开时间';
COMMENT ON TABLE "public"."SA_MonitorForOpenUser" IS '用户打开app记录表';

-- ----------------------------
-- Table structure for SA_Reasons
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Reasons";
CREATE TABLE "public"."SA_Reasons" (
  "RId" uuid NOT NULL,
  "Content" varchar(511) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_Reasons"."RId" IS '原因id';
COMMENT ON COLUMN "public"."SA_Reasons"."Content" IS '原因内容';
COMMENT ON COLUMN "public"."SA_Reasons"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Reasons"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Reasons"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Reasons"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Reasons"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_Reasons" IS '举报原因';

-- ----------------------------
-- Table structure for SA_SMS
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_SMS";
CREATE TABLE "public"."SA_SMS" (
  "Phone" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Content" varchar(31) COLLATE "pg_catalog"."default",
  "CountOfDay" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "IsError" int2
)
;
COMMENT ON COLUMN "public"."SA_SMS"."Phone" IS '手机号';
COMMENT ON COLUMN "public"."SA_SMS"."Content" IS '发送内容';
COMMENT ON COLUMN "public"."SA_SMS"."CountOfDay" IS '当天已发次数';
COMMENT ON COLUMN "public"."SA_SMS"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_SMS"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_SMS"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_SMS"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_SMS"."IsError" IS '是否有错误(0:没有,1:有)';

-- ----------------------------
-- Table structure for SA_ScenicArea
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ScenicArea";
CREATE TABLE "public"."SA_ScenicArea" (
  "SAid" uuid NOT NULL,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "SmallTitle" varchar(512) COLLATE "pg_catalog"."default",
  "Details" varchar(2048) COLLATE "pg_catalog"."default",
  "ClidForCivilization" varchar(2048) COLLATE "pg_catalog"."default",
  "Level" int4,
  "Collect" int4,
  "PriceForDoor" int8,
  "PriceForDoorWithChild" int8,
  "HeaderImage" varchar(255) COLLATE "pg_catalog"."default",
  "PinYin" varchar(512) COLLATE "pg_catalog"."default",
  "BeginTimeForBusiness" time(6),
  "EndTimeForBusiness" time(6),
  "BgImage" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "NumOfExploration" int4,
  "Phone" varchar(128) COLLATE "pg_catalog"."default",
  "Introduction" varchar(128) COLLATE "pg_catalog"."default",
  "Liker" int4,
  "TaskRules" varchar(255) COLLATE "pg_catalog"."default",
  "ArticleRules" varchar(255) COLLATE "pg_catalog"."default",
  "GameDescription" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_ScenicArea"."SAid" IS '景点id,地点扩展信息(扩展)';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Title" IS '标题';
COMMENT ON COLUMN "public"."SA_ScenicArea"."SmallTitle" IS '小标题';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Details" IS '详情';
COMMENT ON COLUMN "public"."SA_ScenicArea"."ClidForCivilization" IS '文化类别(多个类别使用|分开)';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Level" IS '星数';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Collect" IS '收藏数';
COMMENT ON COLUMN "public"."SA_ScenicArea"."PriceForDoor" IS '成人门票价格(分)';
COMMENT ON COLUMN "public"."SA_ScenicArea"."PriceForDoorWithChild" IS '儿童票价(分)';
COMMENT ON COLUMN "public"."SA_ScenicArea"."HeaderImage" IS '首图(文件名)';
COMMENT ON COLUMN "public"."SA_ScenicArea"."PinYin" IS '拼音名字';
COMMENT ON COLUMN "public"."SA_ScenicArea"."BeginTimeForBusiness" IS '开始营业时间';
COMMENT ON COLUMN "public"."SA_ScenicArea"."EndTimeForBusiness" IS '结束营业时间';
COMMENT ON COLUMN "public"."SA_ScenicArea"."BgImage" IS '背景宣传图';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ScenicArea"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ScenicArea"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ScenicArea"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_ScenicArea"."NumOfExploration" IS '探索数量';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Phone" IS '景区电话';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Introduction" IS '简介(有字数限制)';
COMMENT ON COLUMN "public"."SA_ScenicArea"."Liker" IS '点赞数';
COMMENT ON COLUMN "public"."SA_ScenicArea"."TaskRules" IS '任务规则';
COMMENT ON COLUMN "public"."SA_ScenicArea"."ArticleRules" IS '风物获取规则';
COMMENT ON COLUMN "public"."SA_ScenicArea"."GameDescription" IS '玩法描述';
COMMENT ON TABLE "public"."SA_ScenicArea" IS '景区信息';

-- ----------------------------
-- Table structure for SA_ScenicAreaWithFeatures
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ScenicAreaWithFeatures";
CREATE TABLE "public"."SA_ScenicAreaWithFeatures" (
  "SARFid" uuid NOT NULL,
  "Fid" uuid,
  "SAid" uuid NOT NULL,
  "DescriptionForSecPayment" varchar(512) COLLATE "pg_catalog"."default",
  "Description" varchar(512) COLLATE "pg_catalog"."default",
  "PriceForSecPayment" int8,
  "HeaderImage" varchar(255) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "Recycle" int2,
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."SARFid" IS '功能区与景点关系id,地理信息扩展(扩展)';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."Fid" IS '功能区id';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."DescriptionForSecPayment" IS '二次付费描述';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."Description" IS '简要说明';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."PriceForSecPayment" IS '二次付费价格(分),如果大于0代表需要二次付费';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."HeaderImage" IS '首图(文件名)';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithFeatures"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_ScenicAreaWithFeatures" IS '景点功能区';

-- ----------------------------
-- Table structure for SA_ScenicAreaWithSignal
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ScenicAreaWithSignal";
CREATE TABLE "public"."SA_ScenicAreaWithSignal" (
  "SAid" uuid NOT NULL,
  "Lng" numeric(20,16) NOT NULL,
  "Lat" numeric(20,16) NOT NULL,
  "RadiusForTrigger" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."Lng" IS '经度';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."Lat" IS '维度';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."RadiusForTrigger" IS '坐标触发半径';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ScenicAreaWithSignal"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_ScenicAreaWithSignal" IS '景点地图位标信号';

-- ----------------------------
-- Table structure for SA_ShareImageForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_ShareImageForUsers";
CREATE TABLE "public"."SA_ShareImageForUsers" (
  "TAIid" uuid NOT NULL,
  "Uid" uuid,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Addr" varchar(512) COLLATE "pg_catalog"."default",
  "Remark" varchar(512) COLLATE "pg_catalog"."default",
  "FileName" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "SrcType" int2,
  "Srcid" uuid,
  "Srcid1" uuid
)
;
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."TAIid" IS '任务分享图id';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Title" IS '标题';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Addr" IS '地址';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Remark" IS '备注';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."FileName" IS '文件名称';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."SrcType" IS '数据源类型(0:任务分享,1:打卡分享,2:攻略分享...)';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Srcid" IS '数据源id';
COMMENT ON COLUMN "public"."SA_ShareImageForUsers"."Srcid1" IS '数据源id1(有时候需要多个id溯源,比如:任务可能在多个打卡点)';
COMMENT ON TABLE "public"."SA_ShareImageForUsers" IS '任务分享图';

-- ----------------------------
-- Table structure for SA_Task
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Task";
CREATE TABLE "public"."SA_Task" (
  "Tid" uuid NOT NULL,
  "EXPid" uuid,
  "ParentID" uuid,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Lng" numeric(20,16),
  "Lat" numeric(20,16),
  "RadiusForTrigger" int4,
  "Prompt" varchar(255) COLLATE "pg_catalog"."default",
  "ModuleId" int4,
  "Integral" int4,
  "DescriptionForSuc" varchar(255) COLLATE "pg_catalog"."default",
  "DescriptionImageForSuc" varchar(128) COLLATE "pg_catalog"."default",
  "IconForMap" varchar(128) COLLATE "pg_catalog"."default",
  "DisableIconForMap" varchar(128) COLLATE "pg_catalog"."default",
  "UnfinishedIconForMap" varchar(128) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "SAid" uuid,
  "IsMustComplete" int2,
  "IsAppintTask" int2,
  "ProductDecompositionLock" int4
)
;
COMMENT ON COLUMN "public"."SA_Task"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_Task"."EXPid" IS '探索id';
COMMENT ON COLUMN "public"."SA_Task"."ParentID" IS '父系id';
COMMENT ON COLUMN "public"."SA_Task"."Title" IS '任务标题';
COMMENT ON COLUMN "public"."SA_Task"."Lng" IS '经度';
COMMENT ON COLUMN "public"."SA_Task"."Lat" IS '维度';
COMMENT ON COLUMN "public"."SA_Task"."RadiusForTrigger" IS '坐标触发半径';
COMMENT ON COLUMN "public"."SA_Task"."Prompt" IS '任务提示';
COMMENT ON COLUMN "public"."SA_Task"."ModuleId" IS '逻辑模块id';
COMMENT ON COLUMN "public"."SA_Task"."Integral" IS '获得积分';
COMMENT ON COLUMN "public"."SA_Task"."DescriptionForSuc" IS '任务成功描述';
COMMENT ON COLUMN "public"."SA_Task"."DescriptionImageForSuc" IS '任务成功描述图';
COMMENT ON COLUMN "public"."SA_Task"."IconForMap" IS '地图图标名称(文件名称)已解锁';
COMMENT ON COLUMN "public"."SA_Task"."DisableIconForMap" IS '地图图标图标名称(文件名称),未解锁';
COMMENT ON COLUMN "public"."SA_Task"."UnfinishedIconForMap" IS '地图图标名称(文件名),未完成';
COMMENT ON COLUMN "public"."SA_Task"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Task"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Task"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Task"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Task"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_Task"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_Task"."IsMustComplete" IS '任务是否必须完成 0:必须 1:不必须';
COMMENT ON COLUMN "public"."SA_Task"."IsAppintTask" IS '是否特殊任务(彩蛋) 0:不是 1:是';
COMMENT ON COLUMN "public"."SA_Task"."ProductDecompositionLock" IS '积分解锁消耗数量';
COMMENT ON TABLE "public"."SA_Task" IS '任务信息';

-- ----------------------------
-- Table structure for SA_TaskEx
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TaskEx";
CREATE TABLE "public"."SA_TaskEx" (
  "Tid" uuid NOT NULL,
  "RetentionPeriod" int2,
  "PushForm" int2,
  "OpenConditions" int2,
  "Attribute" int2,
  "RetentionDeadline" timestamp(6),
  "Opentext" varchar(255) COLLATE "pg_catalog"."default",
  "OpenBeginTime" timestamp(6),
  "OpenEndTime" timestamp(6),
  "Clid" uuid,
  "Address" varchar(255) COLLATE "pg_catalog"."default",
  "Status" int2,
  "PassWordPrompt" varchar(255) COLLATE "pg_catalog"."default",
  "OpenNumberForPeople" int4
)
;
COMMENT ON COLUMN "public"."SA_TaskEx"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_TaskEx"."RetentionPeriod" IS '保留类型 0长期1短期2阅后即焚 EnumRetentionPeriodForEggsType枚举';
COMMENT ON COLUMN "public"."SA_TaskEx"."PushForm" IS '推送形式 0.公开（所有人可见）1.全部好友可见 2.指定可见人  EnumPushFormForEggsType枚举';
COMMENT ON COLUMN "public"."SA_TaskEx"."OpenConditions" IS '打开条件0.直接拆封1.密码限定2.时间限定3:时间限定+密码 EnumOpenConditionsForEggsType';
COMMENT ON COLUMN "public"."SA_TaskEx"."Attribute" IS '属性 0:无属性1:福利2:告白3提醒4点评5私人信息  EnumAttributeForEggsType';
COMMENT ON COLUMN "public"."SA_TaskEx"."RetentionDeadline" IS '任务最后留存时间(超过不显示给用户） 针对RetentionPeriod设置的此字段';
COMMENT ON COLUMN "public"."SA_TaskEx"."Opentext" IS '打开文本密码';
COMMENT ON COLUMN "public"."SA_TaskEx"."OpenBeginTime" IS '拆解开始时间';
COMMENT ON COLUMN "public"."SA_TaskEx"."OpenEndTime" IS '拆解截至时间';
COMMENT ON COLUMN "public"."SA_TaskEx"."Clid" IS '无限级分类(地区)';
COMMENT ON COLUMN "public"."SA_TaskEx"."Address" IS '彩蛋地址';
COMMENT ON COLUMN "public"."SA_TaskEx"."Status" IS '审核状态0:未通过 1:通过 2:拒绝 EnumStatusForEggs枚举';
COMMENT ON COLUMN "public"."SA_TaskEx"."PassWordPrompt" IS '密码提示文本';
COMMENT ON COLUMN "public"."SA_TaskEx"."OpenNumberForPeople" IS '打开剩余人数';
COMMENT ON TABLE "public"."SA_TaskEx" IS '任务扩展(大致针对彩蛋功能模块)';

-- ----------------------------
-- Table structure for SA_TaskForAppointEx
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TaskForAppointEx";
CREATE TABLE "public"."SA_TaskForAppointEx" (
  "Tid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."Uid" IS '指定可见的用户id';
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TaskForAppointEx"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_TaskForAppointEx" IS '任务指定用户';

-- ----------------------------
-- Table structure for SA_TaskForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TaskForUsers";
CREATE TABLE "public"."SA_TaskForUsers" (
  "Tid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "Status" int4,
  "PerfectionContent" varchar(1024) COLLATE "pg_catalog"."default",
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "IsProductDecompositionLock" int4
)
;
COMMENT ON COLUMN "public"."SA_TaskForUsers"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."Status" IS '任务状态(0:未完成,1:完成 2:错过)';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."PerfectionContent" IS '完成内容(根据任务的模块id来识别该内容明细,比如:存多个id)';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_TaskForUsers"."IsProductDecompositionLock" IS '是否积分解锁 0:不是 1:是';
COMMENT ON TABLE "public"."SA_TaskForUsers" IS '用户任务信息';

-- ----------------------------
-- Table structure for SA_TestBank
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TestBank";
CREATE TABLE "public"."SA_TestBank" (
  "TBid" uuid NOT NULL,
  "SAid" uuid,
  "Title" varchar(512) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_TestBank"."TBid" IS '题目id';
COMMENT ON COLUMN "public"."SA_TestBank"."SAid" IS '景点id(全0代表是通用题目)';
COMMENT ON COLUMN "public"."SA_TestBank"."Title" IS '题目标题';
COMMENT ON COLUMN "public"."SA_TestBank"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TestBank"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TestBank"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TestBank"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TestBank"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_TestBank" IS '游戏题库';

-- ----------------------------
-- Table structure for SA_TestBankAnswer
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TestBankAnswer";
CREATE TABLE "public"."SA_TestBankAnswer" (
  "TBAid" uuid NOT NULL,
  "TBid" uuid,
  "Title" varchar(512) COLLATE "pg_catalog"."default",
  "IsTrue" int2,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."TBAid" IS '答案选项id';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."TBid" IS '题目id';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."Title" IS '答案标题';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."IsTrue" IS '是否正确答案 0不是 1 是';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TestBankAnswer"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_TestBankAnswer" IS '题库答案';

-- ----------------------------
-- Table structure for SA_TestBankAnswerForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TestBankAnswerForUsers";
CREATE TABLE "public"."SA_TestBankAnswerForUsers" (
  "TBid" uuid NOT NULL,
  "SAid" uuid NOT NULL,
  "Tid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "IsTrue" int2,
  "Answer" varchar(512) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CountForAnswer" int4
)
;
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."TBid" IS '题目id';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."Tid" IS '任务id';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."IsTrue" IS '是否回答正确 0错误 1正确';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."Answer" IS '选择答案';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TestBankAnswerForUsers"."CountForAnswer" IS '答题次数';
COMMENT ON TABLE "public"."SA_TestBankAnswerForUsers" IS '用户答题记录';

-- ----------------------------
-- Table structure for SA_Tips
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_Tips";
CREATE TABLE "public"."SA_Tips" (
  "Tipid" uuid NOT NULL,
  "ParentID" uuid,
  "Title" varchar(512) COLLATE "pg_catalog"."default",
  "Summary" varchar(1024) COLLATE "pg_catalog"."default",
  "BgImage" varchar(255) COLLATE "pg_catalog"."default",
  "TravelForDistance" int8,
  "Reading" int8,
  "Liker" int8,
  "Comment" int8,
  "NumberOfPeople" int8,
  "TagsOfCharacteristic" varchar(1024) COLLATE "pg_catalog"."default",
  "Spending" int8,
  "AmountOfHotel" int4,
  "AmountOfFood" int4,
  "AmountOfScenicArea" int4,
  "AmountOfArticle" int4,
  "Modus" int2,
  "AmountOfPerson" int2,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Theme" varchar(1023) COLLATE "pg_catalog"."default",
  "Status" int2,
  "Day" int2,
  "Collect" int8
)
;
COMMENT ON COLUMN "public"."SA_Tips"."Tipid" IS '攻略id';
COMMENT ON COLUMN "public"."SA_Tips"."ParentID" IS '父系id(采用的攻略id)';
COMMENT ON COLUMN "public"."SA_Tips"."Title" IS '标题';
COMMENT ON COLUMN "public"."SA_Tips"."Summary" IS '概要';
COMMENT ON COLUMN "public"."SA_Tips"."BgImage" IS '背景图';
COMMENT ON COLUMN "public"."SA_Tips"."TravelForDistance" IS '行程距离(米)';
COMMENT ON COLUMN "public"."SA_Tips"."Reading" IS '阅读量';
COMMENT ON COLUMN "public"."SA_Tips"."Liker" IS '点赞量';
COMMENT ON COLUMN "public"."SA_Tips"."Comment" IS '评论数';
COMMENT ON COLUMN "public"."SA_Tips"."NumberOfPeople" IS '行程推荐人数';
COMMENT ON COLUMN "public"."SA_Tips"."TagsOfCharacteristic" IS '特色标签,使用|分割每个标签';
COMMENT ON COLUMN "public"."SA_Tips"."Spending" IS '总花销(分)';
COMMENT ON COLUMN "public"."SA_Tips"."AmountOfHotel" IS '酒店数量';
COMMENT ON COLUMN "public"."SA_Tips"."AmountOfFood" IS '美食数量';
COMMENT ON COLUMN "public"."SA_Tips"."AmountOfScenicArea" IS '景区数量';
COMMENT ON COLUMN "public"."SA_Tips"."AmountOfArticle" IS '风物数量';
COMMENT ON COLUMN "public"."SA_Tips"."Modus" IS '交通形式';
COMMENT ON COLUMN "public"."SA_Tips"."AmountOfPerson" IS '人数';
COMMENT ON COLUMN "public"."SA_Tips"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_Tips"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_Tips"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_Tips"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_Tips"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_Tips"."Theme" IS '主题id串(使用|分割)';
COMMENT ON COLUMN "public"."SA_Tips"."Status" IS '审核状态(0:未完成(草稿箱),1:完成待审核,2:已拒绝,3:审核通过)';
COMMENT ON COLUMN "public"."SA_Tips"."Day" IS '行程共几天';
COMMENT ON COLUMN "public"."SA_Tips"."Collect" IS '收藏数';
COMMENT ON TABLE "public"."SA_Tips" IS '攻略信息';

-- ----------------------------
-- Table structure for SA_TipsForTrack
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TipsForTrack";
CREATE TABLE "public"."SA_TipsForTrack" (
  "TTid" uuid NOT NULL,
  "Spending" int8,
  "DescripOfSpending" varchar(255) COLLATE "pg_catalog"."default",
  "Remarks" varchar(1024) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Image" varchar(255) COLLATE "pg_catalog"."default",
  "ParentID" uuid,
  "TravelForDistance" int8,
  "Day" int2,
  "TimePoint" time(6),
  "Tipid" uuid,
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "SAid" uuid,
  "Modus" int2
)
;
COMMENT ON COLUMN "public"."SA_TipsForTrack"."TTid" IS '攻略轨迹id';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Spending" IS '花销(分)';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."DescripOfSpending" IS '花销简要描述(例如:入住酒店,描述应该是双人间)';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Remarks" IS '备注';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Image" IS '图片名称';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."ParentID" IS '父系追踪信息(由哪条信息派生)';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."TravelForDistance" IS '行程距离(米),距上一个轨迹的行程距离';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Day" IS '行程第几天';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."TimePoint" IS '时间';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Tipid" IS '攻略id';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Title" IS '简要标题';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."SAid" IS '地理信息id';
COMMENT ON COLUMN "public"."SA_TipsForTrack"."Modus" IS '交通形式';
COMMENT ON TABLE "public"."SA_TipsForTrack" IS '攻略轨迹';

-- ----------------------------
-- Table structure for SA_TipsReadingForUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TipsReadingForUsers";
CREATE TABLE "public"."SA_TipsReadingForUsers" (
  "Tipid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "CreateDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."SA_TipsReadingForUsers"."Tipid" IS '攻略id';
COMMENT ON COLUMN "public"."SA_TipsReadingForUsers"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_TipsReadingForUsers"."CreateDate" IS '建立时间';
COMMENT ON TABLE "public"."SA_TipsReadingForUsers" IS '用户阅读攻略记录';

-- ----------------------------
-- Table structure for SA_TokenClient
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TokenClient";
CREATE TABLE "public"."SA_TokenClient" (
  "ClientId" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientSecret" varchar(511) COLLATE "pg_catalog"."default",
  "GrantType" varchar(50) COLLATE "pg_catalog"."default",
  "Address" varchar(127) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "AccessToken" varchar(511) COLLATE "pg_catalog"."default",
  "ExpiresIn" int4,
  "ErrorDescription" varchar(511) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_TokenClient"."ClientId" IS '客户端id';
COMMENT ON COLUMN "public"."SA_TokenClient"."ClientSecret" IS '密钥';
COMMENT ON COLUMN "public"."SA_TokenClient"."GrantType" IS '认证类型';
COMMENT ON COLUMN "public"."SA_TokenClient"."Address" IS '地址';
COMMENT ON COLUMN "public"."SA_TokenClient"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TokenClient"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TokenClient"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TokenClient"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TokenClient"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_TokenClient"."AccessToken" IS 'token值';
COMMENT ON COLUMN "public"."SA_TokenClient"."ExpiresIn" IS '超时时间';
COMMENT ON COLUMN "public"."SA_TokenClient"."ErrorDescription" IS '错误描述';
COMMENT ON TABLE "public"."SA_TokenClient" IS 'token客户端';

-- ----------------------------
-- Table structure for SA_TouristArea
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_TouristArea";
CREATE TABLE "public"."SA_TouristArea" (
  "TAid" uuid NOT NULL,
  "ParentID" uuid,
  "SAid" uuid,
  "Lng" numeric(20,16),
  "Lat" numeric(20,16),
  "Title" varchar(255) COLLATE "pg_catalog"."default",
  "Description" varchar(512) COLLATE "pg_catalog"."default",
  "Remarks" varchar(1024) COLLATE "pg_catalog"."default",
  "DescriptionForSecPayment" varchar(512) COLLATE "pg_catalog"."default",
  "PriceForSecPayment" int8,
  "IconForMap" varchar(255) COLLATE "pg_catalog"."default",
  "HeaderImage" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_TouristArea"."TAid" IS '观光区id';
COMMENT ON COLUMN "public"."SA_TouristArea"."ParentID" IS '父系观光区id(所属观景区)';
COMMENT ON COLUMN "public"."SA_TouristArea"."SAid" IS '景点id(所属景区)';
COMMENT ON COLUMN "public"."SA_TouristArea"."Lng" IS '经度';
COMMENT ON COLUMN "public"."SA_TouristArea"."Lat" IS '维度';
COMMENT ON COLUMN "public"."SA_TouristArea"."Title" IS '标题';
COMMENT ON COLUMN "public"."SA_TouristArea"."Description" IS '简要说明';
COMMENT ON COLUMN "public"."SA_TouristArea"."Remarks" IS '备注';
COMMENT ON COLUMN "public"."SA_TouristArea"."DescriptionForSecPayment" IS '二次付费描述';
COMMENT ON COLUMN "public"."SA_TouristArea"."PriceForSecPayment" IS '二次付费价格(分),如果大于零需要二次付费';
COMMENT ON COLUMN "public"."SA_TouristArea"."IconForMap" IS '地图图标';
COMMENT ON COLUMN "public"."SA_TouristArea"."HeaderImage" IS '首图(文件名)';
COMMENT ON COLUMN "public"."SA_TouristArea"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_TouristArea"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_TouristArea"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_TouristArea"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_TouristArea"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_TouristArea" IS '观光区(点)信息';

-- ----------------------------
-- Table structure for SA_UsersEx
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersEx";
CREATE TABLE "public"."SA_UsersEx" (
  "Uid" uuid NOT NULL,
  "LFUid" int4,
  "Integral" int4,
  "IntegralForCast" int4,
  "EMail" varchar(255) COLLATE "pg_catalog"."default",
  "ClidForArea" uuid,
  "Collect" int4,
  "IsBigV" int2,
  "Tips" int8,
  "Attention" int4,
  "Pattention" int4,
  "NickName" varchar(255) COLLATE "pg_catalog"."default",
  "Label" varchar(255) COLLATE "pg_catalog"."default",
  "PushToken" varchar(255) COLLATE "pg_catalog"."default",
  "PushTokenType" int2
)
;
COMMENT ON COLUMN "public"."SA_UsersEx"."Uid" IS '用户信息(扩展)';
COMMENT ON COLUMN "public"."SA_UsersEx"."LFUid" IS '等级id';
COMMENT ON COLUMN "public"."SA_UsersEx"."Integral" IS '总积分';
COMMENT ON COLUMN "public"."SA_UsersEx"."IntegralForCast" IS '消耗积分';
COMMENT ON COLUMN "public"."SA_UsersEx"."EMail" IS 'email地址';
COMMENT ON COLUMN "public"."SA_UsersEx"."ClidForArea" IS '所在地区分类';
COMMENT ON COLUMN "public"."SA_UsersEx"."Collect" IS '收藏数';
COMMENT ON COLUMN "public"."SA_UsersEx"."IsBigV" IS '大v类型:0 用户未认证,1是企业认证,2是个人认证';
COMMENT ON COLUMN "public"."SA_UsersEx"."Tips" IS '攻略数';
COMMENT ON COLUMN "public"."SA_UsersEx"."Attention" IS '关注数';
COMMENT ON COLUMN "public"."SA_UsersEx"."Pattention" IS '被关注数';
COMMENT ON COLUMN "public"."SA_UsersEx"."NickName" IS '昵称';
COMMENT ON COLUMN "public"."SA_UsersEx"."Label" IS '标签';
COMMENT ON COLUMN "public"."SA_UsersEx"."PushToken" IS '用户app推送的token';
COMMENT ON COLUMN "public"."SA_UsersEx"."PushTokenType" IS '用户app推送token类型(1:小米,2:华为)';
COMMENT ON TABLE "public"."SA_UsersEx" IS '用户扩展';

-- ----------------------------
-- Table structure for SA_UsersExWithAttention
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithAttention";
CREATE TABLE "public"."SA_UsersExWithAttention" (
  "Uid" uuid NOT NULL,
  "AtUid" uuid NOT NULL,
  "Status" int2,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."AtUid" IS '被关注用户id';
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."Status" IS '是否关注';
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithAttention"."CreateIP" IS '建立IP';
COMMENT ON TABLE "public"."SA_UsersExWithAttention" IS '用户关注';

-- ----------------------------
-- Table structure for SA_UsersExWithCollect
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithCollect";
CREATE TABLE "public"."SA_UsersExWithCollect" (
  "Dataid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "DataType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."Dataid" IS '数据id';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."Uid" IS '用户信息(扩展)';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."DataType" IS '数据类型(dataid会根据该类型检索数据)';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_UsersExWithCollect"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_UsersExWithCollect" IS '用户收藏信息';

-- ----------------------------
-- Table structure for SA_UsersExWithComment
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithComment";
CREATE TABLE "public"."SA_UsersExWithComment" (
  "Comid" uuid NOT NULL,
  "Dataid" uuid,
  "DataType" int4,
  "Uid" uuid,
  "Content" varchar(511) COLLATE "pg_catalog"."default",
  "Liker" int8,
  "Comment" int8,
  "ParentID" uuid,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Comid" IS '评论id';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Dataid" IS '数据id';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."DataType" IS '数据类型(0:打卡点,1:攻略...,依照DataTypeForComment枚举)';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Content" IS '用户评论内容';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Liker" IS '点赞数';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Comment" IS '下级评论数';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."ParentID" IS '上级评论id';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithComment"."CreateIP" IS '建立IP';
COMMENT ON TABLE "public"."SA_UsersExWithComment" IS '评论';

-- ----------------------------
-- Table structure for SA_UsersExWithCommodity
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithCommodity";
CREATE TABLE "public"."SA_UsersExWithCommodity" (
  "UCDid" uuid NOT NULL,
  "Uid" uuid,
  "CDid" uuid,
  "Integral" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."UCDid" IS '用户兑换id';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."CDid" IS '商品管理';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."Integral" IS '所需积分';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_UsersExWithCommodity"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_UsersExWithCommodity" IS '用户商品兑换';

-- ----------------------------
-- Table structure for SA_UsersExWithFootPrint
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithFootPrint";
CREATE TABLE "public"."SA_UsersExWithFootPrint" (
  "FPid" uuid NOT NULL,
  "SAid" uuid,
  "Integral" int4,
  "Pedometer" int4,
  "TimeForStay" int4,
  "BeginTimeForStay" timestamp(6),
  "EndTimeForStay" timestamp(6),
  "PerfectionCountForTask" int4,
  "PerfectionCountForExploration" int4,
  "UploadPic" int4,
  "Status" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid,
  "Recycle" int2
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."Integral" IS '积分';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."Pedometer" IS '步数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."TimeForStay" IS '分钟';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."BeginTimeForStay" IS '逗留开始时间';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."EndTimeForStay" IS '逗留结束时间';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."PerfectionCountForTask" IS '任务完成数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."PerfectionCountForExploration" IS '探索完成数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."UploadPic" IS '上传照片数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."Status" IS '是否完成游玩(0:游玩未完成,1:游玩已完成)';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."CreateUid" IS '创建用户';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrint"."Recycle" IS '回收站';
COMMENT ON TABLE "public"."SA_UsersExWithFootPrint" IS '用户足迹';

-- ----------------------------
-- Table structure for SA_UsersExWithFootPrintForCheckPoint
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithFootPrintForCheckPoint";
CREATE TABLE "public"."SA_UsersExWithFootPrintForCheckPoint" (
  "FPid" uuid NOT NULL,
  "Liker" int8,
  "Comment" int8,
  "Collect" int8,
  "Content" varchar(1023) COLLATE "pg_catalog"."default",
  "Status" int2,
  "IsSpeed" int2
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."FPid" IS '用户足迹id(扩展)用户照片采用SA_UsersExWithPhoto与SA_FootPrintForUsersExWithPhoto';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."Liker" IS '点赞数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."Comment" IS '评论数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."Collect" IS '收藏数';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."Content" IS '打卡内容';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."Status" IS '状态 0 未审核 1 拒绝 2 审核通过 3草稿箱';
COMMENT ON COLUMN "public"."SA_UsersExWithFootPrintForCheckPoint"."IsSpeed" IS '是否快速打卡（0:不是1：是）';
COMMENT ON TABLE "public"."SA_UsersExWithFootPrintForCheckPoint" IS '打卡点足迹信息扩展';

-- ----------------------------
-- Table structure for SA_UsersExWithIntegral
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithIntegral";
CREATE TABLE "public"."SA_UsersExWithIntegral" (
  "INTid" uuid NOT NULL,
  "FPid" uuid,
  "Uid" uuid,
  "SAid" uuid,
  "TAid" uuid,
  "Integral" int4,
  "INTTypeId" uuid,
  "INTType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."INTid" IS '积分id';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."FPid" IS '用户足迹id';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."TAid" IS '观光区id';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."Integral" IS '积分';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."INTTypeId" IS '完成任务类型id(例如:任务id)';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."INTType" IS '积分类型(0:完成任务获得...)';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_UsersExWithIntegral"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_UsersExWithIntegral" IS '用户积分';

-- ----------------------------
-- Table structure for SA_UsersExWithLiker
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithLiker";
CREATE TABLE "public"."SA_UsersExWithLiker" (
  "Dataid" uuid NOT NULL,
  "Uid" uuid NOT NULL,
  "DataType" int4,
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."Dataid" IS '数据id';
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."Uid" IS '用户id';
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."DataType" IS '数据类型(依照CollectType枚举)';
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithLiker"."CreateIP" IS '建立IP';
COMMENT ON TABLE "public"."SA_UsersExWithLiker" IS '用户点赞';

-- ----------------------------
-- Table structure for SA_UsersExWithPhoto
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithPhoto";
CREATE TABLE "public"."SA_UsersExWithPhoto" (
  "UFPid" uuid NOT NULL,
  "Uid" uuid,
  "SAid" uuid,
  "ImagePath" varchar(255) COLLATE "pg_catalog"."default",
  "Recycle" int2,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."UFPid" IS '用户照片id';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."ImagePath" IS '相片路径';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."Recycle" IS '回收站';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_UsersExWithPhoto"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_UsersExWithPhoto" IS '用户拍照相片';

-- ----------------------------
-- Table structure for SA_UsersExWithScenicArea
-- ----------------------------
DROP TABLE IF EXISTS "public"."SA_UsersExWithScenicArea";
CREATE TABLE "public"."SA_UsersExWithScenicArea" (
  "Uid" uuid NOT NULL,
  "SAid" uuid NOT NULL,
  "Integral" int4,
  "Pedometer" int4,
  "TimeForStay" int4,
  "PerfectionCountForTask" int4,
  "PerfectionCountForExploration" int4,
  "UploadPic" int4,
  "Updated" timestamp(6),
  "CreateDate" timestamp(6),
  "CreateIP" varchar(100) COLLATE "pg_catalog"."default",
  "CreateUid" uuid
)
;
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."Uid" IS '用户信息';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."SAid" IS '景点id';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."Integral" IS '积分';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."Pedometer" IS '步数';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."TimeForStay" IS '分钟';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."PerfectionCountForTask" IS '任务完成数';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."PerfectionCountForExploration" IS '探索完成数';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."UploadPic" IS '上传照片数';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."Updated" IS '更新时间';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."CreateDate" IS '建立时间';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."CreateIP" IS '建立IP';
COMMENT ON COLUMN "public"."SA_UsersExWithScenicArea"."CreateUid" IS '创建用户';
COMMENT ON TABLE "public"."SA_UsersExWithScenicArea" IS '用户所在景点信息统计';

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
-- View structure for SV_SA_ScenicArea
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_ScenicArea";
CREATE VIEW "public"."SV_SA_ScenicArea" AS  SELECT "SA"."SAid",
    "SA"."Title",
    "SA"."SmallTitle",
    "SA"."Details",
    "SA"."ClidForCivilization",
    "SA"."Level",
    "SA"."Collect",
    "SA"."PriceForDoor",
    "SA"."PriceForDoorWithChild",
    "SA"."HeaderImage",
    "SA"."PinYin",
    "SA"."BeginTimeForBusiness",
    "SA"."EndTimeForBusiness",
    "SA"."BgImage",
    "SA"."Recycle",
    "SA"."Updated",
    "SA"."CreateDate",
    "SA"."CreateIP",
    "SA"."CreateUid",
    "SA"."NumOfExploration",
    "SA"."Phone",
    "SA"."Introduction",
    "SA"."Liker",
    "SA"."TaskRules",
    "SA"."ArticleRules",
    "SA"."GameDescription",
    "LI"."Lng" AS "LILng",
    "LI"."Lat" AS "LILat",
    "LI"."Clid" AS "LIClid",
    "LI"."Addr" AS "LIAddr",
    "LI"."PlaceType" AS "LIPlaceType",
    "LI"."PublishType" AS "LIPublishType",
    "LI"."Recycle" AS "LIRecycle",
    "LI"."Updated" AS "LIUpdated",
    "LI"."CreateDate" AS "LICreateDate",
    "LI"."CreateIP" AS "LICreateIP",
    "LI"."CreateUid" AS "LICreateUid",
    "LI"."Name" AS "LIName",
    "LI"."Phone" AS "LIPhone",
    "LI"."Email" AS "LIEmail",
    "LI"."IsParking" AS "LIIsParking"
   FROM ("SA_LocationInfo" "LI"
     JOIN "SA_ScenicArea" "SA" ON (("LI"."SAid" = "SA"."SAid")));

-- ----------------------------
-- View structure for SV_SA_ScenicAreaWithFeatures
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_ScenicAreaWithFeatures";
CREATE VIEW "public"."SV_SA_ScenicAreaWithFeatures" AS  SELECT "SA_ScenicAreaWithFeatures"."SARFid",
    "SA_ScenicAreaWithFeatures"."Fid",
    "SA_ScenicAreaWithFeatures"."SAid",
    "SA_ScenicAreaWithFeatures"."DescriptionForSecPayment",
    "SA_ScenicAreaWithFeatures"."Description",
    "SA_ScenicAreaWithFeatures"."PriceForSecPayment",
    "SA_ScenicAreaWithFeatures"."Updated",
    "SA_ScenicAreaWithFeatures"."Recycle",
    "SA_ScenicAreaWithFeatures"."CreateDate",
    "SA_ScenicAreaWithFeatures"."CreateIP",
    "SA_ScenicAreaWithFeatures"."CreateUid",
    "FT"."Title" AS "FTTitle",
    "FT"."Description" AS "FTDescription",
    "FT"."Remarks" AS "FTRemarks",
    "FT"."Recycle" AS "FTRecycle",
    "FT"."Updated" AS "FTUpdated",
    "FT"."CreateDate" AS "FTCreateDate",
    "FT"."CreateIP" AS "FTCreateIP",
    "FT"."CreateUid" AS "FTCreateUid",
    "SA"."Title" AS "SATitle",
    "SA"."SmallTitle" AS "SASmallTitle",
    "SA"."Details" AS "SADetails",
    "SA"."ClidForCivilization" AS "SAClidForCivilization",
    "SA"."Level" AS "SALevel",
    "SA"."Collect" AS "SACollect",
    "SA"."PinYin" AS "SAPinYin",
    "SA"."HeaderImage" AS "SAHeaderImage",
    "SA"."PriceForDoor" AS "SAPriceForDoor",
    "SA"."PriceForDoorWithChild" AS "SAPriceForDoorWithChild",
    "SA"."Recycle" AS "SARecycle",
    "SA"."Updated" AS "SAUpdated",
    "SA"."CreateDate" AS "SACreateDate",
    "SA"."CreateIP" AS "SACreateIP",
    "SA"."CreateUid" AS "SACreateUid",
    "SA"."TaskRules" AS "SATaskRules",
    "SA"."ArticleRules" AS "SAArticleRules",
    "SA"."GameDescription" AS "SAGameDescription",
    "SA"."BeginTimeForBusiness" AS "SABeginTimeForBusiness",
    "SA"."EndTimeForBusiness" AS "SAEndTimeForBusiness",
    "FT"."IconForMap" AS "FTIconForMap",
    "SA"."BgImage" AS "SABgImage",
    "SA_ScenicAreaWithFeatures"."HeaderImage",
    "SA"."NumOfExploration" AS "SANumOfExploration",
    "SA"."Phone" AS "SAPhone",
    "SA"."Introduction" AS "SAIntroduction"
   FROM (("SA_ScenicAreaWithFeatures"
     JOIN "SA_Features" "FT" ON (("SA_ScenicAreaWithFeatures"."Fid" = "FT"."Fid")))
     JOIN "SA_ScenicArea" "SA" ON (("SA_ScenicAreaWithFeatures"."SAid" = "SA"."SAid")));

-- ----------------------------
-- View structure for SV_SA_TaskForUsers
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_TaskForUsers";
CREATE VIEW "public"."SV_SA_TaskForUsers" AS  SELECT "TFU"."Tid",
    "TFU"."Uid",
    "TFU"."Status",
    "TFU"."PerfectionContent",
    "TFU"."Updated",
    "TFU"."CreateDate",
    "TFU"."CreateIP",
    "TFU"."CreateUid",
    "TFU"."IsProductDecompositionLock",
    "T"."EXPid" AS "TEXPid",
    "T"."ParentID" AS "TParentID",
    "T"."Title" AS "TTitle",
    "T"."Lng" AS "TLng",
    "T"."Lat" AS "TLat",
    "T"."RadiusForTrigger" AS "TRadiusForTrigger",
    "T"."Prompt" AS "TPrompt",
    "T"."ModuleId" AS "TModuleId",
    "T"."Integral" AS "TIntegral",
    "T"."DescriptionForSuc" AS "TDescriptionForSuc",
    "T"."DescriptionImageForSuc" AS "TDescriptionImageForSuc",
    "T"."IconForMap" AS "TIconForMap",
    "T"."DisableIconForMap" AS "TDisableIconForMap",
    "T"."UnfinishedIconForMap" AS "TUnfinishedIconForMap",
    "T"."Recycle" AS "TRecycle",
    "T"."Updated" AS "TUpdated",
    "T"."CreateDate" AS "TCreateDate",
    "T"."CreateIP" AS "TCreateIP",
    "T"."CreateUid" AS "TCreateUid",
    "T"."IsMustComplete" AS "TIsMustComplete",
    "T"."IsAppintTask" AS "TIsAppintTask",
    "T"."ProductDecompositionLock" AS "TProductDecompositionLock"
   FROM ("SA_Task" "T"
     JOIN "SA_TaskForUsers" "TFU" ON (("T"."Tid" = "TFU"."Tid")));

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
   FROM (("Fat_AppFileGroupRelatDep" "AFGRDEP"
     JOIN "Fat_AppFileGroup" "AFG" ON (("AFG"."AFGid" = "AFGRDEP"."AFGid")))
     JOIN "Fat_Department" "DEP" ON (("DEP"."DepID" = "AFGRDEP"."DepID")));

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
   FROM ("Fat_AppFileInfoRelatAppFileGroup"
     JOIN "Fat_AppFileGroup" "AG" ON (("Fat_AppFileInfoRelatAppFileGroup"."AFGid" = "AG"."AFGid")));

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
   FROM ("Fat_PostRelatUsers" "PRU"
     JOIN "Fat_Users" "UR" ON (("UR"."Uid" = "PRU"."Uid")));

-- ----------------------------
-- View structure for SV_SA_ArticleRelatTask
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_ArticleRelatTask";
CREATE VIEW "public"."SV_SA_ArticleRelatTask" AS  SELECT "ART"."Tid",
    "ART"."SASid",
    "ART"."CreateDate",
    "ART"."CreateIP",
    "ART"."CreateUid",
    "A"."Title" AS "ATitle",
    "A"."SmallTitle" AS "ASmallTitle",
    "A"."Icon" AS "AIcon",
    "A"."Recycle" AS "ARecycle",
    "A"."Updated" AS "AUpdated",
    "A"."CreateDate" AS "ACreateDate",
    "A"."CreateIP" AS "ACreateIP",
    "A"."CreateUid" AS "ACreateUid",
    "A"."Integral" AS "AIntegral",
    "A"."Content" AS "AContent",
    "A"."SAid" AS "ASAid",
    "T"."EXPid" AS "TEXPid",
    "T"."ParentID" AS "TParentID",
    "T"."Title" AS "TTitle",
    "T"."Lng" AS "TLng",
    "T"."Lat" AS "TLat",
    "T"."RadiusForTrigger" AS "TRadiusForTrigger",
    "T"."Prompt" AS "TPrompt",
    "T"."ModuleId" AS "TModuleId",
    "T"."Integral" AS "TIntegral",
    "T"."DescriptionForSuc" AS "TDescriptionForSuc",
    "T"."DescriptionImageForSuc" AS "TDescriptionImageForSuc",
    "T"."IconForMap" AS "TIconForMap",
    "T"."DisableIconForMap" AS "TDisableIconForMap",
    "T"."UnfinishedIconForMap" AS "TUnfinishedIconForMap",
    "T"."Recycle" AS "TRecycle",
    "T"."Updated" AS "TUpdated",
    "T"."CreateDate" AS "TCreateDate",
    "T"."CreateIP" AS "TCreateIP",
    "T"."CreateUid" AS "TCreateUid",
    "T"."SAid" AS "TSAid"
   FROM (("SA_ArticleRelatTask" "ART"
     JOIN "SA_Article" "A" ON (("ART"."SASid" = "A"."SASid")))
     JOIN "SA_Task" "T" ON (("ART"."Tid" = "T"."Tid")));

-- ----------------------------
-- View structure for SV_SA_ClassificationForArea
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_ClassificationForArea";
CREATE VIEW "public"."SV_SA_ClassificationForArea" AS  SELECT "CLA"."Clid",
    "CLA"."ADCode",
    "CLA"."CityCode",
    "CLA"."Lng",
    "CLA"."Lat",
    "CL"."ParentID" AS "CLParentID",
    "CL"."Name" AS "CLName",
    "CL"."Remark" AS "CLRemark",
    "CL"."Sort" AS "CLSort",
    "CL"."UseType" AS "CLUseType",
    "CL"."ClidIndex" AS "CLClidIndex",
    "CL"."Eid" AS "CLEid",
    "CL"."Recycle" AS "CLRecycle",
    "CL"."Updated" AS "CLUpdated",
    "CL"."CreateDate" AS "CLCreateDate",
    "CL"."CreateIP" AS "CLCreateIP",
    "CL"."CreateUid" AS "CLCreateUid",
    "CLA"."BgImage",
    "CLA"."Tags"
   FROM ("Fat_Classification" "CL"
     JOIN "SA_ClassificationForArea" "CLA" ON (("CL"."Clid" = "CLA"."Clid")));

-- ----------------------------
-- View structure for SV_SA_FootPrintForUsersExWithPhoto
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_FootPrintForUsersExWithPhoto";
CREATE VIEW "public"."SV_SA_FootPrintForUsersExWithPhoto" AS  SELECT "FPFUEWP"."UFPid",
    "FPFUEWP"."FPid",
    "FPFUEWP"."Updated",
    "FPFUEWP"."CreateDate",
    "FPFUEWP"."CreateIP",
    "FPFUEWP"."CreateUid",
    "UEWP"."Uid" AS "UEWPUid",
    "UEWP"."SAid" AS "UEWPSAid",
    "UEWP"."ImagePath" AS "UEWPImagePath",
    "UEWP"."Recycle" AS "UEWPRecycle",
    "UEWP"."Updated" AS "UEWPUpdated",
    "UEWP"."CreateDate" AS "UEWPCreateDate",
    "UEWP"."CreateIP" AS "UEWPCreateIP",
    "UEWP"."CreateUid" AS "UEWPCreateUid"
   FROM ("SA_FootPrintForUsersExWithPhoto" "FPFUEWP"
     JOIN "SA_UsersExWithPhoto" "UEWP" ON (("FPFUEWP"."UFPid" = "UEWP"."UFPid")));

-- ----------------------------
-- View structure for SV_SA_TipsForTrack
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_TipsForTrack";
CREATE VIEW "public"."SV_SA_TipsForTrack" AS  SELECT "TFT"."TTid",
    "TFT"."Spending",
    "TFT"."DescripOfSpending",
    "TFT"."Remarks",
    "TFT"."Recycle",
    "TFT"."Updated",
    "TFT"."CreateDate",
    "TFT"."CreateIP",
    "TFT"."CreateUid",
    "TFT"."Image",
    "TFT"."ParentID",
    "TFT"."TravelForDistance",
    "TFT"."Day",
    "TFT"."TimePoint",
    "TFT"."Tipid",
    "TFT"."Title",
    "TFT"."SAid",
    "TFT"."Modus",
    "LI"."Lng" AS "LILng",
    "LI"."Lat" AS "LILat",
    "LI"."Clid" AS "LIClid",
    "LI"."Addr" AS "LIAddr",
    "LI"."PlaceType" AS "LIPlaceType",
    "LI"."PublishType" AS "LIPublishType",
    "LI"."Recycle" AS "LIRecycle",
    "LI"."Updated" AS "LIUpdated",
    "LI"."CreateDate" AS "LICreateDate",
    "LI"."CreateIP" AS "LICreateIP",
    "LI"."CreateUid" AS "LICreateUid",
    "LI"."Name" AS "LIName",
    "LI"."Phone" AS "LIPhone",
    "LI"."Email" AS "LIEmail",
    "LI"."IsParking" AS "LIIsParking"
   FROM ("SA_TipsForTrack" "TFT"
     JOIN "SA_LocationInfo" "LI" ON (("TFT"."SAid" = "LI"."SAid")));

-- ----------------------------
-- View structure for SV_SA_UsersExWithFootPrintForCheckPoint
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_UsersExWithFootPrintForCheckPoint";
CREATE VIEW "public"."SV_SA_UsersExWithFootPrintForCheckPoint" AS  SELECT "UEWFP"."SAid" AS "UEWFPSAid",
    "UEWFP"."Integral" AS "UEWFPIntegral",
    "UEWFP"."Pedometer" AS "UEWFPPedometer",
    "UEWFP"."TimeForStay" AS "UEWFPTimeForStay",
    "UEWFP"."BeginTimeForStay" AS "UEWFPBeginTimeForStay",
    "UEWFP"."EndTimeForStay" AS "UEWFPEndTimeForStay",
    "UEWFP"."PerfectionCountForTask" AS "UEWFPPerfectionCountForTask",
    "UEWFP"."PerfectionCountForExploration" AS "UEWFPPerfectionCountForExploration",
    "UEWFP"."UploadPic" AS "UEWFPUploadPic",
    "UEWFP"."Status" AS "UEWFPStatus",
    "UEWFP"."CreateDate" AS "UEWFPCreateDate",
    "UEWFP"."Updated" AS "UEWFPUpdated",
    "UEWFP"."CreateIP" AS "UEWFPCreateIP",
    "UEWFP"."CreateUid" AS "UEWFPCreateUid",
    "UEWFPFCP"."FPid",
    "UEWFP"."Recycle" AS "UEWFPRecycle",
    "UEWFPFCP"."Liker",
    "UEWFPFCP"."Comment",
    "UEWFPFCP"."Collect",
    "UEWFPFCP"."Content",
    "UEWFPFCP"."Status",
    "UEWFPFCP"."IsSpeed",
    "LI"."Clid" AS "LIClid",
    "LI"."Lng" AS "LILng",
    "LI"."Lat" AS "LILat",
    "LI"."Addr" AS "LIAddr",
    "LI"."Recycle" AS "LIRecycle",
    "LI"."PlaceType" AS "LIPlaceType",
    "LI"."PublishType" AS "LIPublishType",
    "LI"."Name" AS "LIName",
    "LI"."Phone" AS "LIPhone",
    "LI"."Email" AS "LIEmail",
    "LI"."IsParking" AS "LIIsParking"
   FROM (("SA_UsersExWithFootPrint" "UEWFP"
     JOIN "SA_UsersExWithFootPrintForCheckPoint" "UEWFPFCP" ON (("UEWFP"."FPid" = "UEWFPFCP"."FPid")))
     JOIN "SA_LocationInfo" "LI" ON (("UEWFP"."SAid" = "LI"."SAid")));

-- ----------------------------
-- View structure for SV_SA_UsersExWithFootPrint
-- ----------------------------
DROP VIEW IF EXISTS "public"."SV_SA_UsersExWithFootPrint";
CREATE VIEW "public"."SV_SA_UsersExWithFootPrint" AS  SELECT "SA_UsersExWithFootPrint"."FPid",
    "SA_UsersExWithFootPrint"."SAid",
    "SA_UsersExWithFootPrint"."Integral",
    "SA_UsersExWithFootPrint"."Pedometer",
    "SA_UsersExWithFootPrint"."TimeForStay",
    "SA_UsersExWithFootPrint"."BeginTimeForStay",
    "SA_UsersExWithFootPrint"."EndTimeForStay",
    "SA_UsersExWithFootPrint"."PerfectionCountForTask",
    "SA_UsersExWithFootPrint"."PerfectionCountForExploration",
    "SA_UsersExWithFootPrint"."UploadPic",
    "SA_UsersExWithFootPrint"."Status",
    "SA_UsersExWithFootPrint"."Updated",
    "SA_UsersExWithFootPrint"."CreateDate",
    "SA_UsersExWithFootPrint"."CreateIP",
    "SA_UsersExWithFootPrint"."CreateUid",
    "SA"."Title" AS "SATitle",
    "SA"."SmallTitle" AS "SASmallTitle",
    "SA"."Details" AS "SADetails",
    "SA"."ClidForCivilization" AS "SAClidForCivilization",
    "SA"."Level" AS "SALevel",
    "SA"."Collect" AS "SACollect",
    "SA"."PriceForDoor" AS "SAPriceForDoor",
    "SA"."PriceForDoorWithChild" AS "SAPriceForDoorWithChild",
    "SA"."HeaderImage" AS "SAHeaderImage",
    "SA"."PinYin" AS "SAPinYin",
    "SA"."BeginTimeForBusiness" AS "SABeginTimeForBusiness",
    "SA"."EndTimeForBusiness" AS "SAEndTimeForBusiness",
    "SA"."BgImage" AS "SABgImage",
    "SA"."Recycle" AS "SARecycle",
    "SA"."Updated" AS "SAUpdated",
    "SA"."CreateDate" AS "SACreateDate",
    "SA"."CreateIP" AS "SACreateIP",
    "SA"."CreateUid" AS "SACreateUid",
    "CL"."ParentID" AS "CLParentID",
    "CL"."Name" AS "CLName",
    "CL"."Remark" AS "CLRemark",
    "CL"."Sort" AS "CLSort",
    "CL"."UseType" AS "CLUseType",
    "CL"."ClidIndex" AS "CLClidIndex",
    "CL"."Eid" AS "CLEid",
    "CL"."Recycle" AS "CLRecycle",
    "CL"."Updated" AS "CLUpdated",
    "CL"."CreateDate" AS "CLCreateDate",
    "CL"."CreateIP" AS "CLCreateIP",
    "CL"."CreateUid" AS "CLCreateUid",
    "LI"."Lng" AS "LILng",
    "LI"."Lat" AS "LILat",
    "LI"."Clid" AS "LIClid",
    "LI"."Addr" AS "LIAddr",
    "LI"."PlaceType" AS "LIPlaceType",
    "LI"."PublishType" AS "LIPublishType",
    "LI"."Recycle" AS "LIRecycle",
    "LI"."Updated" AS "LIUpdated",
    "LI"."CreateDate" AS "LICreateDate",
    "LI"."CreateIP" AS "LICreateIP",
    "LI"."CreateUid" AS "LICreateUid",
    "LI"."Name" AS "LIName",
    "LI"."Phone" AS "LIPhone",
    "LI"."Email" AS "LIEmail",
    "LI"."IsParking" AS "LIIsParking"
   FROM ((("SA_UsersExWithFootPrint"
     JOIN "SA_ScenicArea" "SA" ON (("SA_UsersExWithFootPrint"."SAid" = "SA"."SAid")))
     JOIN "SA_LocationInfo" "LI" ON (("SA_UsersExWithFootPrint"."SAid" = "LI"."SAid")))
     JOIN "Fat_Classification" "CL" ON (("LI"."Clid" = "CL"."Clid")));

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
   FROM ("Fat_Users"
     JOIN "Fat_UserAuths" "UA" ON (("Fat_Users"."Uid" = "UA"."Uid")));

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
   FROM ((("Fat_WeiXinSubscribe"
     JOIN "Fat_Enterprise" "ET" ON (("Fat_WeiXinSubscribe"."Eid" = "ET"."Eid")))
     JOIN "Fat_Users" "UR" ON (("Fat_WeiXinSubscribe"."Uid" = "UR"."Uid")))
     JOIN "Fat_WeiXinConfig" "WXC" ON ((("WXC"."Gid")::text = ("Fat_WeiXinSubscribe"."Gid")::text)));

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

-- ----------------------------
-- Primary Key structure for table SA_Activity
-- ----------------------------
ALTER TABLE "public"."SA_Activity" ADD CONSTRAINT "SA_Activity_pkey" PRIMARY KEY ("Aid");

-- ----------------------------
-- Primary Key structure for table SA_ActivityForModulesData
-- ----------------------------
ALTER TABLE "public"."SA_ActivityForModulesData" ADD CONSTRAINT "SA_ActivityForModulesData_pkey" PRIMARY KEY ("Aid", "DataId");

-- ----------------------------
-- Primary Key structure for table SA_Article
-- ----------------------------
ALTER TABLE "public"."SA_Article" ADD CONSTRAINT "SA_Article_pkey" PRIMARY KEY ("SASid");

-- ----------------------------
-- Primary Key structure for table SA_ArticleForUsers
-- ----------------------------
ALTER TABLE "public"."SA_ArticleForUsers" ADD CONSTRAINT "SA_ArticleForUsers_pkey" PRIMARY KEY ("SASid", "Tid", "Uid", "EXPid", "SAid");

-- ----------------------------
-- Primary Key structure for table SA_ArticleRelatTask
-- ----------------------------
ALTER TABLE "public"."SA_ArticleRelatTask" ADD CONSTRAINT "SA_ArticleRelatTask_pkey" PRIMARY KEY ("Tid", "SASid");

-- ----------------------------
-- Primary Key structure for table SA_AuditForExplain
-- ----------------------------
ALTER TABLE "public"."SA_AuditForExplain" ADD CONSTRAINT "SA_AuditForExplain_pkey" PRIMARY KEY ("DataId", "AEid");

-- ----------------------------
-- Primary Key structure for table SA_ClassificationForArea
-- ----------------------------
ALTER TABLE "public"."SA_ClassificationForArea" ADD CONSTRAINT "SA_ClassificationForArea_pkey" PRIMARY KEY ("Clid");

-- ----------------------------
-- Primary Key structure for table SA_ClassificationForLocation
-- ----------------------------
ALTER TABLE "public"."SA_ClassificationForLocation" ADD CONSTRAINT "SA_ClassificationForLocation_pkey" PRIMARY KEY ("ParentID", "Clid");

-- ----------------------------
-- Primary Key structure for table SA_Commodity
-- ----------------------------
ALTER TABLE "public"."SA_Commodity" ADD CONSTRAINT "SA_Commodity_pkey" PRIMARY KEY ("CDid");

-- ----------------------------
-- Primary Key structure for table SA_Complaints
-- ----------------------------
ALTER TABLE "public"."SA_Complaints" ADD CONSTRAINT "SA_Complaints_pkey" PRIMARY KEY ("CoId");

-- ----------------------------
-- Primary Key structure for table SA_Content
-- ----------------------------
ALTER TABLE "public"."SA_Content" ADD CONSTRAINT "SA_Content_pkey" PRIMARY KEY ("Cid");

-- ----------------------------
-- Primary Key structure for table SA_ContentAtta
-- ----------------------------
ALTER TABLE "public"."SA_ContentAtta" ADD CONSTRAINT "SA_ContentAtta_pkey" PRIMARY KEY ("CRAid");

-- ----------------------------
-- Primary Key structure for table SA_Exploration
-- ----------------------------
ALTER TABLE "public"."SA_Exploration" ADD CONSTRAINT "SA_Exploration_pkey" PRIMARY KEY ("EXPid");

-- ----------------------------
-- Primary Key structure for table SA_ExplorationForUsers
-- ----------------------------
ALTER TABLE "public"."SA_ExplorationForUsers" ADD CONSTRAINT "SA_ExplorationForUsers_pkey" PRIMARY KEY ("Uid", "EXPid");

-- ----------------------------
-- Primary Key structure for table SA_Features
-- ----------------------------
ALTER TABLE "public"."SA_Features" ADD CONSTRAINT "SA_Features_pkey" PRIMARY KEY ("Fid");

-- ----------------------------
-- Primary Key structure for table SA_FootPrintForActivityForUsers
-- ----------------------------
ALTER TABLE "public"."SA_FootPrintForActivityForUsers" ADD CONSTRAINT "SA_FootPrintForActivityForUsers_pkey" PRIMARY KEY ("Aid", "FPid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_FootPrintForExplorationForUsers
-- ----------------------------
ALTER TABLE "public"."SA_FootPrintForExplorationForUsers" ADD CONSTRAINT "SA_FootPrintForExplorationForUsers_pkey" PRIMARY KEY ("Uid", "EXPid", "FPid");

-- ----------------------------
-- Primary Key structure for table SA_FootPrintForTaskForUsers
-- ----------------------------
ALTER TABLE "public"."SA_FootPrintForTaskForUsers" ADD CONSTRAINT "SA_FootPrintForTaskWithExplorationForUsers_pkey" PRIMARY KEY ("Tid", "Uid", "FPid");

-- ----------------------------
-- Primary Key structure for table SA_FootPrintForUsersExWithPhoto
-- ----------------------------
ALTER TABLE "public"."SA_FootPrintForUsersExWithPhoto" ADD CONSTRAINT "SA_FootPrintForUsersExWithPhoto_pkey" PRIMARY KEY ("UFPid", "FPid");

-- ----------------------------
-- Primary Key structure for table SA_FootPrintForUsersWithFeedBack
-- ----------------------------
ALTER TABLE "public"."SA_FootPrintForUsersWithFeedBack" ADD CONSTRAINT "SA_FootPrintForUsersWithFeedBack_pkey" PRIMARY KEY ("FPid");

-- ----------------------------
-- Primary Key structure for table SA_FootPrintWithTrack
-- ----------------------------
ALTER TABLE "public"."SA_FootPrintWithTrack" ADD CONSTRAINT "SA_FootPrintWithTrack_pkey" PRIMARY KEY ("FPTid");

-- ----------------------------
-- Primary Key structure for table SA_GameForRead
-- ----------------------------
ALTER TABLE "public"."SA_GameForRead" ADD CONSTRAINT "SA_GameForRead_pkey" PRIMARY KEY ("Tid");

-- ----------------------------
-- Primary Key structure for table SA_GameForReadAttr
-- ----------------------------
ALTER TABLE "public"."SA_GameForReadAttr" ADD CONSTRAINT "SA_GameForReadAttr_pkey" PRIMARY KEY ("TCid");

-- ----------------------------
-- Primary Key structure for table SA_GameForTestBank
-- ----------------------------
ALTER TABLE "public"."SA_GameForTestBank" ADD CONSTRAINT "SA_GameForTestBank_pkey" PRIMARY KEY ("Tid", "TBid");

-- ----------------------------
-- Primary Key structure for table SA_Hint
-- ----------------------------
ALTER TABLE "public"."SA_Hint" ADD CONSTRAINT "SA_Hint_pkey" PRIMARY KEY ("Hid");

-- ----------------------------
-- Primary Key structure for table SA_History
-- ----------------------------
ALTER TABLE "public"."SA_History" ADD CONSTRAINT "SA_History_pkey" PRIMARY KEY ("Hid");

-- ----------------------------
-- Primary Key structure for table SA_Hotel
-- ----------------------------
ALTER TABLE "public"."SA_Hotel" ADD CONSTRAINT "SA_Hotel_pkey" PRIMARY KEY ("SAid");

-- ----------------------------
-- Primary Key structure for table SA_IntangibleCulturalHeritage
-- ----------------------------
ALTER TABLE "public"."SA_IntangibleCulturalHeritage" ADD CONSTRAINT "SA_IntangibleCulturalHeritage_pkey" PRIMARY KEY ("ICHid");

-- ----------------------------
-- Primary Key structure for table SA_IntangibleCulturalHeritageWithArea
-- ----------------------------
ALTER TABLE "public"."SA_IntangibleCulturalHeritageWithArea" ADD CONSTRAINT "SA_IntangibleCulturalHeritageWithArea_pkey" PRIMARY KEY ("ICHid", "Clid");

-- ----------------------------
-- Indexes structure for table SA_KeyWord
-- ----------------------------
CREATE INDEX "INDEX_Frequency" ON "public"."SA_KeyWord" USING btree (
  "Frequency" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "INDEX_KeyWord_Frequency" ON "public"."SA_KeyWord" USING btree (
  "KeyWord" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Frequency" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table SA_KeyWord
-- ----------------------------
ALTER TABLE "public"."SA_KeyWord" ADD CONSTRAINT "SA_KeyWord_pkey" PRIMARY KEY ("KeyWord");

-- ----------------------------
-- Primary Key structure for table SA_Knowledge
-- ----------------------------
ALTER TABLE "public"."SA_Knowledge" ADD CONSTRAINT "SA_Knowledge_pkey" PRIMARY KEY ("Kid");

-- ----------------------------
-- Primary Key structure for table SA_LevelForUsers
-- ----------------------------
ALTER TABLE "public"."SA_LevelForUsers" ADD CONSTRAINT "SA_LevelForUsers_pkey" PRIMARY KEY ("LFUid");

-- ----------------------------
-- Uniques structure for table SA_LocationInfo
-- ----------------------------
ALTER TABLE "public"."SA_LocationInfo" ADD CONSTRAINT "SA_LocationInfo_Lng_Lat_key" UNIQUE ("Lng", "Lat");

-- ----------------------------
-- Primary Key structure for table SA_LocationInfo
-- ----------------------------
ALTER TABLE "public"."SA_LocationInfo" ADD CONSTRAINT "SA_LocationInfo_pkey" PRIMARY KEY ("SAid");

-- ----------------------------
-- Primary Key structure for table SA_LocationInfoWithImage
-- ----------------------------
ALTER TABLE "public"."SA_LocationInfoWithImage" ADD CONSTRAINT "SA_LocationInfoWithImage_pkey" PRIMARY KEY ("SAid", "ImagePath");

-- ----------------------------
-- Primary Key structure for table SA_LocationInfoWithTag
-- ----------------------------
ALTER TABLE "public"."SA_LocationInfoWithTag" ADD CONSTRAINT "SA_LocationInfoRelatTag_pkey" PRIMARY KEY ("SAid", "Clid");

-- ----------------------------
-- Primary Key structure for table SA_MonitorForApp
-- ----------------------------
ALTER TABLE "public"."SA_MonitorForApp" ADD CONSTRAINT "SA_MonitorForApp_pkey" PRIMARY KEY ("MoDate", "MoTypeID");

-- ----------------------------
-- Primary Key structure for table SA_Reasons
-- ----------------------------
ALTER TABLE "public"."SA_Reasons" ADD CONSTRAINT "SA_Reasons_pkey" PRIMARY KEY ("RId");

-- ----------------------------
-- Primary Key structure for table SA_SMS
-- ----------------------------
ALTER TABLE "public"."SA_SMS" ADD CONSTRAINT "SA_SMS_pkey" PRIMARY KEY ("Phone");

-- ----------------------------
-- Primary Key structure for table SA_ScenicArea
-- ----------------------------
ALTER TABLE "public"."SA_ScenicArea" ADD CONSTRAINT "SA_ScenicArea_pkey" PRIMARY KEY ("SAid");

-- ----------------------------
-- Primary Key structure for table SA_ScenicAreaWithFeatures
-- ----------------------------
ALTER TABLE "public"."SA_ScenicAreaWithFeatures" ADD CONSTRAINT "SA_ScenicAreaWithFeatures_pkey" PRIMARY KEY ("SARFid", "SAid");

-- ----------------------------
-- Primary Key structure for table SA_ScenicAreaWithSignal
-- ----------------------------
ALTER TABLE "public"."SA_ScenicAreaWithSignal" ADD CONSTRAINT "SA_ScenicAreaWithSignal_pkey" PRIMARY KEY ("SAid", "Lng", "Lat");

-- ----------------------------
-- Primary Key structure for table SA_ShareImageForUsers
-- ----------------------------
ALTER TABLE "public"."SA_ShareImageForUsers" ADD CONSTRAINT "SA_ShareImageForUsers_pkey" PRIMARY KEY ("TAIid");

-- ----------------------------
-- Primary Key structure for table SA_Task
-- ----------------------------
ALTER TABLE "public"."SA_Task" ADD CONSTRAINT "SA_TaskWithExploration_pkey" PRIMARY KEY ("Tid");

-- ----------------------------
-- Primary Key structure for table SA_TaskEx
-- ----------------------------
ALTER TABLE "public"."SA_TaskEx" ADD CONSTRAINT "SA_TaskEx_pkey" PRIMARY KEY ("Tid");

-- ----------------------------
-- Primary Key structure for table SA_TaskForAppointEx
-- ----------------------------
ALTER TABLE "public"."SA_TaskForAppointEx" ADD CONSTRAINT "SA_TaskForAppointEx_pkey" PRIMARY KEY ("Tid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_TaskForUsers
-- ----------------------------
ALTER TABLE "public"."SA_TaskForUsers" ADD CONSTRAINT "SA_TaskWithExplorationForUsers_pkey" PRIMARY KEY ("Tid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_TestBank
-- ----------------------------
ALTER TABLE "public"."SA_TestBank" ADD CONSTRAINT "SA_TestBank_pkey" PRIMARY KEY ("TBid");

-- ----------------------------
-- Primary Key structure for table SA_TestBankAnswer
-- ----------------------------
ALTER TABLE "public"."SA_TestBankAnswer" ADD CONSTRAINT "SA_TestBankAnswer_pkey" PRIMARY KEY ("TBAid");

-- ----------------------------
-- Primary Key structure for table SA_TestBankAnswerForUsers
-- ----------------------------
ALTER TABLE "public"."SA_TestBankAnswerForUsers" ADD CONSTRAINT "SA_TestBankAnswerForUsers_pkey" PRIMARY KEY ("TBid", "SAid", "Tid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_Tips
-- ----------------------------
ALTER TABLE "public"."SA_Tips" ADD CONSTRAINT "SA_Tips_pkey" PRIMARY KEY ("Tipid");

-- ----------------------------
-- Primary Key structure for table SA_TipsForTrack
-- ----------------------------
ALTER TABLE "public"."SA_TipsForTrack" ADD CONSTRAINT "SA_TipsForTrack_pkey" PRIMARY KEY ("TTid");

-- ----------------------------
-- Primary Key structure for table SA_TipsReadingForUsers
-- ----------------------------
ALTER TABLE "public"."SA_TipsReadingForUsers" ADD CONSTRAINT "SA_TipsReadingForUsers_pkey" PRIMARY KEY ("Tipid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_TokenClient
-- ----------------------------
ALTER TABLE "public"."SA_TokenClient" ADD CONSTRAINT "SA_TokenClient_pkey" PRIMARY KEY ("ClientId");

-- ----------------------------
-- Primary Key structure for table SA_TouristArea
-- ----------------------------
ALTER TABLE "public"."SA_TouristArea" ADD CONSTRAINT "SA_TouristArea_pkey" PRIMARY KEY ("TAid");

-- ----------------------------
-- Primary Key structure for table SA_UsersEx
-- ----------------------------
ALTER TABLE "public"."SA_UsersEx" ADD CONSTRAINT "SA_UsersEx_pkey" PRIMARY KEY ("Uid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithAttention
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithAttention" ADD CONSTRAINT "SA_UsersExWithAttention_pkey" PRIMARY KEY ("Uid", "AtUid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithCollect
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithCollect" ADD CONSTRAINT "SA_UsersExWithCollect_pkey" PRIMARY KEY ("Dataid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithComment
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithComment" ADD CONSTRAINT "SA_UsersExWithComment_pkey" PRIMARY KEY ("Comid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithCommodity
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithCommodity" ADD CONSTRAINT "SA_UsersExWithCommodity_pkey" PRIMARY KEY ("UCDid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithFootPrint
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithFootPrint" ADD CONSTRAINT "SA_UsersExWithFootPrint_pkey" PRIMARY KEY ("FPid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithFootPrintForCheckPoint
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithFootPrintForCheckPoint" ADD CONSTRAINT "SA_UsersExWithFootPrintForCheckPoint_pkey" PRIMARY KEY ("FPid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithIntegral
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithIntegral" ADD CONSTRAINT "SA_UsersExWithIntegral_pkey" PRIMARY KEY ("INTid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithLiker
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithLiker" ADD CONSTRAINT "SA_UsersExWithPraise_pkey" PRIMARY KEY ("Dataid", "Uid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithPhoto
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithPhoto" ADD CONSTRAINT "SA_UsersExWithPhoto_pkey" PRIMARY KEY ("UFPid");

-- ----------------------------
-- Primary Key structure for table SA_UsersExWithScenicArea
-- ----------------------------
ALTER TABLE "public"."SA_UsersExWithScenicArea" ADD CONSTRAINT "SA_UsersExWithScenicArea_pkey" PRIMARY KEY ("Uid", "SAid");
