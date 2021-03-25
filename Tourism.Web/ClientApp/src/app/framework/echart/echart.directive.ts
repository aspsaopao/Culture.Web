import { Directive, ElementRef, AfterViewInit, Input, OnDestroy, HostListener } from '@angular/core';
import * as echarts from "echarts";
import { LayoutDirective } from '../layout/layout.directive';
import { LayoutService } from '../layout/layout.service';
/** echart属性 */
@Directive({
    selector: '[fw-echart]'
})
export class EChartDirective extends LayoutDirective implements AfterViewInit, OnDestroy {

    ngOnDestroy(): void {
        if (this.echarts) {
            this.echarts.clear();
            this.echarts = null;
        }
    }
    ngAfterViewInit(): void {
        if (!this.echarts)
            this.echarts = echarts.init(this.el.nativeElement, this.theme);
        if (this._opts)
            this.echarts.setOption(this._opts);
    }

    @Input()
    theme: string | object;

    private echarts: echarts.ECharts = null;

    private _opts = null;

    @Input()
    public set opts(o: any) {
        if (!this.echarts)
            return;
        if (!o)
            return;
        this._opts = o;
        this.echarts.clear();
        this.echarts.setOption(o);
        this.recv();
    }

    constructor(
        notify: LayoutService,
        private el: ElementRef) {
        super(notify);
    }

    @HostListener('window:resize', ['$event'])
    onResize(event) {
        this.recv();
    }

    protected recv() {
        if (this.echarts)
            this.echarts.resize();
    }
}
