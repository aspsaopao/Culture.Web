using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using System.Threading.Tasks;
using IdentityServer4.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.WebEncoders;
using Microsoft.IdentityModel.Tokens;
using NetCore;
using NetCore.Config;
using NetCore.Entity.Config;
using StackExchange.Redis;
using Culture.STD;
using Culture.SystemEx;
using CultureRazor.Authentication;
using CultureRazor.IdentityServer;

namespace Culture.Web
{
    /// <summary>
    /// 
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="configuration"></param>
        /// <param name="webHostEnvironment"></param>
        public Startup(IConfiguration configuration, IWebHostEnvironment webHostEnvironment)
        {
            Configuration = configuration;
            HostingEnvironment = webHostEnvironment;

        }

        /// <summary>
        /// 
        /// </summary>
        public IConfiguration Configuration { get; }

        /// <summary>
        /// 
        /// </summary>
        public IWebHostEnvironment HostingEnvironment { get; }

        /// <summary>
        /// 挂在mfs
        /// </summary>
        private void MountMfs(IApplicationBuilder app)
        {
            using IServiceScope scope = app.ApplicationServices.CreateScope();
            var logger = scope.ServiceProvider.GetService<ILogger<Startup>>();
            var mfsMount = Configuration.GetValue<string>("mfsMount:script");
            var mfsMountDir = Configuration.GetValue<string>("mfsMount:dir");
            if (mfsMount.IsNullOrEmpty() || mfsMountDir.IsNullOrEmpty())
            {
                logger.LogWarning("未配置mfs挂载脚本,跳过!");
                return;
            }
            FileInfo fileInfo = new FileInfo(mfsMount);
            if (!fileInfo.Exists)
            {
                logger.LogWarning("找不到mfs挂载脚本,跳过!");
                return;
            }
            var psi = new ProcessStartInfo(fileInfo.FullName) { RedirectStandardOutput = true };
            using Process proc = Process.Start(psi);
            if (proc == null)
            {
                logger.LogWarning($"无法找到挂载脚本:{fileInfo.FullName}");
                return;
            }
            using (var sr = proc.StandardOutput)
            {
                while (!sr.EndOfStream)
                {
                    logger.LogInformation(sr.ReadLine());
                }
                if (!proc.HasExited)
                    proc.Kill();
            }
            app.UseStaticFilesGzip(new StaticFileOptions
            {
                ServeUnknownFileTypes = true,
                FileProvider = new PhysicalFileProvider(mfsMountDir),
                RequestPath = "/UpFile"
            });
            app.UseStaticFiles(new StaticFileOptions
            {
                ServeUnknownFileTypes = true,
                FileProvider = new PhysicalFileProvider(mfsMountDir),
                RequestPath = "/UpFile"
            });
            logger.LogInformation($"远程文件系统挂载完成:{fileInfo.FullName}");
        }

        private RSA CreateTokenServerRsa()
        {
            FileInfo rsaFilePath = new FileInfo(Path.Combine(HostingEnvironment.WebRootPath, "tokenserver-rsa.xml"));
            if (!rsaFilePath.Exists)
                throw new Exception("token服务器rsa证书找不到tokenserver-rsa.xml");
            using StreamReader fileStream = rsaFilePath.OpenText();
            string content = fileStream.ReadToEnd();
            RSA rsa = RSA.Create();
            rsa.FromXmlString(content);
            return rsa;
        }

        private void ConfigureForMachine(IServiceCollection services, IIdentityServerBuilder bis)
        {
            var machineAppName = Configuration.GetValue<string>("machineKey");
            if (machineAppName.IsNullOrEmpty())
                throw new Exception("machineKey必须配置");
            var redisConfig = Configuration.GetValue<string>("netconfig:redis:command");
#if !DEBUG
            //if (redisConfig.IsNullOrEmpty())
            //    throw new Exception("分布式系统redis必须配置");
            //bis.AddOperationalStore(T =>
            //{
            //    T.RedisConnectionString = redisConfig;
            //    T.KeyPrefix = Configuration.GetValue<string>("TokenServer:apiName");
            //});
            //services.AddStackExchangeRedisCache(opt =>
            //{
            //    opt.Configuration = redisConfig;
            //});

            //services.AddDataProtection()
            //    .SetApplicationName(machineAppName)
            //    .PersistKeysToStackExchangeRedis(ConnectionMultiplexer.Connect(redisConfig));
#else
            if (!redisConfig.IsNullOrEmpty())
            {
                bis.AddOperationalStore(T =>
                {
                    T.RedisConnectionString = redisConfig;
                    T.KeyPrefix = Configuration.GetValue<string>("TokenServer:apiName");
                });
                services.AddStackExchangeRedisCache(opt =>
                {
                    opt.Configuration = redisConfig;
                });

                services.AddDataProtection()
                    .SetApplicationName(machineAppName)
                    .PersistKeysToStackExchangeRedis(ConnectionMultiplexer.Connect(redisConfig));
            }
#endif
        }

