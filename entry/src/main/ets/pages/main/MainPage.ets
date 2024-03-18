import { nevList, TabId } from './bean/NevItemBean'
import {HomeComponent} from '../home/HomeComponet'
import {MallComponent} from '../mall/MallComponent'
import { MineComponent } from '../mine/MineComponent'
import { LoveCarComponent } from '../lovecar/LoveCarComponent'
import logService from '../../common/utils/LogService'

/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc: main page
 */
@Entry
@Component
struct MainPage{

  private controller: TabsController = new TabsController()
  @State currentIndex: number = 0

  @Builder TabItem(index:number){
    Column(){
      Image(this.currentIndex == index? nevList[index].iconSelected : nevList[index].icon)
        .size({width: $r("app.float.vp_26"), height: $r("app.float.vp_26")})
        .objectFit(ImageFit.Contain)

      Text(nevList[index].text)
        .margin({top: 4})
        .fontSize($r("app.float.fp_12"))
        .fontColor(this.currentIndex == index? $r("app.color.tab_selected_color"): $r("app.color.tab_normal_color"))
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Tabs({barPosition: BarPosition.End, controller: this.controller}){
      TabContent(){
        HomeComponent()
      }.tabBar(this.TabItem(TabId.HOME))

      TabContent(){
        LoveCarComponent()

      }.tabBar(this.TabItem(TabId.CAR))

      TabContent(){
        MallComponent()

      }.tabBar(this.TabItem(TabId.MALL))

      TabContent(){
        MineComponent()
      }.tabBar(this.TabItem(TabId.MINE))
    }
    .vertical(false)//true-竖向切换，false横向切换
    .barMode(BarMode.Fixed) //BarMode.Scrollable - 滑动，BarMode.Fixed 固定均分
    // .barHeight($r('app.float.bar_height'))
    // .barWidth("100%")
    .onChange((index)=>{
      this.currentIndex = index
    })
    .scrollable(true)//是否可以滑动
    .backgroundColor(Color.White) //bar bg color
  }

  onBackPress(): boolean | void {
    logService.e(">>>> main back press <<<<")
  }

}