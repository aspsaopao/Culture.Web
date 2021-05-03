import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { ContentClient } from '../client/api_contentclient';
import { GeneralClient } from '../client/api_generalclient';
import { InputAddEditForContent, TempFileInfoInfoModel } from '../client/index_loginclient';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import { UpLoadFile } from '../framework/upload-file';


@Component({
    selector: 'app-personalcenter',
    templateUrl: './index.component.html',
    styleUrls: ['./index.component.less']
})
/** details component*/
export class PersonalcenterComponent {
    /** details ctor */
    constructor(
        private domSanitizer: DomSanitizer,
        protected api: ApiClientService,
        protected msg: GlobalmsgService,
        private fb: FormBuilder,
        private actRouter: ActivatedRoute,
        private route: Router    ) {

    }

    inputmodel: InputAddEditForContent = {
        aid: '',
        details: '',
        headImage: {
            localFileName: '',
            remoteFilePath: '',
            serverDirPath: '',
            serverFileName:''
        },
        title:''
    }
 
    userName = localStorage.getItem('userInfo')?localStorage.getItem('userInfo'):"登录"
    login() {
        if(this.userName!=="登录"){
            return;
        }else {
            this.route.navigate(['app/login']);
        }
    }
    goPersonalCenter() {
        this.route.navigate(['app/personalcenter']);
    }
    output() {
        this.msg.loading = true;
        this.api.createClient(GeneralClient)
            .loginOut()
            .subscribe(
                model => {
                    localStorage.removeItem('userInfo');
                    this.msg.loading = false;
                    this.route.navigate(['index']);
                },
                e => {
                    this.msg.showError(e);
                });
    }
    /**资讯正文*/
    contentChanged(e) {
        this.inputmodel.details = e.html;
    }
    EditorCreated(e){
        console.log(e);
    }
    isLoadingOne = false;
    /** 发布资讯 */
    loadOne(): void {
      
        this.msg.spin = true;
        this.api.createClient(ContentClient)
            .editActivity(this.inputmodel)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.jumpUrl();
                },
                fail => {
                    this.msg.showError(fail);
                });
    }
    /** 跳转url */
    protected jumpUrl() {
        this.route.navigate(['index'], {
            queryParams: {
            }
        });
    }

    modulesForDataIduploadFile = new UpLoadFile<TempFileInfoInfoModel>({
        customCallBack: (ins, item) => {
            let client = this.api.createClient(ContentClient);
            client.isUpload = true;
            return client.uploadForActivityTempFile({
                fileName: item.file.name,
                data: item.file
            });
        },
        sucCallBack: (ins, model, item) => {
            this.inputmodel.headImage = model.data;
        },
        failCallBack: (ins, err) => {
            this.msg.showError(err);
        }
    });


    getRemoteUrl(url: string) {
        return this.api.getRemoteUrl(url);
    }
}
