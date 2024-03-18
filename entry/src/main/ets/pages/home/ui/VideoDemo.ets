import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct VideoDemo {
  private videoController: VideoController = new VideoController()

  build() {
    Column() {
      TitleBar({ title: "Video Demo" })

      Video({ src: $rawfile('test.mp4'), controller: this.videoController })
        .width(FULL_WIDTH)
        .height(300)
        .autoPlay(true)
        .muted(false)
        .controls(true) //是否显示视频按钮控制面板
        .loop(true)
        .onPrepared((e)=>{
          logService.e(">>> onPrepared video duration = " + e.duration)
        })
        .onSeeked((t)=>{

        })
        .onStart(()=>{
          logService.e(">>>> onstart")
        })
        .onUpdate((e)=>{
          logService.e('>>>> onupdate t = ' + e.time)
        })
        .onFinish(()=>{
          logService.e(">>>> onfinish")
        })


      Row({ space: 10 }) {
        Button("开始播放")
          .onClick(() => {
            this.videoController.start()
          })
        Button("暂停播放")
          .onClick(() => {
            this.videoController.pause()
          })

        Button("继续播放")
          .onClick(() => {
            this.videoController.start()
          })
      }
      .margin({bottom: 10, top: 20})

      Row() {
        Button("全屏播放")
          .onClick(() => {
            this.videoController.requestFullscreen(true)
          })
        Button("退出全屏")
          .onClick(() => {
            this.videoController.exitFullscreen()
          })
      }

    }
    .height('100%')
  }
}