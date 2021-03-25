import { NgModule } from '@angular/core';
import { NzIconModule, NZ_ICONS } from 'ng-zorro-antd/icon';
import { MinusSquareOutline, PlusSquareOutline } from '@ant-design/icons-angular/icons';
const icons: any = [MinusSquareOutline, PlusSquareOutline];
@NgModule({
  imports: [
    NzIconModule
  ],
  exports: [
    NzIconModule
  ],
  providers: [
    {
      provide: NZ_ICONS,
      useValue: icons
    }
  ]
})
export class NzIconImportModule {
}
