import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import { LoginClient, ParamForLogin } from '../client/index_loginclient';
import { Router } from '@angular/router';

@Component({
  selector: 'applogin-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.less']
})
/**登录首页*/
export class IndexComponent implements OnInit {
  /** index ctor */
  constructor(
    private msg: GlobalmsgService,
    private api: ApiClientService,
    private fb: FormBuilder,
    private route: Router) {

  }
  ngOnInit(): void {
    this.vailForm = this.fb.group({
      passid: [null, Validators.required],
      password: [null, Validators.required],
      verImage: [null, Validators.required]
    });
  }

  vailForm: FormGroup = null;

  private _verImage = `${this.api.baseUrl}/Index/Login/verImage?${Math.random()}`;

  get verImage(): string {
    return this._verImage;
  }

  flushImage() {
    this._verImage = `${this.api.baseUrl}/Index/Login/verImage?${Math.random()}`;
  }

  param: ParamForLogin = this.initParam();

  private initParam(): ParamForLogin {
    return {
      passId: '',
      passWord: '',
      verCode: ''
    };
  }

  submitForm() {
    for (const i in this.vailForm.controls) {
      this.vailForm.controls[i].markAsDirty();
      this.vailForm.controls[i].updateValueAndValidity();
    }
    if (!this.vailForm.valid)
      return;
    this.msg.loading = true;
    const time = setTimeout(()=>{
        this.msg.loading = false;
        clearTimeout(time);
        this.route.navigate(['index']);
        if(localStorage.getItem('userInfo')){
            localStorage.removeItem('userInfo');
        }
        localStorage.setItem('userInfo', "新手用户");
    },1000);
    // this.api.createClient(LoginClient)
    //   .login(this.param)
    //   .subscribe(
    //     model => {
    //       this.msg.loading = false;
    //       this.route.navigate(['app/index']);
    //     },
    //     err => {
    //       this.flushImage();
    //       this.msg.showError(err);
    //     });
  }
}

