import { Injectable } from '@angular/core';
import { ClientBase } from '../clientex';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';


@Injectable()
export class ApiClientService {

  /** 远程服务器地址 */
  baseUrl = '';
  constructor(
    private httpclient: HttpClient) {
    this.baseUrl = environment.remoteUrl;
  }

  /**
   * 获取远程地址
   * @param path 域名或ip后半部分
   */
  getRemoteUrl(path: string) {
    let newPath = path.toLowerCase();
    if (newPath.indexOf('http://') == 0)
      return path;
    if (newPath.indexOf('https://') == 0)
      return path;
    return `${this.baseUrl}${path}`;
  }

  /**
   * 获取客户端
   * @param n
   */
  createClient<T extends ClientBase>(n: new (p: HttpClient, url: string) => T) {
    return new n(this.httpclient, this.baseUrl);
  }
}
