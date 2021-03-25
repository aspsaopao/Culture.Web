
/**回调成功传入参数 */
export interface ResolveInfo {
  /**一般返回图片下载全路径 */
  default: string;
}

/**
   * 注册适配器
   * @param editor
   * @param create 创建类对象函数
   */
export function RegAdapter<T extends UploadAdapter>(editor, create: (loader) => T) {
  editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
    // 在这里将URL配置为后端上载脚本
    return create(loader);
  };
}

/** ckeditor5上传适配器 */
export abstract class UploadAdapter {

  constructor(protected loader) {
  }

  /**
   * 上传文件
   * @param resolve 成功回调
   * @param reject 
   */
  protected abstract uploadFile(file: File, resolve: (suc: ResolveInfo) => void, reject: (error: any | string) => void);

  upload() {
    return this.loader.file
      .then((file: File) => new Promise((resolve, reject) => {
        this.uploadFile(file,resolve, reject);
      }));
  }

  /**中止上载过程 */
  abort() {
  }
}
