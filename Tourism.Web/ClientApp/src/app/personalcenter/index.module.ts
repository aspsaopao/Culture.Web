import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NzGridModule, NzFormModule, NzInputModule, NzButtonModule, NzCollapseModule, NzCarouselModule, NzTabsModule, NzSwitchModule, NzMenuModule, NzUploadModule} from 'ng-zorro-antd';
import { FormModule } from '../framework/form.module';
import { PersonalcenterComponent } from './index.component';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzPageHeaderModule } from 'ng-zorro-antd/page-header';
import { NzBreadCrumbModule } from 'ng-zorro-antd/breadcrumb';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { QuillModule } from 'ngx-quill'; 
import { NzPopconfirmModule, NzSelectModule, NzTableModule, NzTagModule } from 'ng-zorro-antd';
import { ContentModule } from '../framework/layout/content/content.module';
import { PaginationModule } from '../framework/pagination/pagination.module';
import { NzSpaceModule } from 'ng-zorro-antd/space';
import { NzIconImportModule } from '../framework/nz-icon-import.module';
import { MylistComponent } from './mylist.component';
@NgModule({
    declarations: [
        PersonalcenterComponent,
        MylistComponent,
    ],
    imports: [
        NzTagModule,
        NzIconImportModule,
        NzSpaceModule,
        PaginationModule,
        NzTableModule,
        NzSelectModule,
        NzPopconfirmModule,
        ContentModule,
        NzUploadModule,
        CommonModule,
        FormModule,
        NzFormModule,
        NzInputModule,
        NzButtonModule,
        NzGridModule,
        NzCarouselModule,
        NzTabsModule,
        NzCollapseModule,
        NzSwitchModule,
        NzMenuModule,
        NzLayoutModule,
        NzPageHeaderModule,
        NzBreadCrumbModule,
        NzIconModule,
        QuillModule.forRoot(),
        RouterModule.forChild([
            {
                path: '',
                component: MylistComponent
            },
            {
                path: 'add',
                component: PersonalcenterComponent
            },
        ])
    ],
})
export class PersonalcenterModule {
}
