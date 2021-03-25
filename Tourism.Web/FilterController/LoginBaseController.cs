using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using IdentityModel.Client;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Primitives;
using NetCore;
using NetCore.Command.Components;
using Culture.ExceptionEx;
using Culture.Factory;
using Culture.STD.Models;

namespace Culture.Web.FilterController
{

    /// <summary>
    /// 登录基础控制器
    /// </summary>
    [ApiController]
    public abstract class LoginBaseController<T> : Controller
    {
        /// <summary>
        /// 配置
        /// </summary>
        protected IConfiguration Configuration { get; }

        /// <summary>
        /// 日志
        /// </summary>
        protected ILogger<T> Logger { get; }

        private IDataProtector DataProtector { get; }

        /// <summary>
        /// 公共组件
        /// </summary>
        /// <param name="configuration"></param>
        /// <param name="logger">日志</param>
        /// <param name="provider">rsa</param>
        public LoginBaseController(
            IDataProtectionProvider provider,
            IConfiguration configuration,
            ILogger<T> logger)
        {
            DataProtector = provider.CreateProtector("tokenkey");
            this.Configuration = configuration;
            this.Logger = logger;
        }

        //        /// <summary>
        //        /// 拉取token
        //        /// </summary>
        //        /// <param name="passId"></param>
        //        /// <param name="passWord"></param>
        //        /// <returns></returns>
        //        protected async Task<TokenResponse> PullToken(
        //            string passId,
        //            string passWord = Macro.INITPASSWORD)
        //        {
        //            if (passId.IsNullOrEmpty())
        //                throw new Exception("用户名必须填写");
        //            if (passWord.IsNullOrEmpty())
        //                throw new Exception("密码必须填写!");
        //            var httpclient = HttpContext.RequestServices.GetService<IHttpClientFactory>().CreateClient(Macro.HTTPCLIENT);
        //            var resultdic = await httpclient.GetDiscoveryDocumentAsync(Configuration.GetValue<string>("TokenServer:authority"));
        //            var result = await httpclient.RequestPasswordTokenAsync(new PasswordTokenRequest
        //            {
        //                Address = resultdic.TokenEndpoint,
        //                ClientSecret = Configuration.GetValue<string>("TokenServer:apiSecret"),
        //                ClientId = Configuration.GetValue<string>("TokenServer:clientId"),
        //                Scope = $"{Configuration.GetValue<string>("TokenServer:apiRes")} {IdentityModel.OidcConstants.StandardScopes.OfflineAccess}",
        //                UserName = passId,
        //                Password = passWord
        //            });
        //            if (result.IsError)
        //            {
        //                Logger.LogError($"拉去token失败!,错误信息:{result.Raw}");
        //                throw new Exception("拉去token失败!");
        //            }
        //            Response.Headers[HeaderKey] = DataProtector.Protect(passId);
        //            return result;
        //        }

        //        /// <summary>
        //        /// 刷新token
        //        /// </summary>
        //        /// <param name="refreshToken">刷新token值</param>
        //        /// <returns></returns>
        //        [HttpPost]
        //        public async Task<InfoModel<TokenResponseInfo>> RefreshToken([FromForm] string refreshToken)
        //        {
        //            StringValues headerValue;
        //            if (!Request.Headers.TryGetValue(HeaderKey, out headerValue))
        //            {
        //                Logger.LogError($"请求头:{HeaderKey}未找到");
        //                throw new Exception("非法请求");
        //            }
        //            if (headerValue.ToStringEx().IsNullOrEmpty())
        //            {
        //                Logger.LogError($"请求头{HeaderKey}为null");
        //                throw new Exception("非法请求");
        //            }
        //            if (refreshToken.IsNullOrEmpty())
        //                throw new Exception("token值异常");
        //            HttpClient httpclient = HttpContext.RequestServices.GetService<IHttpClientFactory>().CreateClient(Macro.HTTPCLIENT);
        //            DiscoveryDocumentResponse resultdic = await httpclient.GetDiscoveryDocumentAsync(Configuration.GetValue<string>("TokenServer:authority"));
        //            TokenResponse result = await httpclient.RequestRefreshTokenAsync(new RefreshTokenRequest
        //            {
        //                Address = resultdic.TokenEndpoint,
        //                ClientSecret = Configuration.GetValue<string>("TokenServer:apiSecret"),
        //                ClientId = Configuration.GetValue<string>("TokenServer:clientId"),
        //                Scope = $"{Configuration.GetValue<string>("TokenServer:apiRes")} {IdentityModel.OidcConstants.StandardScopes.OfflineAccess}",
        //                RefreshToken = refreshToken
        //            });
        //            if (result.IsError)
        //            {
        //                Logger.LogError(result.Exception, $"token刷新异常:{result.Error}");
        //                string passId = DataProtector.Unprotect(headerValue);
        //                result = await PullToken(passId);
        //            }
        //            return new InfoModel<TokenResponseInfo>
        //            {
        //                Data = new TokenResponseInfo
        //                {
        //                    ErrorDescription = result.ErrorDescription,
        //                    ExpiresIn = result.ExpiresIn,
        //                    IdentityToken = result.IdentityToken,
        //                    RefreshToken = result.RefreshToken,
        //                    AccessToken = result.AccessToken,
        //                    TokenType = result.TokenType
        //                }
        //            };
        //        }

