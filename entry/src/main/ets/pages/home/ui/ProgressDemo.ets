/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct ProgressDemo{

  @State value:number = 0
  private intervalId:number = -1

  aboutToAppear(): void {
    this.intervalId = setInterval(()=>{
      this.value++
      if(this.value >100){
        clearInterval(this.intervalId)
      }
    }, 100)
  }

  build() {
    Column({space: 10}){
      TitleBar({title: "Progress Demo"})

      Progress({
        value: this.value,           // 设置当前进度
        total: 60,
        type: ProgressType.ScaleRing // 设置进度条的样式为环境样式
      }).style({
        scaleCount: 30,              // 设置环形进度条刻度数量
        scaleWidth: 30               // 设置环形进度条刻度粗细
      })
        .color(Color.Red)
        .size({width: 80, height: 80})

      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Capsule
      }).size({width: 220, height: 50})

      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Eclipse
      }).color(Color.Red)
        .size({width: 80, height: 80})

      //线形
      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Linear
      }).style({strokeWidth: 10})      // 设置进度条线宽
        .size({height: 40})
        .margin({left: 20, right: 20})

      //环形
      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Ring
      }).style({strokeWidth: 10})
        .color(Color.Red)
        .backgroundColor(Color.Grey)
        .size({width: 100, height: 100})


      LoadingProgress()
        .width(120)
        .height(40)
        .color(Color.Pink) // 设置进度条的前景色

      LoadingProgress()
        .width(50)
        .height(50)
        .color(Color.Blue) // 设置进度条的前景色
    }
    .width(FULL_WIDTH)
  }
}