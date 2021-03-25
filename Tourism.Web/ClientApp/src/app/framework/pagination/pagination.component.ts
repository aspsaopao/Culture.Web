import { Component, Input, Output, EventEmitter } from '@angular/core';
import Convert from '../convert';

export interface PageInfo {
  count?: number | undefined;
  index?: number | undefined;
  pageSize?: number | undefined;
  readonly pageCount?: number | undefined;
}

/**分页组件 */
@Component({
  selector: 'ap-pagination',
  templateUrl: './pagination.component.html',
  styleUrls: ['./pagination.component.less']
})
export class PaginationComponent {
  constructor() {

  }

  private _page: PageInfo = this.initPageInfo();

  private initPageInfo(): PageInfo {
    return {
      pageSize: 0,
      count: 0,
      index: 0,
      pageCount: 0
    };
  }

  @Input()
  set page(p: PageInfo) {
    if (p) {
      this._page = {
        count: p.count == undefined ? 0 : Convert.convertToInt(p.count),
        pageSize: p.pageSize == undefined ? 0 : Convert.convertToInt(p.pageSize),
        index: p.index == undefined ? 1 : Convert.convertToInt(p.index) + 1,
        pageCount: p.pageCount == undefined ? 0 : Convert.convertToInt(p.pageCount)
      };
    }
  }

  get page(): PageInfo {
    return this._page;
  }

  @Output()
  pageChange: EventEmitter<PageInfo> = new EventEmitter();

  pageIndex(num: number) {
    this._page.index = num;
    if (this._page.count == 0)
      return;
    let pageInfo: PageInfo = {
      pageCount: this._page.pageCount,
      pageSize: this._page.pageSize,
      count: this._page.count,
      index: num > 0 ? num - 1 : 0
    };
    this.pageChange.emit(pageInfo);
  }
}
