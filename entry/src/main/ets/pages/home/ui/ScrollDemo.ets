import { FULL_WIDTH } from '../../../common/constants/CommonConstant';
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct ScrollDemo {
  private scroller:Scroller = new Scroller()
  private scrollDistance: number = 0;
  private items: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];


  build() {
    Column() {
      TitleBar({title: "Scroll Demo"})

      Scroll(this.scroller){
        Column(){
          ForEach(this.items, (item:number)=>{
            Text(`item ${item}`)
              .fontSize(26)
              .width('90%')
              .height(120)
              .borderRadius(5)
              .padding(20)
              .backgroundColor(Color.White)
              .margin({top: 10})
          })
        }
      }
      .layoutWeight(1)
      .width(FULL_WIDTH)
      .scrollable(ScrollDirection.Vertical)    // 设置竖直方向滚动
      .scrollBarColor(Color.Yellow)             // 设置滚动条颜色
      .scrollBarWidth(10)                      // 设置滚动条宽度
      .scrollBar(BarState.On)                  // 设置滚动条永久显示
      .align(Alignment.Top)
      .backgroundColor(Color.Pink)


      Scroll(){
        Row({space: 10}){
          ForEach(this.items, (item:number)=>{
            Text(`item ${item}`)
              .fontSize(26)
              .width("80%")
              .height(120)
              .borderRadius(5)
              .padding(10)
              .backgroundColor(Color.White)
              .margin({top: 10})
          })
        }
      }
      .height(180)
      .scrollable(ScrollDirection.Horizontal)    // 设置竖直方向滚动
      .scrollBar(BarState.Off)
      .align(Alignment.Center)
      .backgroundColor(Color.Pink)


      Flex({direction: FlexDirection.Row, wrap: FlexWrap.NoWrap, justifyContent: FlexAlign.SpaceEvenly}) {
        Button('scrollTo')
          .onClick(() => {
            this.scrollDistance = this.scrollDistance == 0 ? 280 : 0;
            this.scroller.scrollTo({           // 调用scrollTo滚动到具体位置
              xOffset: 180,                    // 竖直方向滚动，该值不起作用
              yOffset: this.scrollDistance,    // 滚动距离
              animation: {                     // 滚动动画
                duration: 1500,
                curve: Curve.Smooth
              }
            })
          })
        Button('scrollEdge')
          .onClick(() => {
            this.scroller.scrollEdge(Edge.End) // 滚动到底部
          })

      }
      .width('100%')
      .margin({top: 10})

    }
    .width('100%')
    .height('100%')
  }
}