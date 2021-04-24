import { Component } from '@angular/core';
import { Router } from '@angular/router';


@Component({
    selector: 'app-details',
    templateUrl: './details.component.html',
    styleUrls: ['./details.component.less']
})
/** details component*/
export class DetailsComponent {
    /** details ctor */
    constructor(
        private route: Router    ) {

    }
    list: any[] = [1, 2, 3, 4];
    userName = localStorage.getItem('userInfo')?localStorage.getItem('userInfo'):"登录"
    /**查看详情 */
    goDetails() {
        this.route.navigate(['details']);
    }
    login() {
        console.log(this.userName);
        if(this.userName !=="登录"){
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
