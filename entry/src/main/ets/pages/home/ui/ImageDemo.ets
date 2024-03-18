/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import router from '@ohos.router';
import { TitleBar } from '../../../common/widgets/TitleBar';
import { AppPage } from '../../../common/constants/AppPage';

@Entry
@Component
struct ImageDemo{

  @State imgWidth: number = 100;
  @State imgHeight: number = 100;

  build() {
    Column(){

      TitleBar({title: 'Image Demo'})

      Image($r("app.media.test"))
        .width(100)
        .height(100)
        .margin({top: 10})

      Image($r("app.media.test"))
        .width(this.imgWidth)
        .height(this.imgHeight)
        .margin({top: 10})
        .objectFit(ImageFit.Contain)
        .renderMode(ImageRenderMode.Template)
        .animation({
          duration: 2000,
          tempo: 3,
          delay: 100,
          curve: Curve.Linear,
          playMode: PlayMode.Normal,
          iterations: 2,
          onFinish: ()=>{ // iterations=-1时 无限次播放，不会回调onFinish
            logService.e(">>>>>> anim finish <<<<<<")
          }
        })
        .onClick(() =>{
          this.imgWidth = 200
          this.imgHeight = 200
          let param = router.getParams() as Map<string, string>

          logService.e(">>>>>>>> " + param['hah'] )
        })

      Image($r("app.media.test"))
        .width(100)
        .height(100)
        .margin({top: 10})
        .objectFit(ImageFit.Cover)
        .backgroundColor(Color.Gray)
        .onClick(()=>{
          router.back({url:AppPage.pageMain, params: {"name":"July"}})
        })

      Image($r("app.media.test"))
        .width(100)
        .height(50)
        .margin({top: 10})
        .objectFit(ImageFit.Fill)
        .backgroundColor(Color.Gray)

      Image($r("app.media.test"))
        .width(100)
        .height(50)
        .margin({top: 10})
        .objectFit(ImageFit.Auto)
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}