using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using StackExchange.Redis;
using Tourism.SystemEx;
using TourismRazor.Authentication;

namespace TourismTool.Web
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

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureServices(IServiceCollection services)
        {
            ConfigureForMachine(services);
            services.AddNetCoreService(option =>
            {
                option.LibName = new[] { "Tourism", "Tourism.Web" };
                option.ErrorHandlingPath = "/Index/SystemError/Index";
                option.CookiesNamePrefix = $"Tourism.Web{Configuration.GetValue<string>("ver")}";
            });

            services.AddService<IdentityServerRequirement, RouteEndpoint>(Configuration);

            var auth = services.AddAuthentication();
            auth.AddCookie("tourism_tool");
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

#if DEBUG
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "旅游tool-api", Version = "v1" });
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, "TourismTool.Web.xml"), true);
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, "Tourism.xml"));
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, "Tourism.STD.xml"));
                c.BindConfigForSwashbuckle();
            });
            services.AddSwaggerGenNewtonsoftSupport();
#endif
        }

        /// <summary>
        /// 
        /// </summary>
        public IConfiguration Configuration { get; }

        /// <summary>
        /// 
        /// </summary>
        public IWebHostEnvironment HostingEnvironment { get; }

        private void ConfigureForMachine(IServiceCollection services)
        {
            var machineAppName = Configuration.GetValue<string>("machineKey");
            if (machineAppName.IsNullOrEmpty())
                throw new Exception("machineKey必须配置");
            var redisConfig = Configuration.GetValue<string>("netconfig:redis:command");
#if !DEBUG
            if (redisConfig.IsNullOrEmpty())
                throw new Exception("分布式系统redis必须配置");
            services.AddStackExchangeRedisCache(opt =>
            {
                opt.Configuration = redisConfig;
            });

            services.AddDataProtection()
                .SetApplicationName(machineAppName)
                .PersistKeysToStackExchangeRedis(ConnectionMultiplexer.Connect(redisConfig));
#else
            if (!redisConfig.IsNullOrEmpty())
            {
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

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseNetCore();
            app.UseExceptionHandler();
#if DEBUG
            app.UseSwagger(T =>
            {
                T.SerializeAsV2 = true;
            });
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "旅游");
            });
#endif

            app.UseRouting();

            app.UseAuthorization();
            app.UseEndpoints(routes =>
            {
                routes.MapControllerRoute("areaRoute", "{area:exists}/{controller=Index}/{action=Index}");
            });
        }
    }
}
