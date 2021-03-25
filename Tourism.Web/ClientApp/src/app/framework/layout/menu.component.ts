import { Component, Input } from '@angular/core';
import { MenuService } from './menu.service';

@Component({
  selector: 'applayout-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.less']
})
export class MenuComponent {
  constructor(public menu: MenuService) {

  }

  @Input()
  collapsed: boolean = false;
}
