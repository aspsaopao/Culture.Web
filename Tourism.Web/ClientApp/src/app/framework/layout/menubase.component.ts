import { Input } from '@angular/core';
import { MenuService } from './menu.service';
export class MenuBaseComponent {

  /** 菜单服务 */
  protected menu: MenuService;

  constructor(menu: MenuService) {
    this.menu = menu;
  }

  @Input()
  isRoot: boolean = false;

  /** 获取标题 */
  get title() {
    if (this.menuData)
      return this.menuData[this.menu.prop.title];
    return '';
  }

  /** 获取icon */
  get icon() {
    if (this.menuData)
      return `${this.menuData[this.menu.prop.icon]} menuitem`;
    return '';
  }

  /** 获取孩子节点 */
  get children() {
    if (this.menuData) {
      let children = this.menuData[this.menu.prop.children];
      if (children)
        return children;
    }
    return [];
  }

  /** 是否激活 */
  isActive() {
    if (this.menuData)
      return this.menuData[this.menu.prop.isActive];
    return false;
  }

  /** 传入 */
  @Input()
  menuData: any;
}
