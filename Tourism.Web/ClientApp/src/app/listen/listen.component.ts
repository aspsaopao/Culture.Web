import { Component } from '@angular/core';


@Component({
    selector: 'app-listen',
    templateUrl: './listen.component.html',
    styleUrls: ['./listen.component.less']
})
/** listen component*/
export class ListenComponent {
    /** listen ctor */
    constructor() {

    }
    list: any[] = [1, 2, 3, 4];
}
