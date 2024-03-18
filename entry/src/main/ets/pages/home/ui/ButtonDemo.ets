/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import toast from '../../../common/utils/Toast'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct ButtonDemo {
  @State handlePopup: boolean = false
  @State customPopup: boolean = false

  build() {

    Column() {
      TitleBar({ title: "Button Demo" })

      Button('默认按钮-默认pop')
        .margin({ top: 10 })
        .onClick(() => {
          logService.e(`>>>> handlePopup = ${this.handlePopup}`)
          console.error(`>>>> handlePopup = ${this.handlePopup}`)
          this.handlePopup = !this.handlePopup
        })
        .bindPopup(this.handlePopup, {
          message: 'this is a popup',
          placementOnTop: false,
          showInSubWindow: false,
          primaryButton: {
            value: 'confirm',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('confirm Button click')
            }
          },
          // 第二个按钮
          secondaryButton: {
            value: 'cancel',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('cancel Button click')
            }
          },
          onStateChange: (e) => {
            console.info(JSON.stringify(e.isVisible))
            if (!e.isVisible) {
              this.handlePopup = false
            }
          }
        })

      Button('默认按钮-自定义pop')
        .margin({ top: 10 })
        .onClick(() => {
          logService.e(`>>>> customPopup = ${this.customPopup}`)
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder(),
          placement: Placement.Bottom, // pop位置
          popupColor: Color.Pink,
          mask: true,
          enableArrow: true,
          autoCancel: true, //点击按钮外部消失
          showInSubWindow: false,
          onStateChange: (e) => {
            if (e.isVisible) {
              this.customPopup = false
            }
          }
        })
        .type(ButtonType.Normal)
        .borderRadius(5)

      Button('正常按钮样式')
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .margin({ top: 10 })

      Button('圆角矩形按钮样式')
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .margin({ top: 10 })
        .borderRadius(5)

      Button('带边框按钮样式')
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .margin({ top: 10 })
        .border({ width: 1, color: Color.Blue, style: BorderStyle.Solid })
        .borderRadius(5)

      Button("圆形", { type: ButtonType.Circle })
        .fontSize(16)
        .width(80)
        .height(80)
        .backgroundColor(Color.Red)
        .margin({ top: 10 })

      Button("点击事件,默认开启点击效果")
        .margin({ top: 10 })
        .onClick(() => {
          toast.show("click button")
        })

      Button("点击事件,关闭点击效果", { stateEffect: false })
        .margin({ top: 10 })
        .onClick(() => {
          toast.show("click button")
        })

      Button('点击事件，自定义点击效果')
        .margin({ top: 10 })
        // .enabled(false) //是否可以点击
        .stateStyles({
          normal: {
            .backgroundColor(Color.Red)
          },
          clicked: {
            .backgroundColor(Color.Green)
          },
          pressed: {
            .backgroundColor(Color.Orange)
          },
          disabled: {
            .backgroundColor(Color.Grey)
          }
        })
        .onClick(() => {
          toast.show('click button')
        })

      Button({type: ButtonType.Normal}){
        Row(){
          Image($r("app.media.app_icon")).width(25).height(25)
          Text('button包含复杂组件').margin({left: 8}).fontColor(Color.Red)
        }
      }.padding({left: 10, right: 10})
      .margin({top: 10})
      .onClick(() => {
        toast.show("click button")
      })
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }

  //popup构造器定义弹框内容
  @Builder
  popupBuilder() {
    Column() {
      Row() {
        Text('menu1').fontSize(12)
      }
      .width(100)
      .height(50)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text('menu2').fontSize(12)
      }
      .width(100)
      .height(50)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text('menu3').fontSize(12)
      }
      .width(100)
      .height(50)
      .justifyContent(FlexAlign.Center)
    }
  }
}