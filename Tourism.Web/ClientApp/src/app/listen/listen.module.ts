import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListenComponent } from './listen.component';
import { NzGridModule, NzFormModule, NzInputModule, NzButtonModule, NzCollapseModule, NzCarouselModule, NzTabsModule, NzSwitchModule, NzMenuModule    } from 'ng-zorro-antd';
import { FormModule } from '../framework/form.module';
import { WxSmallAppComponent } from './wx-small-app.component';

@NgModule({
    declarations: [
        ListenComponent,
        WxSmallAppComponent, 
    ],
    imports: [
        CommonModule,
        FormModule,
        NzFormModule,
        NzInputModule,
        NzButtonModule,
        NzGridModule,
        NzCarouselModule,
        NzTabsModule ,
        NzCollapseModule,
        NzSwitchModule,
        NzMenuModule ,
        RouterModule.forChild([
            {
                path: '',
                component: ListenComponent
            },
            {
                path: 'wx-small-app',
                component: WxSmallAppComponent
            }
        ])
    ]
})
export class ListenModule {
}
