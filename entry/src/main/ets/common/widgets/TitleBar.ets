/**
 * Created on 2024/3/12.
 * Auth: wuxiaobo
 * Desc: 公用 titleBar
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../constants/CommonConstant'
import { router } from '@kit.ArkUI'

@Preview
@Component
export struct TitleBar {
  //是否显示返回按钮
  private showBack: boolean = true
  //标题
  private title: string = ""
  //右侧按钮
  private showRightIcon: boolean = false
  //右侧按钮回调
  private rightCallback?: () => void

  //titleBar背景颜色
  private bgColor: ResourceColor = $r('app.color.main_color')

  build() {
    Row() {
      /* 左边返回按钮 */
      Row() {
        if (this.showBack) {
          Image($r("app.media.ic_left_white"))
            .objectFit(ImageFit.Contain)
            .size({ width: $r("app.float.vp_24") })
        }
      }
      .width(50)
      .height(FULL_HEIGHT)
      .justifyContent(FlexAlign.Center)
      .onClick(()=>{
        if(this.showBack){
          router.back()
        }
      })
      /* 中间title*/
      Text(`${this.title}`)
        .fontSize($r("app.float.fp_18"))
        .fontColor(Color.White)
        .layoutWeight(1)
        .height(FULL_HEIGHT)
        .maxLines(1)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .textAlign(TextAlign.Center)

      Row(){
        if(this.showRightIcon){
          Image($r("app.media.ic_right_more"))
            .height(FULL_HEIGHT)
            .objectFit(ImageFit.Contain)
            .padding({left: 10, right: 10})
            .onClick(this.rightCallback)
        }
      }
      .width(60)
      .height(FULL_HEIGHT)
      .justifyContent(FlexAlign.Center)
    }
    .width(FULL_WIDTH)
    .height("40vp")
    .backgroundColor(this.bgColor)
  }
}