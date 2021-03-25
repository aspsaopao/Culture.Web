
/** 空id */
export const GUIDEMPTY = '00000000-0000-0000-0000-000000000000';

/** 转换 */
export default class Convert {

  /**
* 转换数字
* @param v 要转换的值
* @param def 转换失败的默认值(默认:0)
*/
  static convertToFloat(v: any, def: number = 0) {
    let value = parseFloat(v);
    if (isNaN(value))
      return def;
    return value;
  }

  /**
 * 转换数字
 * @param v 要转换的值
 * @param def 转换失败的默认值(默认:0)
 */
  static convertToInt(v: any, def: number = 0) {
    let value = parseInt(v);
    if (isNaN(value))
      return def;
    return value;
  }

  /**
   * 是否为null
   * @param v
   */
  static isEmpty(v: string) {
    if (!v)
      return true;
    if (v == '')
      return true;
  }

  /**
   * id是否为空
   * @param id
   */
  static isEmptyForId(id: string) {
    if (this.isEmpty(id))
      return true;
    if (id == GUIDEMPTY)
      return true;
    return false;
  }

  /**
   * 裁剪字符串
   * @param v 预裁剪字符串
   * @param len 原始文字最大显示长度
   * @param sufix 后缀
   */
  static cutString(v: string, len: number, sufix = '...') {
    if (!v)
      return '';
    if (v.length > len)
      return `${v.substr(0, len)}${sufix}`;
    return v;
  }
}
