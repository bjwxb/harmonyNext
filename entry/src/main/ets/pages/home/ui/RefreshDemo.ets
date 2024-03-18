import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant';
import logService from '../../../common/utils/LogService';
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct RefreshDemo {
  @State refreshing: boolean = false;
  @State msg: string = '';

  build() {
    Column() {
      TitleBar({ title: "Refresh Demo" })

      Refresh({ refreshing: this.refreshing }) {
        Column() {
          Text('备注： 下拉触发刷新').fontSize(16).fontColor(Color.Red).margin(20)

          Text(this.msg)
            .width('100%')
            .fontSize(26)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor("#aabbcc")
        .height(FULL_WIDTH)
        .justifyContent(FlexAlign.Start)
        .padding({ top: 100 })
      }
      .width(FULL_WIDTH)
      .height(FULL_HEIGHT)
      .onRefreshing(() => {
        this.refreshing = true; // 进入刷新状态
        setTimeout(() => {
          this.refreshing = false;
        }, 2000)
      })
      .onStateChange((state) => {
        switch (state) {
          case RefreshStatus.Drag:
            this.msg = "下拉刷新"
            break
          case RefreshStatus.OverDrag:
            this.msg = "松开刷新"
            break
          case RefreshStatus.Refresh:
            this.msg = "正在刷新"
            break
          case RefreshStatus.Done:
            this.msg = "刷新完成"
            break
          default:
            this.msg = ""
            break
        }
        logService.e(this.msg + ">>>>>> state = " + state)
      })
    }
    .width('100%')
    .height('100%')
  }
}