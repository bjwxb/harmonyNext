import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct SlideDemo {
  @State message: string = 'Hello World'

  @State currentValue:number = 0

  build() {
    Column() {
      TitleBar({title: " Slide Demo"})

      Text(`current value = ${this.currentValue.toFixed(0)}`)
        .height(50)

      Slider({min: 0, max: 100, value: 10, step: 10})
        .width('80%')
        .height(30)
        .blockColor(Color.Red)
        .showSteps(true)//显示刻度
        .showTips(true)//显示进度tip
        .margin({top: 30, bottom: 30})
        .onChange((number)=>{
          this.currentValue = number
        })

      Slider({min: 0, max: 100, value: 50, step: 1})
        .width('80%')
        .height(30)
        .backgroundColor($r('app.color.main_bg_color'))
        .blockColor(Color.Blue) //圆球颜色
        .trackColor(Color.Pink) //轨道默认颜色
        .selectedColor(Color.Red) //已经划过的轨道颜色
        .trackThickness(5)//圆球大小
        .padding({left: 10, right: 10})
        .margin({top: 30, bottom: 30})
        .onChange((value)=>{
          this.currentValue = value.valueOf()
        })

      Slider({min: 0, max: 100, value: 50, step: 10, style: SliderStyle.InSet})
        .width('80%')
        .height(30)
        .backgroundColor($r('app.color.main_bg_color'))
        .blockColor(Color.Red) //圆球颜色
        .trackColor(Color.Pink) //轨道默认颜色
        .selectedColor(Color.Red) //已经划过的轨道颜色
        .trackThickness(5)//圆球大小
        .padding({left: 10, right: 10})
        .margin({top: 30, bottom: 30})
        .onChange((value)=>{
          this.currentValue = value.valueOf()
        })

      Row(){
        Slider({min: 0, max: 100, value: 50, direction:Axis.Vertical})
          .width(30)
          .height(230)
          .backgroundColor($r('app.color.main_bg_color'))
          .blockColor(Color.Blue) //圆球颜色
          .trackColor(Color.Pink) //轨道默认颜色
          .selectedColor(Color.Red) //已经划过的轨道颜色
          .trackThickness(5)//圆球大小
          .padding({left: 10, right: 10})
          .margin({top: 30, bottom: 30})
          .onChange((value)=>{
            this.currentValue = value.valueOf()
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}