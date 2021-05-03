import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { ActivatedRoute, ActivationEnd, NavigationEnd, Router } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd';
import { ContentClient } from '../client/api_contentclient';
import { GeneralClient } from '../client/api_generalclient';
import { InputAddEditForContent, PageInfo, TableOutputReportInfo, TableOutputReportInput, TempFileInfoInfoModel } from '../client/index_loginclient';
import Convert from '../framework/convert';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
import { UpLoadFile } from '../framework/upload-file';


interface QueryParam extends TableOutputReportInput {
    pageIndex: number;
}

@Component({
    selector: 'app-mylist',
    templateUrl: './mylist.component.html',
    styleUrls: ['./mylist.component.less']
})
/** mylist component*/
export class MylistComponent {

    /** index ctor */
    constructor(
        private api: ApiClientService,
        private msg: GlobalmsgService,
        private actRouter: ActivatedRoute,
        private nzMessageService: NzMessageService,
        private router: Router) {
        this.actRouter.queryParams.subscribe(T => {
            this.param = $.extend(this.initParam(), T);
            this.param.pageInfo.index = Convert.convertToInt(this.param.pageIndex, 0);
            this.param.status = Convert.convertToInt(this.param.status, 0);

            this.pullData();
        });
    }

    gopers() {
        this.router.navigate(['/app/personalcenter/add'], {
            
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
    cancel(): void {
    }

    goDetails(id) {
        this.router.navigate(['details'], {
            queryParams: {
                fpid: id,
            }
        });
    }
    confirm(id): void {
        this.msg.spin = true;
        this.api.createClient(ContentClient)
            .deleteContent(id)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    let param = $.extend(this.initParam(), this.param);
                    param = $.extend(this.param, { id: id });

                    param.pageIndex = param.pageInfo.index;
                    delete param.pageInfo;
                    this.router.navigate(['/app/personalcenter'], {
                        queryParams: param
                    });
                    //this.param.pageInfo = $.extend(this.initParam(), model.data.page);
                    //this.data = model.data;
                },
                fail => {
                    this.msg.showError(fail);
                });
    }
    param: QueryParam = this.initParam();

    private initParam(): QueryParam {
        return {
            pageIndex: 0,
            pageInfo: {
                index: 0,
                pageSize: 10
            },
            status: 0,
        };
    }

    data: TableOutputReportInfo = {
        reportList: [], page: {}, examineList: []
    };

    private pullData() {
        this.msg.spin = true;
        this.api.createClient(ContentClient)
            .getListPageCreateID(this.param)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.param.pageInfo = $.extend(this.initParam(), model.data.page);
                    this.data = model.data;
                },
                fail => {
                    this.msg.showError(fail);
                });
    }
  

    private jumpUrl() {
        let param = $.extend(this.initParam(), this.param);
        param.pageIndex = param.pageInfo.index;
        delete param.pageInfo;
        this.router.navigate(['/app/personalcenter'], {
            queryParams: param
        });
    }

    getRemoteUrl(url: string) {
        return this.api.getRemoteUrl(url);
    }
    pageChange(page: PageInfo) {
        this.param.pageInfo.index = page.index;
        this.jumpUrl();
    }

    submitForm() {
        this.param.pageInfo.index = 0;
        this.jumpUrl();
    }

    listOfSelection = [
        {
            text: 'Select All Row',
            onSelect: () => {
                this.onAllChecked(true);
            }
        }
    ];
    checked = false;
    indeterminate = false;
    setOfCheckedId = new Set<string>();
    paramForEdit = [];

    onAllChecked(value: boolean): void {
        //this.data.reportList.forEach(item => this.updateCheckedSet(item.coId, value));
        this.refreshCheckedStatus();
    }

    refreshCheckedStatus(): void {
        //this.checked = this.data.reportList.every(item => this.setOfCheckedId.has(item.coId));
        //this.indeterminate = this.data.reportList.some(item => this.setOfCheckedId.has(item.coId)) && !this.checked;
    }

    updateCheckedSet(id: string, checked: boolean): void {
        if (checked) {
            this.setOfCheckedId.add(id);
            this.paramForEdit.push(id);
        } else {
            this.setOfCheckedId.delete(id);
            for (var i = 0; i < this.paramForEdit.length; i++) {
                if (this.paramForEdit[i] == id) {
                    this.paramForEdit.splice(i, 1);
                }
            }
        }
    }

    onItemChecked(id: string, checked: boolean): void {
        this.updateCheckedSet(id, checked);
        this.refreshCheckedStatus();
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
}