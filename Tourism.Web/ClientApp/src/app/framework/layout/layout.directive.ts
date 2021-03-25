import { OnInit, OnDestroy, Directive, Output, EventEmitter } from '@angular/core';
import { Subscription } from 'rxjs';
import { LayoutService } from './layout.service';

@Directive({
  selector: '[fw-layout]'
})
export class LayoutDirective implements OnInit, OnDestroy {

  constructor(
    private notify: LayoutService) {
  }

  private notifyrev: Subscription = null;
    ngOnDestroy(): void {
      if (this.notifyrev) {
        this.notifyrev.unsubscribe();
        this.notifyrev = null;
      }
    }
    ngOnInit(): void {
      if (!this.notifyrev) {
        this.notifyrev = this.notify.subscribe(() => {
          this.recv();
          this.transitionEnd.emit();
        });
      }
  }

  @Output()
  transitionEnd: EventEmitter<any> = new EventEmitter();

  protected recv() {
  }
}
