import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct BadgeDemo {
  @State counts: number = 1
  @State message: string = 'new'

  build() {
    Column() {

      TitleBar({title: "Badge Demo"})

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Badge({
          count: this.counts,
          maxCount: 99,
          style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
        }) {
          Button('message')
            .onClick(() => {
              this.counts++
            })
            .width(100)
            .height(50)
            .backgroundColor(0x317aff)
        }

        Badge({
          value: this.message,
          style: { color: 0xFFFFFF, fontSize: 9, badgeSize: 20, badgeColor: Color.Blue }
        }) {
          Text('msg')
            .width(80)
            .height(50)
            .fontSize(18)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Pink)
        }


        Badge({
          value: '',
          position: BadgePosition.RightTop,
          style: { badgeSize: 12, badgeColor: Color.Red }
        }) {
          Text('msg')
            .width(90)
            .height(50)
            .fontSize(18)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Pink)
        }
      }
      .width('100%')
      .margin({ top: 10, bottom: 25 })


      Counter(){
        Row({space: 18}){
          Text(this.counts.toString()).fontSize(18)
          Text(this.counts.toString()).fontSize(18)
        }
      }
      .onInc(()=>{
        this.counts++
      })
      .onDec(()=>{
        this.counts--
      })
      .width(200)
      .margin(20)


      Counter(){
        Text(this.counts.toString()).fontSize(18).fontColor(Color.Red)
      }
      .onInc(()=>{
        this.counts++
      })
      .onDec(()=>{
        this.counts--
      })
      .width(130)

    }
    .width('100%')
  }
}