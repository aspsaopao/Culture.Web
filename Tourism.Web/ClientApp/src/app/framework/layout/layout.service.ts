import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable()
export class LayoutService {
  notify: Subject<any> = null;
  constructor() {
    this.notify = new Subject();
  }

  /**
 * 订阅
 * @param next
 * @param error
 * @param complete
 */
  subscribe(next?: () => void, error?: () => void, complete?: () => void) {
    return this.notify.subscribe(next, error, complete);
  }

  /**通知 */
  notifySrc() {
    this.notify.next();
  }
}
