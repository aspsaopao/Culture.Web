import { Component, Input } from '@angular/core';
import { MenuService } from './menu.service';
import { Router } from '@angular/router';
import { MenuBaseComponent } from './menubase.component';

@Component({
  selector: 'applayout-menuitem',
  templateUrl: './menuitem.component.html',
  styleUrls: ['./menuitem.component.less', './menup.component.less']
})
export class MenuitemComponent extends MenuBaseComponent {
  constructor(
    private router: Router,
    menu: MenuService) {
    super(menu);
  }

  itemClick() {
    if (!this.menuData)
      return;
    this.menuData[this.menu.prop.isActive] = true;
    this.router.navigate([this.menuData[this.menu.prop.url]]);
  }
}
