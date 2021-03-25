
namespace Culture.Web.FilterController
{
    /// <summary>
    /// 登录信息
    /// </summary>
    public class LoginInfo
    {
        /// <summary>
        /// 
        /// </summary>
        public LoginInfo()
        {
            VailUnionId = true;
        }
        /// <summary>
        /// 头像路径
        /// </summary>
        public string HeaderUrl { get; set; }

        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName { get; set; }

        /// <summary>
        /// 是否校验unionid
        /// </summary>
        public bool VailUnionId { get; set; }
    }
}
