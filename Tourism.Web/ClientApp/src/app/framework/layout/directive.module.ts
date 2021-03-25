import { NgModule } from '@angular/core';
import { LayoutDirective } from './layout.directive';

@NgModule({
  declarations: [
    LayoutDirective
  ],
  exports: [
    LayoutDirective
  ]
})
export class DirectiveModule {
}
