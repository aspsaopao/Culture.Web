/* tslint:disable */
/* eslint-disable */
//----------------------
// <auto-generated>
//     Generated using the NSwag toolchain v13.9.4.0 (NJsonSchema v10.3.1.0 (Newtonsoft.Json v12.0.0.0)) (http://NSwag.org)
// </auto-generated>
//----------------------
// ReSharper disable InconsistentNaming

import { ClientBase, ApiException } from './clientex';
import { mergeMap as _observableMergeMap, catchError as _observableCatch } from 'rxjs/operators';
import { Observable, from as _observableFrom, throwError as _observableThrow, of as _observableOf } from 'rxjs';
import { Injectable, Inject, Optional, InjectionToken } from '@angular/core';
import { HttpClient, HttpHeaders, HttpResponse, HttpResponseBase } from '@angular/common/http';

export const API_BASE_URL = new InjectionToken<string>('API_BASE_URL');

@Injectable()
export class IndexClient extends ClientBase {
    private http: HttpClient;
    private baseUrl: string;
    protected jsonParseReviver: ((key: string, value: any) => any) | undefined = undefined;

    constructor(@Inject(HttpClient) http: HttpClient, @Optional() @Inject(API_BASE_URL) baseUrl?: string) {
        super();
        this.http = http;
        this.baseUrl = baseUrl !== undefined && baseUrl !== null ? baseUrl : "";
    }

    /**
     * 获取列表
     * @param body (optional) 
     * @return Success
     */
    getList(body: PageInfo | null | undefined): Observable<OutPutContentInfoItemInfoModelList> {
        let url_ = this.baseUrl + "/Index/Index/GetList";
        url_ = url_.replace(/[?&]$/, "");

        const content_ = JSON.stringify(body);

        let options_ : any = {
            body: content_,
            observe: "response",
            responseType: "blob",
            headers: new HttpHeaders({
                "Content-Type": "application/json",
                "Accept": "application/json"
            })
        };

        return _observableFrom(this.transformOptions(options_)).pipe(_observableMergeMap(transformedOptions_ => {
            return this.http.request("post", url_, transformedOptions_);
        })).pipe(_observableMergeMap((response_: any) => {
            return this.transformResult(url_, response_, (r) => this.processGetList(<any>r));
        })).pipe(_observableCatch((response_: any) => {
            if (response_ instanceof HttpResponseBase) {
                try {
                    return this.transformResult(url_, response_, (r) => this.processGetList(<any>r));
                } catch (e) {
                    return <Observable<OutPutContentInfoItemInfoModelList>><any>_observableThrow(e);
                }
            } else
                return <Observable<OutPutContentInfoItemInfoModelList>><any>_observableThrow(response_);
        }));
    }

