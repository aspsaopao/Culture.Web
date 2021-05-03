using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Culture.STD.Models.Users
{
    /// <summary>
    /// 登录参数
    /// </summary>
    public class ParamForLogin
    {

        /// <summary>
        /// 登录账号
        /// </summary>
        [Required(ErrorMessage = "登录账号必须填写")]
        public string PassId { get; set; }

        /// <summary>
        /// 登录密码
        /// </summary>
        [Required(ErrorMessage = "登录密码必须填写")]
        public string PassWord { get; set; }

        /// <summary>
        /// 用户名字
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 验证码
        /// </summary>
        [Required(ErrorMessage ="验证码必须填写")]
        public string VerCode { get; set; }
    }
}
