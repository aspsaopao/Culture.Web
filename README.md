## 开发规范

### 数据设计命名规范

  * 表
    * 表名和字段全部采用<font color=red>**大驼峰**</font>规范定义,<font color=red>**前缀全大写**</font>:[Fat_Classification]
    * 外键字段名必须和该字段对应表的主键字段同名,如果有多个外键字段都来自同一个表请使用With关联分词(<font color=red>**重要**</font>)
    * 表的字段注释必须清楚表达用意，表注释一样
  * 视图
    * 视图名全部采用<font color=red>**大驼峰**</font>规范定义,<font color=red>**视图前缀SV_全大写**</font>:[SV_Fat_Classification]
    * 视图名要<font color=red>**明确主表**</font>,一般情况视图名定义应该与主表名一样只是带了SV_前缀(可以允许特殊情况),例如:[表Fat_Classification,视图:SV_Fat_Classification]
    * 字段重命名,除了明确的主表不需要重写字段,其他关联表全要重写,其他关联表必须重定义表名,下面例子中DV_DiagnosticTasks为主表,DV_Assets为其他表,将DV_Assets重命名为ASET,该表的字段被重命名为:ASET[字段名]

##### 例如:
```
SELECT
	`DV_DiagnosticTasks`.`DTid` AS `DTid`,
	`DV_DiagnosticTasks`.`Name` AS `Name`,
	`DV_DiagnosticTasks`.`Description` AS `Description`,
	`DV_DiagnosticTasks`.`OperatingMode` AS `OperatingMode`,
	`DV_DiagnosticTasks`.`Period` AS `Period`,
	`DV_DiagnosticTasks`.`PeriodTime` AS `PeriodTime`,
	`DV_DiagnosticTasks`.`ContinuousPeriod` AS `ContinuousPeriod`,
	`DV_DiagnosticTasks`.`PeriodBeginTime` AS `PeriodBeginTime`,
	`DV_DiagnosticTasks`.`DiagnosticBeginTime` AS `DiagnosticBeginTime`,
	`DV_DiagnosticTasks`.`DiagnosticEndTime` AS `DiagnosticEndTime`,
	`DV_DiagnosticTasks`.`DiagnosticClassType` AS `DiagnosticClassType`,
	`DV_DiagnosticTasks`.`DGid` AS `DGid`,
	`DV_DiagnosticTasks`.`Status` AS `Status`,
	`DV_DiagnosticTasks`.`Recycle` AS `Recycle`,
	`DV_DiagnosticTasks`.`Updated` AS `Updated`,
	`DV_DiagnosticTasks`.`CreateDate` AS `CreateDate`,
	`DV_DiagnosticTasks`.`CreateIP` AS `CreateIP`,
	`DV_DiagnosticTasks`.`CreateUid` AS `CreateUid`,
	`ASET`.`Asid` AS `ASETAsid`,
	`ASET`.`Name` AS `ASETName`,
	`ASET`.`Brand` AS `ASETBrand`,
	`ASET`.`Clid` AS `ASETClid`,
	`ASET`.`MainCompanyDepID` AS `ASETMainCompanyDepid`,
	`ASET`.`Clid_AreaName` AS `ASETClid_AreaName`,
	`ASET`.`DepID` AS `ASETDepID`,
	`ASET`.`Longitude` AS `ASETLongitude`,
	`ASET`.`Latitude` AS `ASETLatitude`,
	`ASET`.`Supplier` AS `ASETSupplier`,
	`ASET`.`PurchaseDate` AS `ASETPurchaseDate`,
	`ASET`.`ContactInformation` AS `ASETContactInformation`,
	`ASET`.`Status` AS `ASETStatus`,
	`ASET`.`AssetStatus` AS `ASETAssetStatus`,
	`ASET`.`StatusDescription` AS `ASETStatusDescription`,
	`ASET`.`Recycle` AS `ASETRecycle`,
	`ASET`.`CreateDate` AS `ASETCreateDate`,
	`ASET`.`CreateIP` AS `ASETCreateIP`,
	`ASET`.`CreateUid` AS `ASETCreateUid` 
FROM
	((
			`DV_Assets` `ASET`
			JOIN `DV_DiagnosticTasksRelatDep` `DTWC` ON ((
					`DTWC`.`DepID` = `ASET`.`DepID` 
				)))
		JOIN `DV_DiagnosticTasks` ON ((
			`DTWC`.`DTid` = `DV_DiagnosticTasks`.`DTid` 
	)))
```

