import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct QRCodeDemo {
  @State message: string = 'Hello qr code World'

  build() {
    Column() {
      TitleBar({title: "QRCode Demo"})

      QRCode("Hello World!")
        .width(100)
        .height(100)
        .margin({top: 30})

      QRCode("Hello World!")
        .width(100)
        .height(100)
        .color(Color.Red)
        .margin({top: 30})

      QRCode("Hello World!")
        .width(100)
        .height(100)
        .color(Color.Red)
        .backgroundColor(Color.Blue)
        .border({
          width: 4,
          color: Color.Pink
        })
        .margin({top: 30})
    }
    .width('100%')
  }
}