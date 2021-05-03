import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { ActivatedRoute, ActivationEnd, NavigationEnd, Router } from '@angular/router';
import { CommClient } from '../client/api_commclient';
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
    ngOnInit() {
        this.router.events.subscribe((event: NavigationEnd) => {
            if (event instanceof ActivationEnd) {// 当导航成功结束时执行
                document.documentElement.scrollTop = 0;
                //document.body.scrollTop.scrollTop = 0;
            }
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
            commList: [],
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

    searchName: string = "";
    search() {
        console.log(this.searchName);
        this.router.navigate(['/index/search'], {
            queryParams: {
                name: this.searchName
            }
        });
    }

    commContent: string = "";
    comm() {
        if (this.commContent.length < 20) {
            this.msg.create("warning", "评论内容必须超过20个字！！！！");
            return;
        }
        if (this.userName == "登录") {
            this.msg.create("warning", "请先从左上角登录");
            return;
        }
            this.msg.spin = true;
            this.api.createClient(CommClient)
                .editComm({ content: this.commContent, contentId: this.param.fpid })
                .subscribe(
                    model => {
                        this.msg.spin = false;
                        this.msg.create("success", "评论成功");
                        this.commContent = "";
                        this.pullData();
                    },
                    fail => {
                        this.msg.showError(fail);
                    });
    }
}