    protected processGetList(response: HttpResponseBase): Observable<OutPutContentInfoItemInfoModelList> {
        const status = response.status;
        const responseBlob =
            response instanceof HttpResponse ? response.body :
            (<any>response).error instanceof Blob ? (<any>response).error : undefined;

        let _headers: any = {}; if (response.headers) { for (let key of response.headers.keys()) { _headers[key] = response.headers.get(key); }}
        if (status === 200) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            let result200: any = null;
            result200 = _responseText === "" ? null : <OutPutContentInfoItemInfoModelList>JSON.parse(_responseText, this.jsonParseReviver);
            return _observableOf(result200);
            }));
        } else if (status !== 200 && status !== 204) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            return throwException("An unexpected server error occurred.", status, _responseText, _headers);
            }));
        }
        return _observableOf<OutPutContentInfoItemInfoModelList>(<any>null);
    }

    /**
     * 获取信息详情
     * @param id (optional) 
     * @return Success
     */
    getInfo(id: string | null | undefined): Observable<OutPutContentInfoItemInfoModel> {
        let url_ = this.baseUrl + "/Index/Index/GetInfo";
        url_ = url_.replace(/[?&]$/, "");

        const content_ = new FormData();
        if (id !== null && id !== undefined)
            content_.append("Id", id.toString());

        let options_ : any = {
            body: content_,
            observe: "response",
            responseType: "blob",
            headers: new HttpHeaders({
                "Accept": "application/json"
            })
        };

        return _observableFrom(this.transformOptions(options_)).pipe(_observableMergeMap(transformedOptions_ => {
            return this.http.request("post", url_, transformedOptions_);
        })).pipe(_observableMergeMap((response_: any) => {
            return this.transformResult(url_, response_, (r) => this.processGetInfo(<any>r));
        })).pipe(_observableCatch((response_: any) => {
            if (response_ instanceof HttpResponseBase) {
                try {
                    return this.transformResult(url_, response_, (r) => this.processGetInfo(<any>r));
                } catch (e) {
                    return <Observable<OutPutContentInfoItemInfoModel>><any>_observableThrow(e);
                }
            } else
                return <Observable<OutPutContentInfoItemInfoModel>><any>_observableThrow(response_);
        }));
    }

    protected processGetInfo(response: HttpResponseBase): Observable<OutPutContentInfoItemInfoModel> {
        const status = response.status;
        const responseBlob =
            response instanceof HttpResponse ? response.body :
            (<any>response).error instanceof Blob ? (<any>response).error : undefined;

        let _headers: any = {}; if (response.headers) { for (let key of response.headers.keys()) { _headers[key] = response.headers.get(key); }}
        if (status === 200) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            let result200: any = null;
            result200 = _responseText === "" ? null : <OutPutContentInfoItemInfoModel>JSON.parse(_responseText, this.jsonParseReviver);
            return _observableOf(result200);
            }));
        } else if (status !== 200 && status !== 204) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            return throwException("An unexpected server error occurred.", status, _responseText, _headers);
            }));
        }
        return _observableOf<OutPutContentInfoItemInfoModel>(<any>null);
    }

    /**
     * 安装系统
     * @param passId (optional) 
     * @param passWord (optional) 
     * @return Success
     */
    setup(passId: string | null | undefined, passWord: string | null | undefined): Observable<StringInfoModel> {
        let url_ = this.baseUrl + "/Index/Index/Setup";
        url_ = url_.replace(/[?&]$/, "");

        const content_ = new FormData();
        if (passId !== null && passId !== undefined)
            content_.append("passId", passId.toString());
        if (passWord !== null && passWord !== undefined)
            content_.append("passWord", passWord.toString());

        let options_ : any = {
            body: content_,
            observe: "response",
            responseType: "blob",
            headers: new HttpHeaders({
                "Accept": "application/json"
            })
        };

        return _observableFrom(this.transformOptions(options_)).pipe(_observableMergeMap(transformedOptions_ => {
            return this.http.request("post", url_, transformedOptions_);
        })).pipe(_observableMergeMap((response_: any) => {
            return this.transformResult(url_, response_, (r) => this.processSetup(<any>r));
        })).pipe(_observableCatch((response_: any) => {
            if (response_ instanceof HttpResponseBase) {
                try {
                    return this.transformResult(url_, response_, (r) => this.processSetup(<any>r));
                } catch (e) {
                    return <Observable<StringInfoModel>><any>_observableThrow(e);
                }
            } else
                return <Observable<StringInfoModel>><any>_observableThrow(response_);
        }));
    }

    protected processSetup(response: HttpResponseBase): Observable<StringInfoModel> {
        const status = response.status;
        const responseBlob =
            response instanceof HttpResponse ? response.body :
            (<any>response).error instanceof Blob ? (<any>response).error : undefined;

        let _headers: any = {}; if (response.headers) { for (let key of response.headers.keys()) { _headers[key] = response.headers.get(key); }}
        if (status === 200) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            let result200: any = null;
            result200 = _responseText === "" ? null : <StringInfoModel>JSON.parse(_responseText, this.jsonParseReviver);
            return _observableOf(result200);
            }));
        } else if (status !== 200 && status !== 204) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            return throwException("An unexpected server error occurred.", status, _responseText, _headers);
            }));
        }
        return _observableOf<StringInfoModel>(<any>null);
    }

    /**
     * 获取用户信息
     * @return Success
     */
    getUserInfo(): Observable<LoginModelInfoModel> {
        let url_ = this.baseUrl + "/Index/Index/GetUserInfo";
        url_ = url_.replace(/[?&]$/, "");

        let options_ : any = {
            observe: "response",
            responseType: "blob",
            headers: new HttpHeaders({
                "Accept": "application/json"
            })
        };

        return _observableFrom(this.transformOptions(options_)).pipe(_observableMergeMap(transformedOptions_ => {
            return this.http.request("post", url_, transformedOptions_);
        })).pipe(_observableMergeMap((response_: any) => {
            return this.transformResult(url_, response_, (r) => this.processGetUserInfo(<any>r));
        })).pipe(_observableCatch((response_: any) => {
            if (response_ instanceof HttpResponseBase) {
                try {
                    return this.transformResult(url_, response_, (r) => this.processGetUserInfo(<any>r));
                } catch (e) {
                    return <Observable<LoginModelInfoModel>><any>_observableThrow(e);
                }
            } else
                return <Observable<LoginModelInfoModel>><any>_observableThrow(response_);
        }));
    }

    protected processGetUserInfo(response: HttpResponseBase): Observable<LoginModelInfoModel> {
        const status = response.status;
        const responseBlob =
            response instanceof HttpResponse ? response.body :
            (<any>response).error instanceof Blob ? (<any>response).error : undefined;

        let _headers: any = {}; if (response.headers) { for (let key of response.headers.keys()) { _headers[key] = response.headers.get(key); }}
        if (status === 200) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            let result200: any = null;
            result200 = _responseText === "" ? null : <LoginModelInfoModel>JSON.parse(_responseText, this.jsonParseReviver);
            return _observableOf(result200);
            }));
        } else if (status !== 200 && status !== 204) {
            return blobToText(responseBlob).pipe(_observableMergeMap(_responseText => {
            return throwException("An unexpected server error occurred.", status, _responseText, _headers);
            }));
        }
        return _observableOf<LoginModelInfoModel>(<any>null);
    }
}

