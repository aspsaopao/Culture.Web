import { UploadXHRArgs, UploadFile, UploadFileStatus } from 'ng-zorro-antd';
import { Observable } from 'rxjs';
import { ApiException, ClientEvent } from './clientex';
import Convert from './convert';

export interface UpLoadFileInfo<T> {
  customCallBack: (ins: UpLoadFile<T>, item: UploadXHRArgs) => Observable<T>;
  sucCallBack?: (ins: UpLoadFile<T>, model: T, item: UploadXHRArgs) => void;
  beforeCallBack?: (ins: UpLoadFile<T>, file: UploadFile, fileList: UploadFile[]) => boolean | Observable<boolean>;
  preview?: (ins: UpLoadFile<T>, file: UploadFile, root: UploadFile) => void;
  failCallBack?: (ins: UpLoadFile<T>, err: any, item: UploadXHRArgs) => void;
  remove?: (ins: UpLoadFile<T>, item: UploadFile, root: UploadFile) => boolean | Observable<boolean>;
}

/**该类主要是为了控制nzupload控件 */
export class UpLoadFile<T> {

  /**
   * 
   * @param customCallBack 上传回调
   * @param beforeCallBack 选择文件回调
   * @param sucCallBack 上传成功回调
   * @param status 默认上传状态
   */
  constructor(
    private info: UpLoadFileInfo<T>,
    private status: UploadFileStatus = 'uploading') {
  }

  percent = 0;

  customRequest = (item: UploadXHRArgs) => {
    this.percent = 0;
    return this.info.customCallBack(this, item).subscribe(
      model => {
        if (ClientEvent.isClientEvent(model)) {
          if (model.canSetPercent) {
            this.percent = Convert.convertToInt(model.percent);
            item.onProgress(
              {
                percent: model.percent
              },
              null);
          }
        }
        else {
          this.percent = 0;
          item.onSuccess(model, null, null);
          if (this.info.sucCallBack)
            this.info.sucCallBack(this, model, item);
        }
      },
      err => {
        if (this.info.failCallBack) {
          this.info.failCallBack(this, err, item);
          return;
        }
        if (ApiException.isApiException(err)) {
          item.onError(err.result.message, null);
          return;
        }
        item.onError(err, null);
      });
  };

  /** 绑定文件列表 */
  fileList: UploadFile[] = [];

  remove = (file: UploadFile) => {
    if (this.info.remove) {
      if (file.originFileObj)
        return this.info.remove(this, <any>file.originFileObj, file);
      return this.info.remove(this, file, file);
    }
    return true;
  }

  beforeUpload = (file: UploadFile, fileList: UploadFile[]) => {
    //调整文件状态,否则不显示进度条
    file.status = this.status;
    if (this.info.beforeCallBack)
      return this.info.beforeCallBack(this, file, fileList);
    return true;
  }

  preview = (file: UploadFile) => {
    if (this.info.preview) {
      if (file.originFileObj)
        this.info.preview(this, <any>file.originFileObj, file);
      else
        this.info.preview(this, file, file);
    }
  };
}
