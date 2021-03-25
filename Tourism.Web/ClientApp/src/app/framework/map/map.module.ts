import { NgModule } from '@angular/core';
import { AmapDirective } from './amap.directive';

@NgModule({
  declarations: [
    AmapDirective
  ],
  exports: [
    AmapDirective
  ]
})
export class MapModule {
}
