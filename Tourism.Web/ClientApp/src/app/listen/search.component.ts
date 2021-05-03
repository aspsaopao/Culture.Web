import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { GeneralClient, OutPutContentInfoItem } from '../client/api_generalclient';
import { IndexClient } from '../client/index_indexclient';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';
export interface QueryParam {
    name: string;
}
@Component({
    selector: 'app-search',
    templateUrl: './search.component.html',
    styleUrls: ['./search.component.less']
})
/** search component*/
export class SearchComponent {
    /** listen ctor */
    constructor(
        private route: Router,
        private msg: GlobalmsgService,
        private api: ApiClientService,
        private routeAct: ActivatedRoute,) {
        this.routeAct.queryParams.subscribe(T => {
            this.param = $.extend(this.initParam(), T);
            this.pullData(this.param.name);
        });
    }
    param: QueryParam = this.initParam();

    protected initParam(): QueryParam {
        return {
            name: '',
        };
    }

    getRemoteUrl(url: string) {
        return this.api.getRemoteUrl(url);
    }
    data: OutPutContentInfoItem[] = [];

    pullData(name: string) {
        this.msg.spin = true;
        this.api.createClient(IndexClient)
            .getListPageLikeName(name)
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.data = model.data.reportList;
                },
                fail => {
                    //this.msg.showError(fail);
                });
    }

    userName = localStorage.getItem('userInfo') ? localStorage.getItem('userInfo') : "登录"
    /**查看详情 */
    //goDetails() {
    //    this.route.navigate(['details']);
    //}

    goDetails(id) {
        this.route.navigate(['details'], {
            queryParams: {
                fpid: id,
            }
        });
    }

    go() {
        this.route.navigate(['index/details']);
    }
    login() {
        if (this.userName !== "登录") {
            return;
        } else {
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
                    this.route.navigate(['/app/login']);
                },
                e => {
                    this.msg.showError(e);
                });
    }

    searchName: string = "";
    search() {
        console.log(this.searchName);
        this.route.navigate(['/index/search'], {
            queryParams: {
                name: this.searchName
            }
        });
    }
}