### 服务器全局编写

  * 采用首字母<font color=red>**大小**</font>写混合方式编写
  * 类采用<font color=red>**大**</font>驼峰方式(首字母<font color=red>**大**</font>写,分词首字母<font color=red>**大**</font>写):<font color=red>T</font>est<font color=red>C</font>lass
  * 类成员<font color=red>**大**</font>驼峰方式(首字母<font color=red>**大**</font>写,分词首字母<font color=red>**大**</font>写):<font color=red>T</font>o<font color=red>S</font>tring()
  * 接口采用<font color=red>**大**</font>驼峰方式(首字母为<font color=red>**I**</font>后面第一个字母<font color=red>**大**</font>写,分词首字母<font color=red>**大**</font>写):<font color=red>IT</font>est<font color=red>C</font>lass
  * 任何形参，实参必须换行，参数尾部为逗号

```
public List<Fat_AppFileInfo> GetListPageWithController_Module(
    PageInfo page, 
    StringEntity Controller,
    StringEntity Module);

GetListPageWithController_Module(
    参数0,
    参数1,
    参数2);
```

### 服务器数据层成员函数命名规则(BusyData层)
  * 表类
    * 利用好函数重载特性(函数同名,参数数目不同或类型不同)，同一个目的且条件不一样的函数
    * 插入数据函数Insert开头使用With关联分词:[<font color=red>**InsertWith**</font>Test]
    * 更新数据函数Update开头使用With关联分词:[<font color=red>**UpdateWith**</font>Test]
    * 删除数据函数Delete开头使用With关联分词:[<font color=red>**DeleteWith**</font>Test]
    * 统计数据函数使用GetCount,getSum等开头使用With关联分词:[<font color=red>**GetCountWith**</font>Test,<font color=red>**GetSumWith**</font>Test]
    * 查询列表(不带分页)GetList开头使用With关联分词:[<font color=red>**GetListWith**</font>Test]
    * 查询列表(带分页,其中<font color=red>PageInfo类型参数必须放第一个</font>)getList开头使用With关联分词:[<font color=red>**GetListPageWith**</font>Test(PageInfo page,*****)]
  * 视图类
    * 规范和写表类一样,只是需要在get后面插入View单词,例如:[<font color=red>**GetViewInfoWith**</font>Test,<font color=red>**GetViewListWith**</font>Test,<font color=red>**GetViewListPageWith**</font>Test,<font color=red>**GetViewCountWith**</font>Test]

### 服务器逻辑层函数命名规则(****.Command.Components层)
  * 从BusyData引入的函数请直接赋值名称，参数和注释，并形成静态函数(static)
  * 如果遇到查询条件是数据库id的请选择对应的Context类型作为参数,或重载两个static函数

##### 例如:
##### 数据层函数:
```
/// <summary>
/// 根据分页参数获取数据列表
/// </summary>
/// <param name="page">分页信息</param>
/// <param name="CreateUid">创建用户id</param>
/// <returns></returns>
public List<Fat_Classification> GetListPageWithCreateUid(PageInfo page, GuidEntity CreateUid)
{
}
```
##### 逻辑层函数(引出BusyData查询列表函数):
```
/// <summary>
/// 根据分页参数获取数据列表
/// </summary>
/// <param name="page">分页信息</param>
/// <param name="CreateUid">创建用户id</param>
/// <param name="serviceProvider">依赖注入接口</param>
/// <returns></returns>
public static List<ClassificationContext> GetListPageWithCreateUid(
    IServiceProvider serviceProvider,
    PageInfo page,
    GuidEntity CreateUid)
{
    Classification db = new Classification(serviceProvider);
    return TransList(
        db.GetListPageWithCreateUid(page, CreateUid),
        t => { return new ClassificationContext(serviceProvider, t, db); });
}

/// <summary>
/// 根据分页参数获取数据列表
/// </summary>
/// <param name="page">分页信息</param>
/// <param name="CreateUid">创建用户id</param>
/// <param name="serviceProvider">依赖注入接口</param>
/// <returns></returns>
public static List<ClassificationContext> GetListPageWithCreateUid(
    IServiceProvider serviceProvider,
    PageInfo page,
    UsersContext CreateUid)
{
    CreateUid.ver();
return getListPageWithCreateUid(
    serviceProvider,
    page,
    CreateUid.getKey());
}
```

  * 逻辑获取外键对应的Context对象的<font color=red>成员函数</font>:[<font color=red>***Get[表名,视图名]Context**</font>]
  * 这类函数不允许返回null
  * 如果需要进行额外命名请使用With关联分词:[<font color=red>***Get[表名]ContextWith**</font>Test]