        //        /// <summary>
        //        /// 头键
        //        /// </summary>
        //        protected abstract string HeaderKey { get; }

        //        /// <summary>
        //        /// 应用id键
        //        /// </summary>
        //        protected abstract string AppIdKey { get; }

        //        /// <summary>
        //        /// 创建认证信息
        //        /// </summary>
        //        /// <param name="userInfo">用户信息</param>
        //        /// <param name="passId">id</param>
        //        /// <param name="iType">认证类型</param>
        //        /// <returns></returns>
        //        private async Task<UserAuthsContext> CreateAuthInfo(UsersContext userInfo, string passId, int iType)
        //        {
        //            UserAuthsContext authInfo = UserAuthsContext.EmptyContext(HttpContext.RequestServices);
        //            if (!passId.IsNullOrEmpty() && !userInfo.IsEmpty())
        //            {
        //                authInfo = await UserAuthsContext.GetInfo(
        //                    HttpContext.RequestServices,
        //                    passId);
        //                if (authInfo.IsEmpty())
        //                    authInfo = await UserAuthsContext.SubWithBase(
        //                        HttpContext.RequestServices,
        //                        passId,
        //                        userInfo.GetKey(),
        //                        iType,
        //                        Macro.INITPASSWORD,
        //                        DateTime.Now,
        //                        "",
        //                        DateTime.Now,
        //                        HttpContext.Connection.RemoteIpAddress.ToString());
        //                else if (authInfo.GetEntity().Uid != userInfo.GetKey())
        //                {
        //                    await authInfo.UpdateWithUid(userInfo.GetKey());
        //                    await authInfo.UpdateWithUpdated(DateTime.Now);
        //                }
        //            }
        //            return authInfo;
        //        }

