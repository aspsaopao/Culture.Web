using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;

namespace TourismEmbedded.TourismWeb
{
    /// <summary>
    /// 
    /// </summary>
    public partial class ClientForPhoneApiLogin
    {

        private Dictionary<string, IEnumerable<string>> _headers;

        /// <summary>
        /// 头信息
        /// </summary>
        public Dictionary<string, IEnumerable<string>> Headers => _headers;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="client"></param>
        /// <param name="response"></param>
        partial void ProcessResponse(HttpClient client, HttpResponseMessage response)
        {
            _headers = System.Linq.Enumerable.ToDictionary(response.Headers, h_ => h_.Key, h_ => h_.Value);
            if (response.Content != null && response.Content.Headers != null)
            {
                foreach (var item_ in response.Content.Headers)
                    _headers[item_.Key] = item_.Value;
            }
        }
    }
}