##### 例如:
```
/// <summary>
/// 获取用户信息
/// </summary>
/// <returns></returns>
public UsersContext GetUsersContext()
{
    if (isEmpty())
        return UsersContext.EmptyContext(serviceProvider);
    return UsersContext.GetInfo(serviceProvider, entity.Uid);
}

/// <summary>
/// 获取用户信息,EUid字段也要获取UsersContext
/// </summary>
/// <returns></returns>
public UsersContext GetUsersContextWithEUid()
{
    if (isEmpty())
        return UsersContext.EmptyContext(serviceProvider);
    return UsersContext.GetInfo(serviceProvider, entity.EUid);
}

/// <summary>
/// 列表
/// </summary>
/// <returns></returns>
public List<UsersContext> GetListWithUsersContext();

/// <summary>
/// 列表
/// </summary>
/// <returns></returns>
public List<UsersContext> GetListWithUsersContextWithEUid();

/// <summary>
/// 其他例子
/// </summary>
/// <returns></returns>
public View_UsersContext GetView_UsersContextWithEUid();

/// <summary>
/// 其他例子
/// </summary>
/// <returns></returns>
public View_UsersContext GetView_UsersContext();
```

### 后端开发注释事项
  * 前后端分离程序(webapi)，务必尽量一个界面一个api接口,偶尔有两个接口(<font color=red>**重要**</font>)
  * 接口参数必须标记属性,数量超过两个(含)一律使用[FromBody]属性，否则使用[FromForm]属性
  * 所有接口必须标记[HttpGet]<font color=red>**以外**</font>的其他属性,[HttpGet]不能标记除非有特殊需要(比如下载)

### 框架逻辑层使用方法
  * 提交数据(增，改):请调用Context內的Sub开头的函数,例如:
```
UsersContext.Sub(....);
```
  * 获取单项数据
```
UsersContext.GetInfo(....);
```
  * 获取列表数据
```
UsersContext.GetList(.....);
```
  * 获取并分页的数据
```
UsersContext.GetListPage(.....);
```
  * 删除某条数据,请使用Sub,GetInfo,GetList或GetListPage返回的实例注意调用Delete方法即可，返回的实例可能是Context实例也可能是Context集合
  * Context的实例全部由该Context类下的静态函数获取到

### 前端ts全局写法

  * 采用首字母<font color=red>**大小**</font>写混合方式编写
  * 类采用<font color=red>**大**</font>驼峰方式(首字母<font color=red>**大**</font>写,分词首字母<font color=red>**大**</font>写):<font color=red>T</font>est<font color=red>C</font>lass
  * 类成员<font color=red>**小**</font>驼峰方式(首字母<font color=red>**小**</font>写,分词首字母<font color=red>**大**</font>写):<font color=red>t</font>o<font color=red>S</font>tring()
  * 接口采用<font color=red>**大**</font>驼峰方式(首字母为<font color=red>**I**</font>后面第一个字母<font color=red>**大**</font>写,分词首字母<font color=red>**大**</font>写):<font color=red>IT</font>est<font color=red>C</font>lass
  * 全程使用api

## 后端开发说明

#### 介绍
1. 本框架宗旨在于规范设计，将不同设计领域的技术按相应的层次接入开发
2. 集成核心组件，让技术更专注于业务，避免过设计
3. 便于快速集成
#### 重点规范

  * 目录和文件名连接必须是目录变量结尾带上/符号:

```
string myDir= "我的目录/";
string myFile= $"{myDir}文件名.jpg";
```

  * 目录或文件路径必须实现接口:IDir或IFilePath，或者都实现

#### 常用函数或类
  * 字符串转换其他类型请使用to开头的函数(这些为高性能函数):[<font color=red>**ToStringEx(),ToInt32(),....**</font>]

```
string test="";
int v=test.toInt32();
```

  * IFormFile接口派生类请使用moveFile扩展函数进行文件转移
  * 实现IDir接口后,getUpFileDirWithSystem函数内可以使用FileOper.getUpFileDirWithSystem_Static获取目录配置,结尾必须跟/符号

```
/// <summary>
/// 文件上传目录
/// </summary>
/// <returns></returns>
public string getUpFileDirWithSystem()
{
    if (isEmpty())
        return "";
    string dir = FileOper.getUpFileDirWithSystem_Static(serviceProvider, Macro.DIR_ATTACHMENTDIR) + getKey() + "/";
    FileOper.createDir(dir);
    return dir;
}
```

  * UserTempDir:临时文件目录类，必须配置DIR_USERTEMP

