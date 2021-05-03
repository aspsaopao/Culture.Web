import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import { LoginClient, ParamForLogin } from '../client/index_loginclient';
import { Router } from '@angular/router';

@Component({
    selector: 'applogin-register',
    templateUrl: './register.component.html',
    styleUrls: ['./register.component.less']
})
/**登录首页*/
export class RegisterComponent implements OnInit {
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
            verImage: [null, Validators.required],
            name: [null, Validators.required]
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
            name:'',
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

        this.api.createClient(LoginClient)
            .register(this.param)
            .subscribe(
                model => {
                    //this.msg.loading = false;
                    //if (localStorage.getItem('userInfo')) {
                    //    localStorage.removeItem('userInfo');
                    //}
                    //localStorage.setItem('userInfo', model.data.name);
                    this.route.navigate(['app/login']);
                },
                err => {
                    this.flushImage();
                    this.msg.showError(err);
                });

    }

    login() {
            this.route.navigate(['app/login']);
        }
}

