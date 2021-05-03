import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { ContentClient, OutPutContentInfoItem } from '../client/api_contentclient';
import { GeneralClient } from '../client/api_generalclient';
import { IndexClient } from '../client/index_indexclient';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';

export interface QueryParam {
    fpid: string;
}
@Component({
    selector: 'app-details',
    templateUrl: './details.component.html',
    styleUrls: ['./details.component.less']
})
/** details component*/
export class DetailsComponent {
    /** details ctor */
    constructor(
        private domSanitizer: DomSanitizer,
        protected api: ApiClientService,
        protected msg: GlobalmsgService,
        private fb: FormBuilder,
        private actRouter: ActivatedRoute,
        protected router: Router) {
        actRouter.queryParams.subscribe(T => {
            this.param = $.extend(this.initParam(), T);
            this.pullData();
        });
    }

    param: QueryParam = this.initParam();

    protected initParam(): QueryParam {
        return {
            fpid: '',
        };
    }
    getRemoteUrl(url: string) {
        return this.api.getRemoteUrl(url);
    }
    data: OutPutContentInfoItem = this.initData();

    protected initData(): OutPutContentInfoItem {
        return {
            content: '',
            contentId: '',
            createTiem: '',
            headImage: {
                serverDirPath: '',
                localFileName: '',
                remoteFilePath: '',
                serverFileName: '',
            },
            title: '',
        };
    }

    protected pullData() {
        this.msg.spin = true;
        this.api.createClient(IndexClient)
            .getInfo(this.param.fpid)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.data = $.extend(this.initData(), model.data);
                },
                fail => {
                    this.msg.showError(fail);
                });
    }

    userName = localStorage.getItem('userInfo') ? localStorage.getItem('userInfo') : "登录"

    onBack(): void {
        console.log('onBack');
    }
    login() {
        if (this.userName !== "登录") {
            return;
        } else {
            this.router.navigate(['app/login']);
        }
    }
    goPersonalCenter() {
        this.router.navigate(['app/personalcenter']);
    }
    output() {
        this.msg.loading = true;
        this.api.createClient(GeneralClient)
            .loginOut()
            .subscribe(
                model => {
                    localStorage.removeItem('userInfo');
                    this.msg.loading = false;
                    this.router.navigate(['index']);
                },
                e => {
                    this.msg.showError(e);
                });
    }
}