```
{
    //用户临时上传目录键
    "DIR_USERTEMP": {
      "typeName": "NetCore.Entity.Config.RootPath",
      "downpath": "/UpFile/UserTmp/",
      "uppath": "{wwwroot}UpFile/UserTmp/"
    }
}
```

  * FileOper:文件相关操作
  * Encrypt:相关加密解密,目前只有md5
  * JsTree:树形结构类,重要集成ITree接口就可以使用

#### 软件架构
##### 框架分为一下主要空间

* NetCore:包含基础工具类以及认证常量等
    + RelatMemManager类:内存键关系核心管理
* NetCore.Authentication:认证
* NetCore.BusyData:数据层
* NetCore.Command:逻辑层
* NetCore.Command.Components:逻辑组件层,数据库逻辑层,其中包含xxxxxContext等类,这些类对应每个数据表
    + xxxxxContext:是数据层与实体的关联上下文,里面存储由NetCore.BusyData类和其接口读取的entity结构类
* NetCore.Config:配置,一些常规配置,项目中appsettings.json文件相关配置项,与NetCore.Entity.Config实体层中相关联
* NetCore.Data:数据内核层
* NetCore.Data.Mem:内存数据库内核层
* NetCore.DataTypeOper:常量集合管理,比如:1,男;2,女等
* NetCore.Entity:数据层实体
* NetCore.ExSystem:系统扩展接口层,主要衍生依赖注入相关接口以及本框架的依赖注入集成
* NetCore.Factory:工厂层,相关功能组装
* NetCore.Tool:工具层,包含库工具类,dynamic类型转换类
* NetCore.Ver:版本层,主要服务于前端版本
* Microsoft.Extensions.DependencyInjection:扩展服务

#### 安装教程

1. 建立.netcore mvc项目,.netcore 2.2框架
2. 在项目Startup类中写入配置，具体配置如下:
```
public class Startup
{
    public Startup(IConfiguration configuration, IHostingEnvironment env)
    {
        Configuration = configuration;
        HostingEnvironment = env;
    }

    public IConfiguration Configuration { get; }

    public IHostingEnvironment HostingEnvironment { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
        services.Configure<CookiePolicyOptions>(options =>
        {
            // This lambda determines whether user consent for non-essential cookies is needed for a given request.
            options.CheckConsentNeeded = context => true;
            options.MinimumSameSitePolicy = SameSiteMode.None;
        });
        string rediskey = "";
        //框架配置
        var config = services.AddNetCoreService(
                Configuration,
                HostingEnvironment,
                T =>
                {
                    rediskey = T.redisKey;
                    //引入库名称
                    T.libName = new[] { "Demo" };
                    //机器键,用于分布式session等
                    T.machineKey = "machineKey";
                    //错误跳转页
                    T.errorHandlingPath = "/Error/Index";
                    //角色授权扩展
                    T.roleAction = roleres =>
                    {
                        var filter = roleres as Microsoft.AspNetCore.Mvc.Filters.AuthorizationFilterContext;
                        return new NetCore.Authentication.MvcInfo
                        {
                            action = filter.RouteData.Values["action"].ToString(),
                            area = filter.RouteData.Values["area"].ToString(),
                            controller = filter.RouteData.Values["controller"].ToString()
                        };
                    };
                    //认证扩展
                    T.actionAuthenticationBuilder = auth =>
                    {
                        auth.AddCookie("netcore");
                        auth.AddIdentityServerAuthentication(options =>
                        {
                            options.ApiName = "videointerface";
                            options.ApiSecret = "videoapisecrets";
                            options.Authority = "http://localhost:5000";
                            options.RequireHttpsMetadata = false;
                        });
                    };
                });

        var rsa = IdentityServerBuilderExtensionsCrypto.CreateRsaSecurityKey();
        var bis = services.AddIdentityServer(T =>
            {
                T.Authentication.CookieAuthenticationScheme = "netcore";
            })
        .AddSigningCredential(rsa)
        .AddInMemoryApiResources(new List<ApiResource>() {
            new ApiResource("videointerface","Video Interface"){
                ApiSecrets={ new Secret("videoapisecrets".Sha256()) }
            }
        })
        .AddInMemoryClients(new List<Client>()
        {
            new Client{
                ClientId = "video",
                ClientSecrets = { new Secret("videosecrets".Sha256()) },
                AccessTokenType = AccessTokenType.Reference,
                AllowedGrantTypes = GrantTypes.ResourceOwnerPassword,
                AllowedScopes = { "videointerface" }
            }
        });
        var redisconfig = config.getConfig<RedisDB>(rediskey);
        if (redisconfig != null)
        {
            bis.AddOperationalStore(T =>
            {
                T.RedisConnectionString = redisconfig.ToString();
                T.KeyPrefix = "videoidentity";
            });
        }

        services.AddSession(options =>
        {
            options.IdleTimeout = TimeSpan.FromDays(100);
        });

        services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IHostingEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseExceptionHandler();
            //app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseExceptionHandler();
            app.UseHsts();
        }

        app.UseHttpsRedirection();
        app.UseStaticFiles(new StaticFileOptions
        {
            ServeUnknownFileTypes = true
        });
        app.UseIdentityServer();
        //使用内核框架
        app.UseNetCore();
        app.UseSession();
        app.UseMvcWithDefaultRoute();
        app.UseCookiePolicy();

        app.UseMvc(routes =>
        {
            routes.MapRoute("areaRoute", "{area:exists}/{controller=Index}/{action=Index}");
            routes.MapRoute("default", "{area=Login}/{controller=Index}/{action=Index}");
        });
    }
}
```
3. 项目appsettings.json配置:
```
{
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "System": "Information",
      "Microsoft": "Information"
    }
  },
  //框架内核配置
  "netconfig": {
    //redis内存数据库配置
    "redis": {
      "typeName": "NetCore.Entity.Config.RedisDB",
      "abortConnect": false,
      "serverList": [
        {
          "host": "192.168.48.129",
          "port": "6379"
        }
      ]
    },
    //机器键
    "machineKey": {
      "typeName": "NetCore.Entity.Config.MachineKey",
      "appName": "video",
      "keyDir": "{wwwroot}UpFile/machinekey"
    },
    //物理数据库配置(mysql等)
    "db": {
      "typeName": "NetCore.Entity.Config.DB",
      "host": "192.168.48.129",
      "port": "3306",
      "username": "root",
      "password": "123456",
      "basename": "db_fweb"
    },
    //DEMO项目前端版本
    "DEMO": {
      "typeName": "NetCore.Entity.Config.RootPath",
      "downpath": "/"
    },
    //内核库前端版本
    "NETCORE_LIB": {
      "typeName": "NetCore.Entity.Config.RootPath",
      "downpath": "http://localhost/webskin/"
    },
    //用户临时上传目录键
    "USERTEMPDIR_KEY": {
      "typeName": "NetCore.Entity.Config.RootPath",
      "downpath": "/UpFile/UserTmp/",
      "uppath": "{wwwroot}UpFile/UserTmp/"
    }
  }
}
```

