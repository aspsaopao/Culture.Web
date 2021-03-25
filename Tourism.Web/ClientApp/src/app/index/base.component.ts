import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { GeneralClient } from '../client/api_generalclient';
import { IndexClient } from '../client/index_indexclient';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import { LoginService } from '../framework/service/login.service';

/**管理首页路由基础组件 */
@Component({
  selector: 'appindex-base',
  templateUrl: './base.component.html',
  styleUrls: ['./base.component.less']
})
export class BaseComponent{

  /**
   * 管理首页路由基础组件
   * @param api 获取客户端服务
   * @param msg 全屏消息服务
   */
  public constructor(
    public msg: GlobalmsgService,
    private api: ApiClientService,
    private login: LoginService,
    private router: Router) {
    //订阅路由信息
    this.subscribe = this.router.events.subscribe(events => {
      if (events instanceof NavigationEnd) {
        //拉取用户信息,如果拉不到或登录失败跳转登录界面
        this.api.createClient(IndexClient)
          .getUserInfo()
          .subscribe(T => {
            if (T.data.isLogin != 1) {
              this.router.navigate(
                ['/app/login']);
            }
            else {
              //调用客户端
              this.login.setModel(T.data);
              this.showRouter = true;
              this.api.createClient(GeneralClient)
                .menu()
                .subscribe({
                  next: model => {
                    this.data = model.data;
                  },
                  error: e => {
                    this.msg.showError(e);
                  }
                });
            }
          },
            e => {
              this.msg.showError(e);
            });
      }
    });
  }

  private subscribe: Subscription = null;

  ngOnDestroy(): void {
    if (this.subscribe) {
      this.subscribe.unsubscribe();
      this.subscribe = null;
    }
  }

  showRouter = false;

  data = [];

  loginOut() {
    this.msg.loading = true;
    this.api.createClient(GeneralClient)
      .loginOut()
      .subscribe(
        model => {
          this.msg.loading = false;
          this.router.navigate(['/app/login']);
        },
        e => {
          this.msg.showError(e);
        });
  }

  changePassWord() {
    this.router.navigate(['/app/users/edit-myself'], {
      queryParams: {
        oldurl: this.router.url
      }
    });
  }
}
