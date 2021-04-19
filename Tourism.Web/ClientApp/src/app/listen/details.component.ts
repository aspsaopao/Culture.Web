import { Component } from '@angular/core';


@Component({
    selector: 'app-details',
    templateUrl: './details.component.html',
    styleUrls: ['./details.component.less']
})
/** details component*/
export class DetailsComponent {
    /** details ctor */
    constructor() {

    }
    onBack(): void {
        console.log('onBack');
    }
}