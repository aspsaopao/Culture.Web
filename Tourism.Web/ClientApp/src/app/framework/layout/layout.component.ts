import { Component, Input, Output, EventEmitter } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';
import { MenuService } from './menu.service';
import { LayoutService } from './layout.service';
import { GlobalmsgService } from '../service/globalmsg.service';

@Component({
  selector: 'applayout-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.less']
})
/** layout component*/
export class LayoutComponent {
  constructor(
    private notify: LayoutService,
    public menu: MenuService,
    public msg: GlobalmsgService,
    private dom: DomSanitizer) {

  }

  @Input()
  style: string;

  getStyle() {
    return this.dom.bypassSecurityTrustStyle(this.style);
  }

  @Input()
  siderWidth: number = 200;

  @Input()
  set menuData(data: any) {
    this.menu.data = data;
  }

  _transitionEnd() {
    this.notify.notifySrc();
  }
}
