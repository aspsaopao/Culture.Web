import { ObservableInput, of, Observable, empty } from 'rxjs';
import { HttpProgressEvent, HttpEventType, HttpErrorResponse } from '@angular/common/http';
import { environment } from '../../environments/environment';

export interface ErrorInfo {
  isSuccess: boolean;
  message: string;
  code: number;
  [key: string]: any;
}

/** 校验 */
export interface ValidationProblemDetails {
  /**类型 */
  type: string;

  /**标题 */
  title: string;

  /** 状态 */
  status: number;

  /**最终 */
  traceId: string;

  /**错误列表 */
  errors: { [key: string]: string[]; };
}

export class ApiException extends Error {
  message: string;
  status: number;
  response: string;
  headers: { [key: string]: any; };
  result: ErrorInfo;

  constructor(message: string, status: number, response: string, headers: { [key: string]: any; }, result: any) {
    super();
    this.message = message;
    this.status = status;
    this.response = response;
    this.headers = headers;
    this.result = result;
    if (status == 0 && response == '' && !result) {
      this.result = {
        isSuccess: false,
        code: 0,
        message: '网络异常,很可能网络不稳定或上传文件过大导致服务器断开'
      };
      return;
    }
    if (status != 200 && !result) {
      try {
        this.result = JSON.parse(response);
      }
      catch
      {
        this.result = null;
      }
    }
  }

  protected isApiException = true;

  static isApiException(obj: any): obj is ApiException {
    return obj.isApiException === true;
  }

  static resultWithValidationProblemDetails(obj: any): obj is ValidationProblemDetails {
    return obj.type == 'https://tools.ietf.org/html/rfc7231#section-6.5.1';
  }
}

/**客户端事件 */
export class ClientEvent {
  event: HttpProgressEvent = null;

  /**
   * 判断是否是ClientLoading
   * @param v
   */
  static isClientEvent(v: any): v is ClientEvent {
    return v instanceof ClientEvent;
  }

  /** 是否可以设置进度 */
  get canSetPercent() {
    if (this.event.total > 0 && this.event.loaded >= 0)
      return true;
    return false;
  }

  /** 获取百分比 */
  get percent() {
    if (!this.event)
      return 0;
    if (this.event.total > 0 && this.event.loaded >= 0) {
      return (this.event.loaded / this.event.total) * 100;
    }
    return 0;
  }
}

export class ClientBase {

  private clientLoading: ClientEvent = null;

  protected transformOptions(options: any): ObservableInput<any> {
    if (!environment.production)
      options.withCredentials = true;
    if (this.isUpload) {
      options.reportProgress = true;
      options.observe = 'events';
    }
    return of(options);
  }

  set isUpload(v: boolean) {
    if (v)
      this.clientLoading = new ClientEvent();
    else {
      if (this.clientLoading) {
        delete this.clientLoading;
        this.clientLoading = null;
      }
    }
  }

  get isUpload(): boolean {
    if (this.clientLoading)
      return true;
    return false;
  }

  protected transformResult<T>(url: string, response: any, callback: (r: any) => Observable<T>): Observable<T> {
    if (this.isUpload) {
      if (response instanceof HttpErrorResponse) {
        return callback(response);
      }
      if (response.type == HttpEventType.UploadProgress) {
        this.clientLoading.event = {
          loaded: (response as HttpProgressEvent).loaded,
          type: (response as HttpProgressEvent).type,
          total: (response as HttpProgressEvent).total
        }
        return of(this.clientLoading as any);
      }
      if (response.type == HttpEventType.Response)
        return callback(response);
      return empty();
    }
    return callback(response);
  }
}
