import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IndexComponent } from './index.component';
import { BaseComponent } from './base.component';
import { LayoutModule } from '../framework/layout/layout.module';
import { ContentModule } from '../framework/layout/content/content.module';
import { NzButtonModule, NzSpinModule, NzBreadCrumbModule, NzDividerModule, NzGridModule, NzDatePickerModule, NzTimePickerModule, NzIconModule, NzFormModule } from 'ng-zorro-antd';

import { FormModule } from '../framework/form.module';
import { NgxLoadingModule } from 'ngx-loading';
import { EchartModule } from '../framework/echart/echart.module';
@NgModule({
    declarations: [
        IndexComponent,
        BaseComponent
    ],
    imports: [
        LayoutModule,
        ContentModule,
        NzBreadCrumbModule,
        FormModule,
        CommonModule,
        NzDividerModule,
        NzSpinModule,
        NzButtonModule,
        NgxLoadingModule,
        NzGridModule,
        NzDatePickerModule,
        NzTimePickerModule,
        NzIconModule,
        NzFormModule,
        EchartModule,
        RouterModule.forChild([
            {
                path: '',
                component: BaseComponent,
                children: [
                    {
                        path: 'index',
                        component: IndexComponent
                    },
                    {
                        path: 'report',
                        loadChildren: () => import('../report/report.module').then(m => m.ReportModule)
                    }
                ]
            }
        ])
    ]
})
export class IndexModule {
}
