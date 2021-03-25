using IdentityModel;
using IdentityServer4.Extensions;
using IdentityServer4.ResponseHandling;
using IdentityServer4.Services;
using IdentityServer4.Stores;
using IdentityServer4.Validation;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CultureRazor.IdentityServer
{
    /// <summary>
    /// 强制过期token生成
    /// </summary>
    public class MandatoryExpTokenResponseGenerator : TokenResponseGenerator
    {
       readonly IDistributedCache _cache;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="clock"></param>
        /// <param name="tokenService"></param>
        /// <param name="refreshTokenService"></param>
        /// <param name="scopeParser"></param>
        /// <param name="resources"></param>
        /// <param name="clients"></param>
        /// <param name="logger"></param>
        /// <param name="cache"></param>
        public MandatoryExpTokenResponseGenerator(
            IDistributedCache cache,
            ISystemClock clock,
            ITokenService tokenService,
            IRefreshTokenService refreshTokenService,
            IScopeParser scopeParser, 
            IResourceStore resources, 
            IClientStore clients,
            ILogger<TokenResponseGenerator> logger) : 
            base(clock, tokenService, refreshTokenService, scopeParser, resources, clients, logger)
        {
            _cache = cache;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public override async Task<TokenResponse> ProcessAsync(TokenRequestValidationResult request)
        {
            var result = new TokenResponse();
            switch (request.ValidatedRequest.GrantType)
            {
                case OidcConstants.GrantTypes.ClientCredentials:
                    result = await ProcessClientCredentialsRequestAsync(request);
                    break;
                case OidcConstants.GrantTypes.Password:
                    result = await ProcessPasswordRequestAsync(request);
                    break;
                case OidcConstants.GrantTypes.AuthorizationCode:
                    result = await ProcessAuthorizationCodeRequestAsync(request);
                    break;
                case OidcConstants.GrantTypes.RefreshToken:
                    result = await ProcessRefreshTokenRequestAsync(request);
                    break;
                default:
                    result = await ProcessExtensionGrantRequestAsync(request);
                    break;
            }
            var resultText = JsonConvert.SerializeObject(result);
            var key = request.ValidatedRequest.Subject.GetSubjectId().GetKey();
            Logger.LogInformation($"白名单key写入:{key}");
            await _cache.SetStringAsync(key, resultText);
            return result;
        }
    }
}
