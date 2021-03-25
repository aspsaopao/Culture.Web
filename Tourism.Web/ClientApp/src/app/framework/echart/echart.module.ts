import { NgModule } from '@angular/core';
import { EChartDirective } from './echart.directive';

@NgModule({
  declarations: [
    EChartDirective
  ],
  exports: [
    EChartDirective
  ]
})
export class EchartModule {
}
