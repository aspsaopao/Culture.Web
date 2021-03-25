using IdentityServer4.ResponseHandling;
using IdentityServer4.Validation;
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
    /// 自定义验证器
    /// </summary>
    public class MandatoryExpCustomTokenValidator : ICustomTokenValidator
    {

        readonly ILogger<MandatoryExpCustomTokenValidator> Logger;
        readonly IDistributedCache Cache;

        /// <summary>
        /// 
        /// </summary>
        public MandatoryExpCustomTokenValidator(
            IDistributedCache cache,
            ILogger<MandatoryExpCustomTokenValidator> logger)
        {
            Logger = logger;
            Cache = cache;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        public async Task<TokenValidationResult> ValidateAccessTokenAsync(TokenValidationResult result)
        {
            var key = result.ReferenceToken.SubjectId.GetKey();
            var cacheText = await Cache.GetStringAsync(key);
            if (!cacheText.IsNullOrEmpty())
            {
                var cacheObj = JsonConvert.DeserializeObject<TokenResponse>(cacheText);
                if (!cacheObj.IsNull())
                {
                    if (cacheObj.AccessToken != result.ReferenceTokenId)
                    {
                        result.IsError = true;
                        result.Error = "token已经被顶掉";
                    }
                }
            }
            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        public Task<TokenValidationResult> ValidateIdentityTokenAsync(TokenValidationResult result)
        {
            return ValidateAccessTokenAsync(result);
        }
    }
}
