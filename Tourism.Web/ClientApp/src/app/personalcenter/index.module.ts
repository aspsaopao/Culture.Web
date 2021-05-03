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

@NgModule({
    declarations: [
        PersonalcenterComponent,
    ],
    imports: [
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
                component: PersonalcenterComponent
            },
        ])
    ],
})
export class PersonalcenterModule {
}
