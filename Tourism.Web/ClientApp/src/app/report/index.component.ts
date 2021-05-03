import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ContentClient, PageInfo, TableOutputReportInfo, TableOutputReportInput } from '../client/api_contentclient';
import Convert from '../framework/convert';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';


interface QueryParam extends TableOutputReportInput {
    pageIndex: number;
}
@Component({
    selector: 'appreport-report',
    templateUrl: './index.component.html',
    styleUrls: ['./index.component.less']
})
/** clock component*/

export class IndexComponent {
    /** index ctor */
    constructor(
        private api: ApiClientService,
        private msg: GlobalmsgService,
        private actRouter: ActivatedRoute,
        private router: Router) {
        this.actRouter.queryParams.subscribe(T => {
            this.param = $.extend(this.initParam(), T);
            this.param.pageInfo.index = Convert.convertToInt(this.param.pageIndex, 0);
            this.param.status = Convert.convertToInt(this.param.status, 0);

            this.pullData();
        });
    }

    param: QueryParam = this.initParam();

    private initParam(): QueryParam {
        return {
            pageIndex: 0,
            pageInfo: {
                index: 0,
                pageSize: 15
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
            .getList(this.param)
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

    edit(id: string) {
        this.router.navigate(['/app/report/edit'], {
            queryParams: {
                coid: id,
                nowPage: this.param.pageInfo.index,
                status: this.param.status,
            }
        });
    }


    private jumpUrl() {
        let param = $.extend(this.initParam(), this.param);
        param.pageIndex = param.pageInfo.index;
        delete param.pageInfo;
        this.router.navigate(['/app/report'], {
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
}