export interface TempFileInfo {
    serverFileName?: string | undefined;
    localFileName?: string | undefined;
    serverDirPath?: string | undefined;
    readonly remoteFilePath?: string | undefined;
}

/** 模型 */
export interface TempFileInfoInfoModel {
    data?: TempFileInfo | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

/** 添加修改内容 */
export interface InputAddEditForContent {
    /** 活动id */
    aid?: string | undefined;
    /** 活动主题 */
    title?: string | undefined;
    headImage?: TempFileInfo | undefined;
    /** 活动详情 */
    details?: string | undefined;
}

/** 模型 */
export interface BooleanInfoModel {
    data?: boolean | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

/** 菜单结构 */
export interface NavBarItem {
    /** 图标 */
    icon?: string | undefined;
    url?: string | undefined;
    state?: number | undefined;
    name?: string | undefined;
    module?: string[] | undefined;
    selectedUrls?: string[] | undefined;
    children?: NavBarItem[] | undefined;
}

/** 模型 */
export interface NavBarItemListInfoModel {
    data?: NavBarItem[] | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

/** 模型 */
export interface StringInfoModel {
    data?: string | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

export interface PageInfo {
    count?: number | undefined;
    index?: number | undefined;
    pageSize?: number | undefined;
    readonly pageCount?: number | undefined;
}

/** 首页返回列表 */
export interface OutPutContentInfoItem {
    /** id */
    contentId?: string | undefined;
    /** 标题 */
    title?: string | undefined;
    /** 内容 */
    content?: string | undefined;
    /** 发布日期 */
    createTiem?: string | undefined;
    headImage?: TempFileInfo | undefined;
}

/** 列表模型 */
export interface OutPutContentInfoItemInfoModelList {
    isNext?: boolean | undefined;
    pageInfo?: PageInfo | undefined;
    listData?: OutPutContentInfoItem[] | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

/** 模型 */
export interface OutPutContentInfoItemInfoModel {
    data?: OutPutContentInfoItem | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

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
}

/** 模型 */
export interface LoginModelInfoModel {
    data?: LoginModel | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

/** 登录参数 */
export interface ParamForLogin {
    /** 登录账号 */
    passId: string;
    /** 登录密码 */
    passWord: string;
    /** 验证码 */
    verCode: string;
}

export enum TypeScriptTemplate {
    _0 = 0,
    _1 = 1,
    _2 = 2,
    _3 = 3,
    _4 = 4,
    _5 = 5,
    _6 = 6,
}

export enum HttpClass {
    _0 = 0,
    _1 = 1,
}

function throwException(message: string, status: number, response: string, headers: { [key: string]: any; }, result?: any): Observable<any> {
    return _observableThrow(new ApiException(message, status, response, headers, result));
}

function blobToText(blob: any): Observable<string> {
    return new Observable<string>((observer: any) => {
        if (!blob) {
            observer.next("");
            observer.complete();
        } else {
            let reader = new FileReader();
            reader.onload = event => {
                observer.next((<any>event.target).result);
                observer.complete();
            };
            reader.readAsText(blob);
        }
    });
}