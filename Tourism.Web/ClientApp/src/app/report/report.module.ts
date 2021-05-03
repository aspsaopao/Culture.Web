import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NzBreadCrumbModule, NzButtonModule, NzFormModule, NzInputModule, NzPopconfirmModule, NzSelectModule, NzTableModule, NzTagModule, NzUploadModule } from 'ng-zorro-antd';
import { FormModule } from '../framework/form.module';
import { ContentModule } from '../framework/layout/content/content.module';
import { PaginationModule } from '../framework/pagination/pagination.module';
import { EditComponent } from './edit.component';
import { IndexComponent } from './index.component';
import { NzSpaceModule } from 'ng-zorro-antd/space';
import { NzIconImportModule } from '../framework/nz-icon-import.module';

@NgModule({
  declarations: [
    IndexComponent,
    EditComponent,
  ],
  imports: [
    NzSelectModule,
    NzIconImportModule,
    NzFormModule,
    NzButtonModule,
    NzInputModule,
    CommonModule,
    ContentModule,
    FormModule,
    NzTableModule,
    PaginationModule,
    NzBreadCrumbModule,
    NzTagModule,
    NzSpaceModule,
    NzPopconfirmModule,
    NzUploadModule,
    RouterModule.forChild([
      {
        path: '',
        component: IndexComponent
      },
      {
        path: 'edit',
        component: EditComponent
      }
    ])
  ]
})
export class ReportModule {
}
