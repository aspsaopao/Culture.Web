import { Injectable } from '@angular/core';
import { ApiException, ErrorInfo } from '../clientex';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Router } from '@angular/router';

@Injectable()
export class GlobalmsgService {
  constructor(
    private router: Router,
    private msg: NzMessageService) {
  }

  private _spin = false;

  /** 是否加载spin */
  set spin(v: boolean) {
    setTimeout(() => {
      this._spin = v;
    });
  }

  get spin(): boolean {
    return this._spin;
  }

  private _loading = false;

  /**
   *是否显示转圈
   */
  set loading(v: boolean) {
    setTimeout(() => {
      this._loading = v;
    });
  }

  get loading(): boolean {
    return this._loading;
  }

  private _jumplogin = '';

  set jumplogin(jp: string) {
    this._jumplogin = jp;
  }

  /**
   * 显示成功但不关闭loading
   * @param e 成功描述
   */
  showSucNotHiddenLoading(e: string) {
    this.msg.create('success', e);
  }

  /**
 * 显示错误但不关闭loading
 * @param e 错误描述
 */
  showErrorNotHiddenLoading(e: string) {
    this.msg.create('error', e);
  }

  /**
   * 成功调用
   * @param e 成功描述
   */
  showSuc(e: string) {
    this.loading = false;
    this.spin = false;
    this.showSucNotHiddenLoading(e);
  }

  private showErrorMsg(e: ApiException) {
    if (e.result.code == 10001)
      this.router.navigate([this._jumplogin]);
    else {
      if (ApiException.resultWithValidationProblemDetails(e.result)) {
        if (e.result.errors) {
          let errorMsg = '';
          let errorInfoIndex = 0;
          for (let errorKey in e.result.errors) {
            let errorInfo = e.result.errors[errorKey];
            for (let errorInfoKey in errorInfo) {
              if (errorInfoIndex == 0)
                errorMsg += errorInfo[errorInfoKey];
              else
                errorMsg += `,${errorInfo[errorInfoKey]}`;
              errorInfoIndex++;
            }
          }
          this.msg.create('error', errorMsg);
        }
        else
          this.msg.create('error', e.result.title);
      }
      else
        this.msg.create('error', e.result.message);
    }
  }

  /**
   * 失败调用
   * @param e 异常
   * @param excallback 回调,可不设置
   */
  showError(e: any, excallback: (e: ApiException) => boolean = null) {
    this.loading = false;
    this.spin = false;
    if (ApiException.isApiException(e)) {
      if (e.result) {
        if (excallback) {
          if (excallback(e))
            return;
        }
        this.showErrorMsg(e);
      }
      else
        this.msg.create('error', e.message);
    }
  }

  create(type, value) {
    this.msg.create(type, value);
  }
}
