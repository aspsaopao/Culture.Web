using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace TourismEmbedded.TourismWeb
{
    /// <summary>
    /// 
    /// </summary>
    public partial class ClientForPhoneApiSceniceMap
    {
        /// <summary>上传任务拍照临时文件</summary>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        public System.Threading.Tasks.Task<Tourism.STD.Models.InfoModel<NetCore.TempFileInfo>> UploadForTaskTempFileForProgressAsync(FileParameter file)
        {
            return UploadForTaskTempFileForProgressAsync(file, System.Threading.CancellationToken.None);
        }

        /// <param name="cancellationToken">A cancellation token that can be used by other objects or threads to receive notice of cancellation.</param>
        /// <summary>上传任务拍照临时文件</summary>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        /// <param name="file"></param>
        public async System.Threading.Tasks.Task<Tourism.STD.Models.InfoModel<NetCore.TempFileInfo>> UploadForTaskTempFileForProgressAsync(FileParameter file, System.Threading.CancellationToken cancellationToken)
        {
            var urlBuilder_ = new System.Text.StringBuilder();
            urlBuilder_.Append("PhoneApi/SceniceMap/UploadForTaskTempFile");

            var client_ = _httpClient;
            var disposeClient_ = false;
            try
            {
                using (var request_ = await CreateHttpRequestMessageAsync(cancellationToken).ConfigureAwait(false))
                {
                    var boundary_ = System.Guid.NewGuid().ToString();
                    var content_ = new System.Net.Http.MultipartFormDataContent(boundary_);
                    content_.Headers.Remove("Content-Type");
                    content_.Headers.TryAddWithoutValidation("Content-Type", "multipart/form-data; boundary=" + boundary_);
                    if (file != null)
                    {
                        var content_file_ = new ProgressContent(file.Data, CacheBufferLengthForProgress);
                        var methonInfo = MethodBase.GetCurrentMethod();
                        content_file_.Progress += (arg, arg1) =>
                        {
                            InvokeProgressEvent(new EventArgsOfClientProgress(
                                "file",
                                methonInfo,
                                arg1));
                        };
                        if (!string.IsNullOrEmpty(file.ContentType))
                            content_file_.Headers.ContentType = System.Net.Http.Headers.MediaTypeHeaderValue.Parse(file.ContentType);
                        content_.Add(content_file_, "file", file.FileName ?? "file");
                    }
                    request_.Content = content_;
                    request_.Method = new System.Net.Http.HttpMethod("POST");
                    request_.Headers.Accept.Add(System.Net.Http.Headers.MediaTypeWithQualityHeaderValue.Parse("application/json"));

                    PrepareRequest(client_, request_, urlBuilder_);
                    var url_ = urlBuilder_.ToString();
                    request_.RequestUri = new System.Uri(url_, System.UriKind.RelativeOrAbsolute);
                    PrepareRequest(client_, request_, url_);

                    var response_ = await client_.SendAsync(request_, System.Net.Http.HttpCompletionOption.ResponseHeadersRead, cancellationToken).ConfigureAwait(false);
                    var disposeResponse_ = true;
                    try
                    {
                        var headers_ = System.Linq.Enumerable.ToDictionary(response_.Headers, h_ => h_.Key, h_ => h_.Value);
                        if (response_.Content != null && response_.Content.Headers != null)
                        {
                            foreach (var item_ in response_.Content.Headers)
                                headers_[item_.Key] = item_.Value;
                        }

                        ProcessResponse(client_, response_);

                        var status_ = (int)response_.StatusCode;
                        if (status_ == 200)
                        {
                            var objectResponse_ = await ReadObjectResponseAsync<Tourism.STD.Models.InfoModel<NetCore.TempFileInfo>>(response_, headers_).ConfigureAwait(false);
                            return objectResponse_.Object;
                        }
                        else
                        {
                            var responseData_ = response_.Content == null ? null : await response_.Content.ReadAsStringAsync().ConfigureAwait(false);
                            throw new ApiException("The HTTP status code of the response was not expected (" + status_ + ").", status_, responseData_, headers_, null);
                        }
                    }
                    finally
                    {
                        if (disposeResponse_)
                            response_.Dispose();
                    }
                }
            }
            finally
            {
                if (disposeClient_)
                    client_.Dispose();
            }
        }
    }
}
