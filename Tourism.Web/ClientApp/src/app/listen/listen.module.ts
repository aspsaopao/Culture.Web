import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListenComponent } from './listen.component';
import { NzGridModule, NzFormModule, NzInputModule, NzButtonModule, NzCollapseModule, NzCarouselModule, NzTabsModule, NzSwitchModule, NzMenuModule } from 'ng-zorro-antd';
import { FormModule } from '../framework/form.module';
import { WxSmallAppComponent } from './wx-small-app.component';
import { DetailsComponent } from './details.component';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzPageHeaderModule } from 'ng-zorro-antd/page-header';
import { NzBreadCrumbModule } from 'ng-zorro-antd/breadcrumb';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { SearchComponent } from './search.component';

@NgModule({
    declarations: [
        ListenComponent,
        WxSmallAppComponent,
        DetailsComponent,
        SearchComponent,
    ],
    imports: [
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
        RouterModule.forChild([
            {
                path: '',
                component: ListenComponent
            },
            {
                path: 'details',
                component: DetailsComponent
            },
            {
                path: 'search',
                component: SearchComponent
            }
        ])
    ]
})
export class ListenModule {
}
