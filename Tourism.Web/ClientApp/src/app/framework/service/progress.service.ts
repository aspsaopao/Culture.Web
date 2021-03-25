import { Injectable, OnDestroy } from '@angular/core';

import np from 'nprogress';
import { Subscription } from 'rxjs';
import { RouteConfigLoadStart, RouteConfigLoadEnd, Router } from '@angular/router';

@Injectable()
export class ProgressService implements OnDestroy {

  ngOnDestroy(): void {
    if (this.subscription) {
      this.subscription.unsubscribe();
      this.subscription = null;
    }
  }

  private subscription: Subscription = null;

  public constructor(private router: Router) {
    np.configure({ ease: 'ease', speed: 500 });
    this.subscription = this.router.events.subscribe(
      event => {
        if (event instanceof RouteConfigLoadStart) {
          np.start();
        }
        if (event instanceof RouteConfigLoadEnd) {
          np.done();
        }
      });
  }
}
