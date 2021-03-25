import { Component, Input } from '@angular/core';
import { MenuService } from './menu.service';
import { MenuBaseComponent } from './menubase.component';

@Component({
  selector: 'applayout-menusub',
  templateUrl: './menusub.component.html',
  styleUrls: ['./menusub.component.less', './menup.component.less']
})
export class MenusubComponent extends MenuBaseComponent {
  constructor(menu: MenuService) {
    super(menu);
  }

  isActive() {
    if (this.isRoot) {
      if (this.menu.isCollapsed)
        return false;
      return super.isActive();
    }
    else
      return super.isActive();
  }

  openChange(v: boolean) {
    this.menuData[this.menu.prop.isActive] = v;
  }
}
