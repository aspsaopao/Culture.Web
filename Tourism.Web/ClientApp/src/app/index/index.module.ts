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
                    //{
                    //    path: 'system',
                    //    loadChildren: () => import('../system/system.module').then(m => m.SystemModule)
                    //},
                    //{
                    //    path: 'scenicarea',
                    //    loadChildren: () => import('../scenicarea/scenicarea.module').then(m => m.ScenicareaModule)
                    //},
                    //{
                    //    path: 'knowledge',
                    //    loadChildren: () => import('../knowledge/knowledge.module').then(m => m.KnowledgeModule)
                    //},
                    //{
                    //    path: 'raiders',
                    //    loadChildren: () => import('../raiders/raiders.module').then(m => m.RaidersModule)
                    //},
                    //{
                    //    path: 'location',
                    //    loadChildren: () => import('../location/location.module').then(m => m.LocationModule)
                    //},
                    //{
                    //    path: 'intangible-heritage',
                    //    loadChildren: () => import('../intangible-heritage/intangible-heritage.module').then(m => m.IntangibleHeritageModule)
                    //},
                    //{
                    //    path: 'users',
                    //    loadChildren: () => import('../users/users.module').then(m => m.UsersModule)
                    //}
                    //,
                    //{
                    //    path: 'clock',
                    //    loadChildren: () => import('../clock/clock.module').then(m => m.ClockModule)
                    //},
                    //{
                    //    path: 'eggs',
                    //    loadChildren: () => import('../eggs/eggs.module').then(m => m.EggsModule)
                    //}
                    //,
                    //{
                    //    path: 'tips',
                    //    loadChildren: () => import('../tips/tips.module').then(m => m.TipsModule)
                    //},
                    //{
                    //    path: 'activity',
                    //    loadChildren: () => import('../activity/acticity.module').then(m => m.ActicityModule)
                    //},
                    //{
                    //    path: 'report',
                    //    loadChildren: () => import('../report/report.module').then(m => m.ReportModule)
                    //}
                ]
            }
        ])
    ]
})
export class IndexModule {
}
