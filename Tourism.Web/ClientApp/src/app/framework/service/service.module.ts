import { NgModule } from '@angular/core';
import { ProgressService } from './progress.service';
import { RouterModule } from '@angular/router';
import { GlobalmsgService } from './globalmsg.service';
import { HttpClientModule } from '@angular/common/http';
import { ApiClientService } from './apiclient.service';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { LoginService } from './login.service';
@NgModule({
  imports: [
    RouterModule,
    HttpClientModule,
    NzMessageModule
  ],
  providers: [
    ProgressService,
    GlobalmsgService,
    ApiClientService,
    LoginService
  ]
})
export class ServiceModule {
  public constructor(private pro: ProgressService) {
  }
}
