
/**时间转换信息 */
export interface NzTimeConvertInfo {

  /**获取日期 */
  get: () => Date;

  /**设置日期 */
  set: (d: Date) => void;
}

/** nz框架时间转换 */
export class NzTimeConvert {

  /**
   * nz框架时间转换
   * @param opt 选项
   */
  constructor(
    private opt: NzTimeConvertInfo) {
  }

  private _time: Date = null;

  /**获取时间*/
  get time(): Date {
    if (!this._time)
      this._time = this.opt.get();
    return this._time;
  }

  set time(v: Date) {
    this.opt.set(v);
    this._time = v;
  }
}
