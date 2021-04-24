import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { ServiceModule } from './framework/service/service.module';
import { GlobalmsgService } from './framework/service/globalmsg.service';
import { RouterModule } from '@angular/router';
import { QuillModule } from 'ngx-quill'
@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    ServiceModule,
    BrowserModule,
    BrowserAnimationsModule,
    QuillModule.forRoot(),
    RouterModule.forRoot([
      {
        path: '',
        redirectTo: 'index',
        pathMatch: 'full'
      },
      {
        path: 'app/login',
        loadChildren: () => import('./login/login.module').then(m => m.LoginModule)
      },
      {
        path: 'app',
        loadChildren: () => import('./index/index.module').then(m => m.IndexModule)
      },
      {
        path: 'index',
        loadChildren: () => import('./listen/listen.module').then(m => m.ListenModule)
      },
      {
        path: 'details',
        loadChildren: () => import('./details/details.module').then(m => m.DetailsModule)
      },
      {
        path: 'app/personalcenter',
        loadChildren: () => import('./personalcenter/index.module').then(m => m.PersonalcenterModule)
      },
      //{
      //  path: 'question',
      //  loadchildren: () => import('./question/question.module').then(m => m.questionmodule)
      //}
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
  public constructor(
    msg: GlobalmsgService) {
    msg.jumplogin = '/app/login';
  }
}
