import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import toast from '../../../common/utils/Toast'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct SideBarDemo {
  @State message: string = 'Hello World'

  build() {
    SideBarContainer(SideBarContainerType.Overlay){
      Column() {                                     // 第一个子组件为侧边栏视图
        Text("侧边栏区域")
          .width("100%")
          .height("100%")
          .fontSize(30)
          .textAlign(TextAlign.Center)
      }
      .width(10)
      .height("100%")
      .backgroundColor("#aabbcc")

      Column() {// 第二个子组件为内容视图
        Text("内容区域")
          .width("100%")
          .height("100%")
          .fontSize(30)
          .textAlign(TextAlign.Center)
      }
      .width(10)
      .height("100%")
      .backgroundColor("#bbbbaa")
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
    .showSideBar(false)
    .sideBarWidth('70%')
    .minSideBarWidth('40%')
    .maxSideBarWidth('80%')
    .controlButton({                                 // 设置侧边栏控制按钮的样式
      width: 30,                                     // 设置侧边栏控制按钮宽度为30
      height: 30,                                    // 设置侧边栏控制按钮高度为30
      top: 20,                                       // 设置侧边栏控制按钮距离容器顶部为15
      icons: {                                       // 设置侧边栏控制按钮图片
        shown: $r("app.media.ic_left_black"),            // 设置侧边栏显示时控制按钮的图标。
        hidden: $r("app.media.ic_app_menu"),           // 设置侧边栏隐藏时控制按钮的图标。
        switching: $r("app.media.ic_app_menu")         // 设置侧边栏显示和隐藏状态切换时控制按钮的图标。
      }
    })
    .onChange((show)=>{
      if(show){
        toast.show("显示侧边栏")
      } else {
        toast.show("隐藏侧边栏")
      }
    })
  }
}