#### 使用说明

* 在mvc项目中任意控制器使用相应代码:
```
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NetCore.Factory.Rule;
using NetCore.Factory;
using NetCore.DataTypeOper;
using NetCore;
using Demo.Areas.Mng.Models.Index;
using NetCore.Command.Components;
using Microsoft.AspNetCore.Authorization;

namespace Demo.Areas.Mng.Controllers
{
    /// <summary>
    /// 权限控制器
    /// </summary>
    [Area("Mng")]
    [RuleModule("Mng", typeof(RuleController))]
    //授权:
    //AuthenticationDefaults.policyRoleNameForEnterprise:企业信息授权策略
    [Authorize(Policy = AuthenticationDefaults.policyRoleNameForEnterprise)]
    public class IndexController : NetCoreViewLib.FilterController.RuleController
    {

        /// <summary>
        /// 管理首页
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            //框架使用
            //userinfo即是UsersContext实例,使用userinfo可以呼出entity
            var userinfo = NetCore.Command.Components.UsersContext.getInfo(
                HttpContext.RequestServices,
                1);
            ////呼出entity
            //var userinfo_entity = userinfo.getEntity();
            ////userinfo_entity.Phone;
            ////userinfo_entity.RealName;
            //转换数据,需要引入NetCore空间
            long test_v = "1".toInt64();
            //html编码
            string test_htmlstr = "<div>".htmlEncode();
            ViewData.Model = new Index();
            return View();
        }

        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        public IActionResult LoginOut()
        {
            Request.HttpContext.Session.loginOut();
            return RedirectToAction("Index", "Index", new { area = "Login" });
        }
    }
}
```
* 权限授权,在类名或方法名前面定义
```
//定义模块熟悉康,和域相关
[RuleModule("Mng", typeof(RuleController))]
//定义应用，与控制器相关
[RuleFeature("权限")]
//定义方法，与控制器方法相关
[RuleMethod("权限管理")]
```

## 前端开发说明
vscode安装以下插件:
  *  C#
  *  TypeScript Auto Compiler

使用步骤:
  * 打开前端项目目录:EMPlatform.Web
  * 在vscode控制台敲入命令:npm install
  * F5即可调试项目

[.netcore下载地址](https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-2.2.102-windows-x64-installer)