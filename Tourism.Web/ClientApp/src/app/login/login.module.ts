import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IndexComponent } from './index.component';
import { NzGridModule, NzFormModule, NzInputModule, NzButtonModule } from 'ng-zorro-antd';
import { FormModule } from '../framework/form.module';

@NgModule({
  declarations: [
    IndexComponent
  ],
  imports: [
    FormModule,
    NzFormModule,
    NzInputModule,
    NzButtonModule,
    NzGridModule,
    RouterModule.forChild([
      {
        path: '',
        component: IndexComponent
      }
    ])
  ]
})
export class LoginModule {
}
