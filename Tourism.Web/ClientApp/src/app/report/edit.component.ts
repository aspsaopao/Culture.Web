import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { cwd } from 'process';
import { ContentClient, OutPutContentInfoItem } from '../client/api_contentclient';
import { IndexClient } from '../client/index_indexclient';
import Convert from '../framework/convert';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import { UpLoadFile } from '../framework/upload-file';

export interface QueryParam {
    coid: string;
    nowPage: number;
    status: number,
}

@Component({
    selector: 'appreport-edit',
    templateUrl: './edit.component.html',
    styleUrls: ['./edit.component.less']
})
/** edit component*/
export class EditComponent implements OnInit {
    /** edit ctor */
    constructor(
        private domSanitizer: DomSanitizer,
        private route: Router,
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
    ngOnInit(): void {
        this.validateForm = this.fb.group({
            name: [null, Validators.required]
        });
    }

    ///**数据id是否为null*/
    //get isEmptyForId(): boolean {
    //    if (Convert.isEmptyForId(this.data.coId))
    //        return true;
    //    return false; 
    //}

    validateForm: FormGroup;

    param: QueryParam = this.initParam();

    protected initParam(): QueryParam {
        return {
            nowPage: 0,
            coid: '',
            status: 0,
        };
    }

    data: OutPutContentInfoItem = this.initData();

    protected initData(): OutPutContentInfoItem {
        return {
            status: 0,
            contentId: '',
            content: '',
            examineList: [],
            createTiem: '',
            headImage: {
                serverDirPath: '',
                serverFileName: '',
                localFileName: '',
                remoteFilePath:''
            },
            introduce: '',
            ststusName: '',
            title: ''
        };
    }


    getRemoteUrl(url: string) {
        return this.api.getRemoteUrl(url);
    }

    protected pullData() {
        this.msg.spin = true;
        this.api.createClient(ContentClient)
            .getInfo(this.param.coid)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.data = $.extend(this.initData(), model.data);
                },
                fail => {
                    this.msg.showError(fail);
                });
    }



    /** 跳转url */
    protected jumpUrl() {
        this.router.navigate(['/app/report'], {
            queryParams: {
                pageIndex: this.param.nowPage,
                status: this.param.status,
            }
        });
    }


    submitForm() {
        this.msg.spin = true;
        this.api.createClient(ContentClient)
            .exaContent(this.data.contentId, this.data.status)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.jumpUrl();
                },
                fail => {
                    this.msg.showError(fail);
                });
        this.jumpUrl();
    }
}
