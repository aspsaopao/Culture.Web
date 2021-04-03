import { AfterViewInit, Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import Convert from '../framework/convert';
import format from 'date-fns/format';
import { registerLocaleData } from '@angular/common';
import zh from '@angular/common/locales/zh';

import { FormGroup, FormBuilder, Validators } from '@angular/forms';


@Component({
  selector: 'appindex-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.less']
})
/** index component*/
export class IndexComponent {
  /** index ctor */
  constructor(
    private api: ApiClientService,
      private msg: GlobalmsgService,
      private fb: FormBuilder,
      private routerAct: ActivatedRoute,
      private router: Router) {

    }
    ngOnInit(): void{
        registerLocaleData(zh);
        this.pullData();
    }
    date: Date[];
    onOk(result: Date[]): void {
        this.date = result;
    }
    validateForm: FormGroup;

    pullData() {
        //this.api.createClient(AppClient)
        //    .pullData(this.param)
        //    .subscribe(
        //        model => {
        //            this.msg.spin = false;
        //            this.data = model.data;
        //            this.setSearchOption();
        //            this.setCountOption();
        //        },
        //        fail => {
        //            this.msg.showError(fail);
        //        });
    }
   
}
