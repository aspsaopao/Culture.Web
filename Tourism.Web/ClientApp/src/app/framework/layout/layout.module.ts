import { NgModule } from '@angular/core';
import { LayoutComponent } from './layout.component';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzSliderModule } from 'ng-zorro-antd/slider';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzBreadCrumbModule } from 'ng-zorro-antd/breadcrumb';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { MenuService } from './menu.service';
import { MenuComponent } from './menu.component';
import { CommonModule } from '@angular/common';
import { MenuitemComponent } from './menuitem.component';
import { MenusubComponent } from './menusub.component';
import { ContentModule } from './content/content.module';
import { LayoutService } from './layout.service';
import { DirectiveModule } from './directive.module';
import { NzSpinModule } from 'ng-zorro-antd';

@NgModule({
  declarations: [
    LayoutComponent,
    MenuComponent,
    MenuitemComponent,
    MenusubComponent,
  ],
  imports: [
    NzLayoutModule,
    NzSliderModule,
    NzMenuModule,
    NzBreadCrumbModule,
    NzIconModule,
    CommonModule,
    ContentModule,
    DirectiveModule,
    NzSpinModule
  ],
  exports: [
    LayoutComponent
  ],
  providers: [
    MenuService,
    LayoutService
  ]
})
export class LayoutModule {
}
