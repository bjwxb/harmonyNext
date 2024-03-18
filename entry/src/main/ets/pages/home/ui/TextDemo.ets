/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'
import { window } from '@kit.ArkUI'
import logService from '../../../common/utils/LogService'
import toast from '../../../common/utils/Toast'

@Entry
@Component
struct TextDemo{

  @State startMarquee:boolean = false

  onPageShow(): void {
  }

  onPageHide(): void {
  }

  build() {
    Column(){
      TitleBar({title: "Text Demo"})

      Text('普通默认文字').lineHeight(30)

      Text('加粗文字').fontWeight(FontWeight.Bold).lineHeight(30)

      Text('倾斜文字').fontStyle(FontStyle.Italic).lineHeight(30)

      Text('文字背景颜色')
        .fontColor(Color.White)
        .backgroundColor(Color.Blue)
        .padding({left: 8, right: 8})
        .width("50%")
        .textAlign(TextAlign.Center)
        .margin({top: 10})

      Text('文字圆角背景')
        .height(40)
        .padding({left: 10 , right: 10})
        .border({width: 1, color: Color.Red, radius: 8})
        .margin({top: 10})

      Text('圆')
        .backgroundColor(Color.Red)
        .width(40)
        .height(40)
        .fontColor(Color.White)
        .borderRadius(40)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .margin({top: 10, bottom: 10})

      Text('下划线文字')
        .decoration({type: TextDecorationType.Underline, color: Color.Red})
        .height(30)
        .fontColor(Color.Red)

      Text('删除线文字')
        .decoration({type: TextDecorationType.LineThrough, color: Color.Gray})
        .fontColor(Color.Red)
        .height(30)

      Text('文字内容过多一行显示 省略号 文字内容过多一行显示文字内容过多一行显示')
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
        .maxLines(1)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .width('80%')

      Text('文字内容过多一行显示 截取 文字内容过多一行显示文字内容过多一行显示')
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .maxLines(1)
        .margin({top: 10})
        .textOverflow({overflow: TextOverflow.Clip})
        .width('80%')

      Text('文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示')
        .margin({top: 10})
        .width('80%')
        .fontSize(16)
        .lineHeight(24)
        .fontColor(Color.Red)
        .backgroundColor(Color.Gray)

      Text(){
        Span('hah')
        Span('hello span').decoration({type: TextDecorationType.Underline, color: Color.Red })
        Span('July').fontColor(Color.Red).fontSize(18).onClick(() =>{
          toast.show("July")
        }).height(20)
        Span('world')
      }

      //用于滚动展示一段单行文本，仅当文本内容宽度超过跑马灯组件宽度时滚动
      Marquee({
        start: this.startMarquee,
        step: 5,
        fromStart: true,
        loop: 100,
        src: "Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!"
      }).width("60%")
        .height(30)
        .backgroundColor(Color.Pink)
        .margin({ top: 10 })
        .onStart(() => {
          logService.d('Marquee animation complete onStart')
        })
        .onBounce(() => {
          logService.d('Marquee animation complete onBounce')
        })
        .onFinish(() => {
          logService.d('Marquee animation complete onFinish')
        })

      Button('Marquee Start')
        .onClick(() => {
          this.startMarquee = !this.startMarquee
        })
        .height(40)
        .fontSize(16)
        .margin({ top: 10 })
        .backgroundColor('#007DFF')
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }


}