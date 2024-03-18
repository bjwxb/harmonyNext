/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'

@Preview
@Component
export struct ChildComponent{

  @Prop @Watch('onChange') subAge:number
  @Link @Watch('onLinkChange') linkAge:number

  @Consume provideAge:number

  @State @Watch("onSubChange") total:number = 0

  onLinkChange(){
    logService.e(">>> onLinkChange <<<<" + this.linkAge)
  }

  onSubChange(){
    logService.e(">>> onSubChange " + this.total)
  }
  onChange(propName:string){
    logService.e(">>>> watch function onChange <<<<")
    this.total += this.subAge
  }

  build() {
    Column(){
      Row(){
        Text(`>>> ${this.total} child prop age: ${this.subAge} <<<`)
      }
      .width(FULL_WIDTH)
      .height(60)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Grey)
      .onClick(()=>{
        this.subAge = this.subAge + 5
      })

      Row(){
        Text(`>>>child link age: ${this.linkAge} <<<`).fontColor(Color.Red)
      }
      .width(FULL_WIDTH)
      .height(60)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Grey)
      .margin({top: 10})
      .onClick(()=>{
        this.linkAge += 5
      })

      Row(){
        Text(`>>>child consume age: ${this.provideAge} <<<`).fontColor(Color.Blue)
      }
      .width(FULL_WIDTH)
      .height(60)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Gray)
      .margin({top: 10})
      .onClick(()=>{
        this.provideAge += 5
      })
    }
    .height(FULL_HEIGHT)
    .justifyContent(FlexAlign.Center)
  }
}