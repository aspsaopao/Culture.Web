import { Injectable } from '@angular/core';

/** 登录模型 */
export interface LoginModel {
  /** 是否登录0:非登录,1:登录 */
  isLogin?: number | undefined;
  /** 登录用户id */
  uId?: string | undefined;
  /** 登录人名字 */
  name?: string | undefined;
  /** debug描述 */
  remark?: string | undefined;
  /** 用户类型：1-协会，2-托管机构 */
  userType?: number | undefined;
}

/**登录服务 */
@Injectable()
export class LoginService {
  constructor() {

  }

  private model: LoginModel;

  /**
   * 设置模型
   * @param model 模型
   */
  setModel(model: LoginModel) {
    this.model = model;
  }

  /** 判断是否登录 */
  get isLogin() {
    if (this.model)
      return this.model.isLogin;
    return 0;
  }

  /** 获取用户id */
  get id() {
    if (this.model)
      return this.model.uId;
    return '';
  }

  /**获取真实姓名*/
  get realName() {
    if (this.model)
      return this.model.name;
    return '';
  }
}
