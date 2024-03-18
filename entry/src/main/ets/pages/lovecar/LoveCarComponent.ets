/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'
import toast from '../../common/utils/Toast'
import router from '@ohos.router'
import { AppPage } from '../../common/constants/AppPage'
import logService from '../../common/utils/LogService'

@Preview
@Component
export struct LoveCarComponent{

  build() {

    Column({space: 20}){
      Button('测试通知/提醒')
        .onClick(()=>{
          router.pushUrl({url: AppPage.pageNotificationDemo})
        })

      Button('测试存储相关')
        .onClick(()=>{
          router.pushUrl({url: AppPage.pageStorageDemo})
        })

      Button('公共事件相关')
        .onClick(()=>{
          router.pushUrl({url: AppPage.pageEventDemo})
        })

      Button('LazyForEach Demo')
        .onClick(()=>{
          router.pushUrl({url: AppPage.pageLazyEachDemo})
        })

    }
    .justifyContent(FlexAlign.Center)
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}