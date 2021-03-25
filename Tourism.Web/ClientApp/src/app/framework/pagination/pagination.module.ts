import { NgModule } from '@angular/core';
import { PaginationComponent } from './pagination.component';
import { NzPaginationModule } from 'ng-zorro-antd/pagination';

@NgModule({
  declarations: [
    PaginationComponent
  ],
  imports: [
    NzPaginationModule
  ],
  exports: [
    PaginationComponent
  ]
})
export class PaginationModule {
}
