import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
/**表单模块 */
@NgModule({
  exports: [
    FormsModule,
    ReactiveFormsModule
  ]
})
export class FormModule {
}