        //        /// <summary>
        //        /// 微信登录
        //        /// </summary>
        //        /// <param name="codeId">登录码</param>
        //        /// <param name="action">回调</param>
        //        /// <returns></returns>
        //        protected async Task<InfoModel<UserInfoForWX>> WxLogin(
        //            string codeId,
        //            Func<WeiXinConfigContext, string, Task<LoginInfo>> action)
        //        {
        //#if DEBUG
        //            if (codeId == "admin")
        //            {
        //                var tokenInfo = await PullToken(codeId, "admin");
        //                return new InfoModel<UserInfoForWX>
        //                {
        //                    Data = new UserInfoForWX
        //                    {
        //                        CodeId = codeId,
        //                        OpenId = codeId,
        //                        QrCode = new TempFileInfo
        //                        {
        //                            ServerDirPath = "/qrcode/",
        //                            ServerFileName = "gh_7d03de5db99f_430.jpg",
        //                            LocalFileName = "gh_7d03de5db99f_430.jpg"
        //                        },
        //                        TokenInfo = new TokenResponseInfo
        //                        {
        //                            AccessToken = tokenInfo.AccessToken,
        //                            ErrorDescription = tokenInfo.ErrorDescription,
        //                            ExpiresIn = tokenInfo.ExpiresIn,
        //                            IdentityToken = tokenInfo.IdentityToken,
        //                            RefreshToken = tokenInfo.RefreshToken,
        //                            TokenType = tokenInfo.TokenType
        //                        },
        //                        UnionId = codeId
        //                    }
        //                };
        //            }
        //#endif
        //            var info = await WeiXinConfigContext.GetInfo(
        //                HttpContext.RequestServices,
        //                Configuration.GetValue<string>(AppIdKey));
        //            if (info.IsEmpty())
        //                throw new Exception("系统并未记录任何微信信息");
        //            //拉取openid
        //            var model = await action(info, codeId);
        //            if (model.IsNull())
        //                throw new Exception("登录模型异常");
        //            if (model.UserInfoForWX.IsNull())
        //                throw new Exception("登录模型异常");
        //            (UserAuthsContext, UsersContext, UsersExContext) userInfoTulp = (null, null, null);
        //            if (model.VailUnionId)
        //                userInfoTulp = await GetUserInfo(model.UserInfoForWX);
        //            else
        //                userInfoTulp = await GetUserInfoNotUnionId(model.UserInfoForWX);
        //            await SaveImage(userInfoTulp.Item2, model.HeaderUrl, model.NickName);
        //            var token = await PullToken(userInfoTulp.Item1.GetEntity().PassID);
        //            model.UserInfoForWX.TokenInfo = new TokenResponseInfo
        //            {
        //                AccessToken = token.AccessToken,
        //                ErrorDescription = token.ErrorDescription,
        //                ExpiresIn = token.ExpiresIn,
        //                IdentityToken = token.IdentityToken,
        //                RefreshToken = token.RefreshToken,
        //                TokenType = token.TokenType
        //            };
        //            return new InfoModel<UserInfoForWX>
        //            {
        //                Data = model.UserInfoForWX
        //            };
        //        }

        //        async Task<UserAuthsContext> VailUserInfo(UserInfoForWX model)
        //        {
        //            if (model.UnionId.IsNullOrEmpty())
        //            {
        //                if (model.OpenId.IsNullOrEmpty())
        //                    throw new Exception("微信平台用户认证出错");
        //                var openInfo = await UserAuthsContext.GetInfo(
        //                    HttpContext.RequestServices,
        //                    model.OpenId);
        //                if (!openInfo.IsEmpty())
        //                {
        //                    var userInfo = await openInfo.GetUsersContext();
        //                    var authList = await userInfo.GetListWithUserAuthsContext();
        //                    foreach (var auth in authList)
        //                    {
        //                        if (auth.GetEntity().IdentityType == Macro.PASSIDTYPE_WX_UnionId)
        //                            return auth;
        //                    }
        //                }
        //                throw new WxException("unionid未找到!请切换登录方式!")
        //                {
        //                    Header = new Dictionary<string, string>
        //                    {
        //                        {
        //                            "session_key",model.SessionKey
        //                        }
        //                    }
        //                };
        //            }
        //            else
        //                return await UserAuthsContext.GetInfo(
        //                    HttpContext.RequestServices,
        //                    model.UnionId);
        //        }

