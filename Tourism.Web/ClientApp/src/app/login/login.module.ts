import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IndexComponent } from './index.component';
import { NzGridModule, NzFormModule, NzInputModule, NzButtonModule,NzMenuModule } from 'ng-zorro-antd';
import { FormModule } from '../framework/form.module';
import { RegisterComponent } from './register.component';

@NgModule({
  declarations: [
        IndexComponent,
        RegisterComponent
  ],
  imports: [
    FormModule,
    NzFormModule,
    NzInputModule,
    NzButtonModule,
    NzGridModule,
    NzMenuModule,
    RouterModule.forChild([
      {
        path: '',
        component: IndexComponent,
        },
        {
            path: 'register',
            component: RegisterComponent,

        }
    ])
  ]
})
export class LoginModule {
}
