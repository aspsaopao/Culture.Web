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


export interface PageInfo {
    count?: number | undefined;
    index?: number | undefined;
    pageSize?: number | undefined;
    readonly pageCount?: number | undefined;
}

/** 举报参数 */
export interface TableOutputReportInput {
    pageInfo?: PageInfo | undefined;
    /** 状态 */
    status?: number | undefined;
}

export interface TempFileInfo {
    serverFileName?: string | undefined;
    localFileName?: string | undefined;
    serverDirPath?: string | undefined;
    readonly remoteFilePath?: string | undefined;
}

/** 名称-类型 */
export interface Int32StringTypeForName {
    /** id */
    id?: number | undefined;
    /** 内容 */
    name?: string | undefined;
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
    /** 介绍 */
    introduce?: string | undefined;
    /** 审核状态 */
    status?: number | undefined;
    /** 状态名称 */
    ststusName?: string | undefined;
    /** 审核状态列表 */
    examineList?: Int32StringTypeForName[] | undefined;
}

/** 举报信息 */
export interface TableOutputReportInfo {
    /** 举报信息列表 */
    reportList?: OutPutContentInfoItem[] | undefined;
    page?: PageInfo | undefined;
    /** 审核状态列表 */
    examineList?: Int32StringTypeForName[] | undefined;
}

/** 模型 */
export interface TableOutputReportInfoInfoModel {
    data?: TableOutputReportInfo | undefined;
    cacheKey?: string | undefined;
    isSuccess?: boolean | undefined;
    message?: string | undefined;
    code?: number | undefined;
}

/** 模型 */
export interface TempFileInfoInfoModel {
    data?: TempFileInfo | undefined;
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

/** 添加修改内容 */
export interface InputAddEditForContent {
    /** 活动id */
    aid?: string | undefined;
    /** 活动主题 */
    title?: string | undefined;
    headImage?: TempFileInfo | undefined;
    /** 活动详情 */
    details?: string | undefined;
    /** 介绍 */
    introduce?: string | undefined;
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
    /** 登录密码 */
    name: string;
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