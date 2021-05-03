import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ContentClient, OutPutContentInfoItem, OutPutContentInfoItemInfoModelList } from '../client/api_contentclient';
import { IndexClient } from '../client/index_indexclient';
import { ApiClientService } from '../framework/service/apiclient.service';
import { GlobalmsgService } from '../framework/service/globalmsg.service';


@Component({
    selector: 'app-listen',
    templateUrl: './listen.component.html',
    styleUrls: ['./listen.component.less']
})
/** listen component*/
export class ListenComponent {
    /** listen ctor */
    constructor(
        private route: Router,
        private msg: GlobalmsgService,
        private api: ApiClientService,
        private routeAct: ActivatedRoute,    ) {
        this.routeAct.queryParams.subscribe(T => {
           
            this.pullData();
        });
    }
    getRemoteUrl(url: string) {
        return this.api.getRemoteUrl(url);
    }
    data: OutPutContentInfoItem[] = [];

    pullData() {
        this.msg.spin = true;
        this.api.createClient(IndexClient)
            .getList({ index:0, pageSize: 10 })
            .subscribe(
                model => {
                    this.msg.spin = false;
                    this.data = model.listData;
                },
                fail => {
                    //this.msg.showError(fail);
                });
    }

    userName = localStorage.getItem('userInfo')?localStorage.getItem('userInfo'):"登录"
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
        localStorage.removeItem('userInfo');
        this.route.navigate(['app/login']);
    }
}