        private int StartUpType
        {
            get
            {
                return Configuration["startuptype"].ToInt32();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //认证服务器构建
            //var bis = services.AddIdentityServer(T =>
            //{
            //    T.Authentication.CookieAuthenticationScheme = "Culture";
            //})
            //    .AddIdentityServerForTourism()
            //.AddSigningCredential(
            //    new SigningCredentials(
            //        new RsaSecurityKey(
            //            CreateTokenServerRsa()),
            //        "RS256"))
            //.AddIdentityServerForNetCore()
            //            .AddInMemoryApiResources(new List<ApiResource>() {
            //                new ApiResource(Configuration.GetValue<string>("TokenServer:apiRes"),"小程序api"){
            //                    ApiSecrets={ new IdentityServer4.Models.Secret(Configuration.GetValue<string>("TokenServer:apiSecret").Sha256()) },
            //                    Scopes=new []{ Configuration.GetValue<string>("TokenServer:apiRes") }
            //                }
            //})
            //.AddInMemoryApiScopes(new List<ApiScope>
            //{
            //    new ApiScope(Configuration.GetValue<string>("TokenServer:apiRes"),"小程序api"){
            //        UserClaims=new []{NetCore.Macro.COOKIESLOGIN_UID,"realname" }
            //    }
            //})
            //.AddInMemoryClients(new List<Client>()
            //{
            //                new Client{
            //                    ClientId = Configuration.GetValue<string>("TokenServer:clientId"),
            //                    ClientSecrets = { new IdentityServer4.Models.Secret(Configuration.GetValue<string>("TokenServer:apiSecret").Sha256()) },
            //                    AccessTokenType = AccessTokenType.Reference,
            //                    AllowedGrantTypes = GrantTypes.ResourceOwnerPassword,
            //                    AllowedScopes = {
            //                        Configuration.GetValue<string>("TokenServer:apiRes"),
            //                        IdentityModel.OidcConstants.StandardScopes.OfflineAccess
            //                    },
            //                    AllowOfflineAccess=true
            //                }
            //});
            //ConfigureForMachine(services, bis);
            services.AddNetCoreService(option =>
            {
                option.LibName = new[] { "Culture", "Culture.Web" };
                option.ErrorHandlingPath = "/Index/SystemError/Index";
                option.CookiesNamePrefix = $"Culture.Web{Configuration.GetValue<string>("ver")}";
            });

            services.AddService<IdentityServerRequirement>(Configuration);

            var auth = services.AddAuthentication();
            auth.AddCookie("Culture");
            //远程认证服务器配置
            auth.AddOAuth2Introspection(IdentityServerRequirement.AuthenticationScheme, options =>
             {
                 options.Authority = Configuration.GetValue<string>("TokenServer:authority");
                 options.ClientId = Configuration.GetValue<string>("TokenServer:clientId");
                 options.ClientSecret = Configuration.GetValue<string>("TokenServer:apiSecret");
             });
            auth.AddAuthenticationForNetCore(T => { });

            services.AddAuthorization(options =>
            {
                options.AddPolicyForNetCore(roleres =>
                {
                    roleres.AddRequirements(new IdentityServerRequirement());
                });
            });

            if (StartUpType == 1)
            {
                services.AddSpaStaticFiles(configuration =>
                {
                    configuration.RootPath = "ClientApp/dist";
                });
            }
            services.AddControllersWithViews(configmvc =>
            {
                configmvc.RespectBrowserAcceptHeader = true;
                configmvc.InputFormatters.Add(new XmlSerializerInputFormatter(configmvc));
                configmvc.OutputFormatters.Add(new XmlSerializerOutputFormatter());
            })
                .AddNewtonsoftJson(op =>
                {
                    op.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore;
                    op.SerializerSettings.DefaultValueHandling = Newtonsoft.Json.DefaultValueHandling.Include;
                    op.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
                    op.SerializerSettings.FloatFormatHandling = Newtonsoft.Json.FloatFormatHandling.DefaultValue;
                    op.SerializerSettings.MetadataPropertyHandling = Newtonsoft.Json.MetadataPropertyHandling.Default;
                    op.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
                })
                .SetCompatibilityVersion(CompatibilityVersion.Latest);

            services.AddCors(T =>
            {
#if DEBUG
                T.AddPolicy("dev", o =>
                {
                    o.WithOrigins("http://localhost:4311")
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials();
                });
#endif
                T.AddPolicy("datav", o =>
                 {
                     o.WithOrigins("https://datav.aliyun.com", "https://datav.aliyuncs.com")
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials();
                 });
            });
#if DEBUG
            services.AddSwaggerGen(c =>
            {
                // 添加文档信息
                c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo()
                {
                    Title = "旅游api",
                    Version = "v1"
                });
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, "Culture.Web.xml"), true);
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, "Culture.xml"));
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, "Culture.STD.xml"));
                c.BindConfigForSwashbuckle();
            });
            services.AddSwaggerGenNewtonsoftSupport();
#endif
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseNetCore();
            app.UseExceptionHandler();
            app.UseStaticFilesGzip(new StaticFileOptions
            {
                ServeUnknownFileTypes = true
            });
            app.UseStaticFiles(new StaticFileOptions
            {
                ServeUnknownFileTypes = true
            });
            MountMfs(app);
            if (StartUpType == 1)
            {
                app.UseSpaStaticFilesGzip();
                app.UseSpaStaticFiles(new StaticFileOptions
                {
                    ServeUnknownFileTypes = true
                });
            }
            //app.UseIdentityServer();
#if DEBUG
            app.UseSwagger(T =>
            {
                T.SerializeAsV2 = true;
            });
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint($"/swagger/v1/swagger.json", $"华屹数旅");
            });
#endif
            app.UseRouting();
#if DEBUG
            app.UseCors("dev");
#endif
            app.UseCors("datav");
            app.UseAuthorization();
            app.UseEndpoints(routes =>
            {
                routes.MapControllerRoute("areaRoute", "{area:exists}/{controller=Index}/{action=Index}");
            });
            if (StartUpType == 1)
            {
                app.UseSpa(spa =>
                {
                    spa.Options.SourcePath = "ClientApp";
                });
            }
        }
    }
}
