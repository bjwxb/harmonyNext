import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'
import { GridItemId, HomeGridBean, homeGridList } from './bean/HomeGridBean'
import { router } from '@kit.ArkUI'
import { AppPage } from '../../common/constants/AppPage'
import toast from '../../common/utils/Toast'
import logService from '../../common/utils/LogService'

/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */
@Preview
@Component
export struct HomeComponent{

  build() {
    Column() {
      this.GridContent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.main_bg_color'))
  }

  //grid list
  @Builder GridContent(){
    Grid(){
      ForEach(homeGridList, (item:HomeGridBean, index) => {
        GridItem(){
          this.buildGridItem(item)
        }
        .backgroundColor(Color.White)
        .onClick(()=>{
          this.onItemClick(item)
        })
      })
    }
    .width(FULL_WIDTH)
    .rowsGap(1)
    .columnsGap(1)
    .columnsTemplate('1fr 1fr 1fr')
  }

  //grid item ui
  @Builder buildGridItem(item:HomeGridBean){
    Column(){
      Image(item.icon)
        .size({width:30, height: 30})

      Text(item.text).fontSize(14).margin({top: 8})
    }
    .justifyContent(FlexAlign.Center)
    .padding({top: 20, bottom: 20})
  }

  async onItemClick(item:HomeGridBean){
    switch (item.id){
      case GridItemId.TEXT:
        router.pushUrl({url: AppPage.pageTextDemo})
        break
      case GridItemId.BUTTON:
        router.pushUrl({url: AppPage.pageButtonDemo})
        break
      case GridItemId.IMAGE:
        router.pushUrl({url: AppPage.pageImageDemo, params:{"hah":"hello"}})
        break
      case GridItemId.TEXT_INPUT:
        router.pushUrl({url: AppPage.pageTextInputDemo})
        break
      case GridItemId.PROGRESS:
        router.pushUrl({url: AppPage.pageProgressDemo})
        break
      case GridItemId.PICKER:
        router.pushUrl({url: AppPage.pagePickerDemo})
        break
      case GridItemId.QRCODE:
        router.pushUrl({url: AppPage.pageQrCodeDemo})
        break
      case GridItemId.TOGGLE:
        router.pushUrl({url: AppPage.pageToggleDemo})
        break
      case GridItemId.SLIDE:
        router.pushUrl({url: AppPage.pageSlideDemo})
        break
      case GridItemId.RATING:
        router.pushUrl({url: AppPage.pageRatingDemo})
        break
      case GridItemId.SIDE_BAR:
        router.pushUrl({url: AppPage.pageSideBarDemo})
        break
      case GridItemId.BADGE:
        router.pushUrl({url: AppPage.pageBadgeDemo})
        break
      case GridItemId.RELATIVE:
        router.pushUrl({url: AppPage.pageRelativeDemo})
        break
      case GridItemId.Scroll:
        router.pushUrl({url: AppPage.pageScrollDemo})
        break
      case GridItemId.List:
        router.pushUrl({url: AppPage.pageListDemo})
        break
      case GridItemId.Grid:
        router.pushUrl({url: AppPage.pageGridDemo})
        break
      case GridItemId.Swiper:
        router.pushUrl({url: AppPage.pageSwiperDemo})
        break
      case GridItemId.WebView:
        router.pushUrl({url: AppPage.pageWebViewDemo})
        break
      case GridItemId.Video:
        router.pushUrl({url: AppPage.pageVideoDemo})
        break
      case GridItemId.Refresh:
        router.pushUrl({url: AppPage.pageRefreshDemo})
        break
      case GridItemId.PatternLock:
        router.pushUrl({url: AppPage.pageLockDemo})
        break
      case GridItemId.Navigation:
        router.pushUrl({url: AppPage.pageNavigationDemo})
        break
      case GridItemId.AlphabetIndexer:
        router.pushUrl({url: AppPage.pageAlphabetIndexerDemo})
        break
      default:
        toast.show(`${item.text}`)

    }
  }
}