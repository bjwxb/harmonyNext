/**
 * Created on 2024/3/12.
 * Auth: wuxiaobo
 * Desc: 启动页
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'
import router from '@ohos.router'
import { AppPage } from '../../common/constants/AppPage'
import logService from '../../common/utils/LogService'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct SplashPage {

  private intervalId?: number
  private totalDuration:number = 3000
  @State second:number = 3
  @State currentDuration:number = 0

  build() {
    Stack({alignContent: Alignment.TopEnd}){
      Image($r("app.media.img_splash"))
        .width(FULL_WIDTH)
        .height(FULL_HEIGHT)

      Stack({alignContent: Alignment.Center}){
        Text(`${this.second.toFixed(0)}`)
          .fontColor(Color.White)
          .fontSize($r("app.float.fp_20"))
          .margin({top: 30, right: 30})
        Progress({value: this.currentDuration, total: this.totalDuration, type: ProgressType.Ring})
          .width(44)
          .height(44)
          .color(Color.Red)
          .margin({top: 30, right: 30})
      }
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
    .backgroundColor("#aabbcc")
    .onClick(()=>{
      this.jump2main()
    })
  }

  jump2main(){
    logService.e(">>>> clear interval id")
    clearInterval(this.intervalId);
    logService.e(">> jump main page")
    router.replaceUrl({url: AppPage.pageMain})
  }

  aboutToAppear(): void {
    this.intervalId = setInterval(()=>{
      this.currentDuration++
      this.second = (this.totalDuration - this.currentDuration)/1000
      if(this.second < 0){
        this.jump2main()
      }
    }, 1)
  }

  aboutToDisappear(): void {
    clearInterval(this.intervalId)
  }

}