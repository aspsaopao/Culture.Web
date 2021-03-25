import { Injectable } from '@angular/core';
import { Router, NavigationEnd, ActivatedRoute } from '@angular/router';
import { isArray } from 'util';

interface FindPath {
  path: string;
}

/**菜单项配置 */
export interface MenuitemProp {
  url?: string;
  title?: string;
  icon?: string;
  children?: string;
  selectedUrls?: string;
  isActive?: string;
}

/**菜单服务 */
@Injectable()
export class MenuService {
  constructor(
    private router: Router) {
    this.prop = {
      url: 'url',
      title: 'name',
      icon: 'icon',
      selectedUrls: 'selectedUrls',
      children: 'children',
      isActive: 'isActive'
    };
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd && this._data) {
        this.setActive(this._data);
      }
    });
  }

  private findPathForConfig(act: ActivatedRoute, find: FindPath) {
    if (!act)
      return;
    if (act.routeConfig && act.routeConfig.path != '')
      find.path += `/${act.routeConfig.path}`;
    this.findPathForConfig(act.firstChild, find);
  }

  private setActive(inputdata: any) {
    let find: FindPath = {
      path: ''
    };
    this.findPathForConfig(this.router.routerState.root, find);
    this.findActiveObj(
      inputdata,
      T => {
        let isselect = false;
        $.each(T[this.prop.selectedUrls], (i, s) => {
          if (!isselect) {
            if (s == find.path) {
              isselect = true;
              return false;
            }
          }
        });
        if (isselect)
          return isselect;
        return T[this.prop.url] == find.path;
      });
  }

  private _data: any;

  /** 菜单数据 */
  public set data(inputdata: any) {
    this.setActive(inputdata);
    this._data = inputdata;
  }

  public get data() {
    return this._data;
  }

  /**是否展开*/
  isCollapsed = false;

  /**是否初始化过菜单*/
  isInit: boolean = false;

  /** 选项配置 */
  prop: MenuitemProp;

  /**
   * 查找激活item
   * @param finddata
   * @param func
   */
  private findActiveObj(finddata: any, func: (d: any) => boolean) {
    if (!isArray(finddata))
      return false;
    let found = false;
    $.each(finddata, (i, d) => {
      d[this.prop.isActive] = false;
      if (func(d)) {
        d[this.prop.isActive] = true;
        found = true;
      }
      if (this.findActiveObj(d[this.prop.children], func)) {
        d[this.prop.isActive] = true;
        found = true;
      }
    });
    return found;
  }
}
