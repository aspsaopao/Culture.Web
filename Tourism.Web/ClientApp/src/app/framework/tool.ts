import { FormGroup } from '@angular/forms';

/**工具 */
export class Tool {

  /**
   * 验证表单
   * @param validateForm 表单验证对象
   */
  static validForForm(validateForm: FormGroup) {
    if (!validateForm)
      return false;
    for (let i in validateForm.controls) {
      validateForm.controls[i].markAsDirty();
      validateForm.controls[i].updateValueAndValidity();
    }
    return validateForm.valid;
  }
}
