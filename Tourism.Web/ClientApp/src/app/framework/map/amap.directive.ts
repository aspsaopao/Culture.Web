import { Input, OnDestroy, ElementRef, ViewChild, Directive, OnInit, Output, EventEmitter, OnChanges, SimpleChanges } from '@angular/core';
import Convert from '../convert';

export interface AMapEventArgs<T> {
  map: AMap.Map;
  data: T;
}

@Directive({
  selector: '[fwmap-amap]'
})
/** AMap component*/
export class AmapDirective implements OnDestroy, OnInit {
  /** AMap ctor */
  constructor(private el: ElementRef) {
  }

  private initCreateMap() {
    if (typeof (AMap) == 'undefined') {
      let onload = this.script.onload as Function;
      this.script.onload = () => {
        if (onload)
          onload();
        this.createMap();
      };
    }
    else
      this.createMap();
  }

  ngOnInit(): void {
    if (document.getElementById('___amap_load___')) {
      this.script = document.getElementById('___amap_load___') as HTMLScriptElement;
      this.initCreateMap();
      return;
    }
    this.script = document.createElement('script');
    this.script.id = '___amap_load___';
    if (Convert.isEmpty(this.plugin))
      this.script.src = `https://webapi.amap.com/maps?v=1.4.15&key=${this.key}`;
    else
      this.script.src = `https://webapi.amap.com/maps?v=1.4.15&key=${this.key}&plugin=${this.plugin}`;
    document.head.append(this.script);
    this.initCreateMap();
  }

  ngOnDestroy(): void {
    if (this.amap) {
      this.amap.destroy();
      this.amap = null;
    }
  }

  private createMap() {
    if (this.options)
      this.amap = new AMap.Map(this.el.nativeElement, this.options);
    else
      this.amap = new AMap.Map(this.el.nativeElement);
    this.created.emit(this.amap);
    this.pushMap.emit({
      map: this.amap,
      data: this._data
    });
  }

  private amap: AMap.Map = null;
  private script: HTMLScriptElement = null;

  @ViewChild('container', {
    static: true
  })
  container: ElementRef<HTMLDivElement>;

  @Input()
  key: string;

  private _data = null;

  @Input()
  get data(): any {
    return this._data;
  }

  set data(v: any) {
    this._data = v;
    if (!this.amap)
      return;
    this.pushMap.emit({
      map: this.amap,
      data: this._data
    });
  }

  private _options: AMap.Map.Options = null;

  @Input()
  get options(): AMap.Map.Options {
    return this._options;
  }

  set options(v: AMap.Map.Options) {
    this._options = v;
    if (this.amap) {
      this.amap.destroy();
      this.createMap();
    }
  }

  @Input()
  plugin: string = '';

  @Output()
  created: EventEmitter<AMap.Map> = new EventEmitter<AMap.Map>();

  @Output()
  pushMap: EventEmitter<AMapEventArgs<any>> = new EventEmitter<AMapEventArgs<any>>();
}
