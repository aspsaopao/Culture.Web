import { Component } from '@angular/core';
import { Router } from '@angular/router';


@Component({
    selector: 'app-listen',
    templateUrl: './listen.component.html',
    styleUrls: ['./listen.component.less']
})
/** listen component*/
export class ListenComponent {
    /** listen ctor */
    constructor(
        private route: Router    ) {

    }
    list: any[] = [1, 2, 3, 4];

    go() {
        this.route.navigate(['index/details']);
    }
}