        ///// <summary>
        ///// 保存图片
        ///// </summary>
        ///// <param name="userInfo"></param>
        ///// <param name="headerImgUrl"></param>
        ///// <param name="nickName"></param>
        ///// <returns></returns>
        //protected async Task SaveImage(UsersContext userInfo, string headerImgUrl, string nickName)
        //{
        //    if (userInfo.IsEmpty())
        //        return;
        //    if (userInfo.GetEntity().RealName.IsNullOrEmpty() && !nickName.IsNullOrEmpty())
        //    {
        //        var userEx = await userInfo.GetUsersExContext();
        //        await userEx.UpdateWithNickName(nickName.Length<=8? nickName: nickName.Substring(0,8));
        //    }
        //    if (userInfo.GetEntity().ProfileFileName.IsNullOrEmpty() && !headerImgUrl.IsNullOrEmpty())
        //    {
        //        var headerUrls = new List<string> { headerImgUrl };
        //        await headerUrls.PullRemoteImage(
        //            HttpContext.RequestServices,
        //            async T =>
        //            {
        //                await userInfo.UpdateWithProfileFileName(T);
        //                return userInfo;
        //            });
        //    }
        //}
        ///// <summary>
        ///// 获取用户信息
        ///// </summary>
        ///// <param name="model"></param>
        ///// <returns></returns>
        //protected async Task<(UserAuthsContext, UsersContext, UsersExContext)> GetUserInfoNotUnionId(
        //    UserInfoForWX model)
        //{
        //    (UserAuthsContext, UsersContext, UsersExContext) returnInfo = (null, null, null);
        //    //必须保证unionid存在
        //    returnInfo.Item1 = await UserAuthsContext.GetInfo(
        //        HttpContext.RequestServices,
        //        model.OpenId);
        //    if (returnInfo.Item1.IsEmpty())
        //    {
        //        returnInfo.Item2 = await UsersContext.SubWithBase(
        //            HttpContext.RequestServices,
        //            null,
        //            "",
        //            0,
        //            "",
        //            DateTime.MinValue,
        //            1,
        //            0,
        //            0,
        //            "",
        //            "",
        //            "",
        //            0,
        //            DateTime.Now,
        //            DateTime.Now,
        //            HttpContext.Connection.RemoteIpAddress.ToString(),
        //            "");
        //        returnInfo.Item1 = await CreateAuthInfo(returnInfo.Item2, model.OpenId, Macro.PASSIDTYPE_WX_OpenId);
        //    }
        //    else
        //        returnInfo.Item2 = await returnInfo.Item1.GetUsersContext();
        //    returnInfo.Item3 = await UsersExContext.GetInfo(
        //        HttpContext.RequestServices,
        //        returnInfo.Item2.GetKey());
        //    if (returnInfo.Item3.IsEmpty())
        //        returnInfo.Item3 = await UsersExContext.SubWithBase(
        //            HttpContext.RequestServices,
        //            returnInfo.Item2.GetKey());
        //    return returnInfo;
        //}


        ///// <summary>
        ///// 获取用户信息
        ///// </summary>
        ///// <param name="model"></param>
        ///// <returns></returns>
        //protected async Task<(UserAuthsContext, UsersContext, UsersExContext)> GetUserInfo(
        //    UserInfoForWX model)
        //{
        //    (UserAuthsContext, UsersContext, UsersExContext) returnInfo = (null, null, null);
        //    //必须保证unionid存在
        //    returnInfo.Item1 = await VailUserInfo(model);
        //    if (returnInfo.Item1.IsEmpty())
        //    {
        //        returnInfo.Item2 = await UsersContext.SubWithBase(
        //            HttpContext.RequestServices,
        //            null,
        //            "",
        //            0,
        //            "",
        //            DateTime.MinValue,
        //            1,
        //            0,
        //            0,
        //            "",
        //            "",
        //            "",
        //            0,
        //            DateTime.Now,
        //            DateTime.Now,
        //            HttpContext.Connection.RemoteIpAddress.ToString(),
        //            "");
        //        var unionInfo = await CreateAuthInfo(returnInfo.Item2, model.UnionId, Macro.PASSIDTYPE_WX_UnionId);
        //        if (unionInfo.IsEmpty())
        //            throw new Exception("创建账号异常!");

        //        //await MonitorContext.SubWithBase(
        //        //    HttpContext.RequestServices,
        //        //    (int)EnumMonitorType.AppUserNewCount,
        //        //    Macro.AppUserNewCount);

        //        returnInfo.Item1 = unionInfo;
        //        await CreateAuthInfo(returnInfo.Item2, model.OpenId, Macro.PASSIDTYPE_WX_OpenId);



        //    }
        //    else
        //    {
        //        returnInfo.Item2 = await returnInfo.Item1.GetUsersContext();
        //        await CreateAuthInfo(returnInfo.Item2, model.OpenId, Macro.PASSIDTYPE_WX_OpenId);
        //    }
        //    returnInfo.Item3 = await UsersExContext.GetInfo(
        //        HttpContext.RequestServices,
        //        returnInfo.Item2.GetKey());
        //    if (returnInfo.Item3.IsEmpty())
        //        returnInfo.Item3 = await UsersExContext.SubWithBase(
        //            HttpContext.RequestServices,
        //            returnInfo.Item2.GetKey());
        //    return returnInfo;
        //}
    }
}
