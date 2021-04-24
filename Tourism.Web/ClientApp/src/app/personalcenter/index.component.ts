import { Component } from '@angular/core';
import { Router } from '@angular/router';


@Component({
    selector: 'app-personalcenter',
    templateUrl: './index.component.html',
    styleUrls: ['./index.component.less']
})
/** details component*/
export class PersonalcenterComponent {
    /** details ctor */
    constructor(
        private route: Router    ) {

    }
    /**资讯标题 */
    title = '';
    textare = '';
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
        localStorage.removeItem('userInfo');
        this.route.navigate(['app/login']);
    }
    /**资讯正文*/
    contentChanged(e){
        this.textare = e.html;
        console.log(this.title,e);
    }
    EditorCreated(e){
        console.log(e);
    }
    isLoadingOne = false;
    /** 发布资讯 */
    loadOne(): void {
        this.isLoadingOne = true;
        setTimeout(() => {
        this.isLoadingOne = false;
        console.log(this.title,this.textare);
        }, 5000);
    }
}
