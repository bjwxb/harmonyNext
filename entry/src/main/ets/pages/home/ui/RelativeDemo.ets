import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'


@Entry
@Component
struct RelativeDemo {
  @State message: string = 'Hello World'

  build() {
    Column() {
      TitleBar({title: "相对布局Demo"})

      RelativeContainer(){
        Text('text 1')
          .fontColor(Color.Blue)
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
          })
          .backgroundColor(Color.Grey)
          .height(80)
          .width(80)
          .id('tv1')


        Text('text 2')
          .fontColor(Color.Blue)
          .alignRules({
            bottom: {anchor: "__container__", align: VerticalAlign.Bottom},
          })
          .backgroundColor(Color.Grey)
          .height(80)
          .width(80)
          .id('tv2')

        Text('text 3')
          .fontColor(Color.Blue)
          .alignRules({
            bottom: {anchor: "__container__", align: VerticalAlign.Bottom},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .backgroundColor(Color.Grey)
          .textAlign(TextAlign.End)
          .height(80)
          .width(80)
          .id('tv3')

        Text('text 4')
          .fontColor(Color.Blue)
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .backgroundColor(Color.Grey)
          .textAlign(TextAlign.Center)
          .height(80)
          .width(80)
          .visibility(Visibility.Visible)
          .id('tv4')

        Text('text 5')
          .fontColor(Color.Blue)
          .alignRules({
            top: {anchor: "tv1", align: VerticalAlign.Bottom},
            left:{anchor: "tv1", align: HorizontalAlign.End},
            right: {anchor: "tv4", align: HorizontalAlign.Start},
            bottom: {anchor: "tv2", align: VerticalAlign.Top}
          })
          .backgroundColor(Color.Red)
          .textAlign(TextAlign.Center)
          .id('tv5')
      }
      .width("80%")
      .height(300)
      .margin({top: 30})
      .backgroundColor(Color.Pink)

      RelativeContainer(){
        Text("Hello World!")
          .fontColor(Color.Red)
          .alignRules({
            left:{anchor: "__container__", align: HorizontalAlign.Start},
            right:{anchor: "__container__", align: HorizontalAlign.Center},
            top:{anchor: "__container__", align: VerticalAlign.Top},
            bottom:{anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("hah")
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Green)

        Text("Hello World! heh")
          .fontColor(Color.Red)
          .alignRules({
            left:{anchor: "__container__", align: HorizontalAlign.Center},
            right:{anchor: "__container__", align: HorizontalAlign.End},
            top:{anchor: "__container__", align: VerticalAlign.Center},
            bottom:{anchor: "__container__", align: VerticalAlign.Bottom}
          })
          .id("hehe")
          .margin({left: 10, right: 10})
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Yellow)
      }
      .width("90%")
      .height(200)
      .margin(20)
      .backgroundColor(Color.Blue)
    }
    .width('100%')
    .height(FULL_HEIGHT)
  }
}