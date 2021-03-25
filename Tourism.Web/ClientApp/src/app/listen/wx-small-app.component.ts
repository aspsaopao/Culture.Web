import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

interface Param {
}

@Component({
  selector: 'applisten-wx-small-app',
  templateUrl: './wx-small-app.component.html',
  styleUrls: ['./wx-small-app.component.less']
})
/** WxSmallApp component*/
export class WxSmallAppComponent implements OnInit, OnDestroy {
  /** WxSmallApp ctor */
  constructor(
    private route: Router,
    private actRoute: ActivatedRoute) {
    this.actRoute.queryParams.subscribe(T => {
      this.param = $.extend(this.initParam(), T);
    });
  }

  private param: Param = this.initParam();

  private initParam(): Param {
    return {
    };
  }

  private scripts: JQuery<HTMLScriptElement> = null;

  ngOnDestroy(): void {
    if (this.scripts) {
      this.scripts.remove();
      this.scripts = null;
    }
  }
  ngOnInit(): void {
    if (this.scripts)
      return;
    this.scripts = $('<script></script>');
    $('head').append(this.scripts);
    this.scripts.attr('src', 'https://res2.wx.qq.com/open/js/jweixin-1.3.2.js');
  }

  close() {
    if (!wx)
      return;
    if (!wx.miniProgram)
      return;
    wx.miniProgram.navigateBack(this.param);
  }
}
