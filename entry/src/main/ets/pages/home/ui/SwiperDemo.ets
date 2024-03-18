import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct SwiperDemo {

  private list:Array<number> = [10, 91, 55, 33]

  private controller: SwiperController = new SwiperController();

  build() {
    Column() {
      TitleBar({title: 'Swiper Demo'})

      Scroll(){
        Column(){
          Swiper(this.controller){
            ForEach(this.list, (item:number, index)=>{
              Text("item = " + item)
                .fontColor(Color.White)
                .width("100%")
                .height("100%")
                .textAlign(TextAlign.Center)
                .backgroundColor(`#ff56${item}`)
            })
          }
          .width(FULL_WIDTH)
          .height(220)
          .autoPlay(true)
          .loop(true) // 当item个数只有2个且开启循环时，向左滑动有问题，会先白一下
          .indicator(true) //是否显示指示器
          .duration(400)
          .margin({bottom: 30})

          Swiper(this.controller){
            ForEach(this.list, (item:number, index)=>{
              Text("item = " + item)
                .fontColor(Color.White)
                .width("100%")
                .height("100%")
                .textAlign(TextAlign.Center)
                .backgroundColor(`#ff56${item}`)
            })
          }
          .width(FULL_WIDTH)
          .height(220)
          .autoPlay(true)
          .loop(true) // 当item个数只有2个且开启循环时，向左滑动有问题，会先白一下
          .indicator(this.customDotIndicator())
          .duration(400)
          .margin({bottom: 30})

          Row(){
            Button("上一个")
              .onClick(()=>{
                this.controller.showPrevious()
              })
            Button("下一个")
              .onClick(()=>{
                this.controller.showNext()
              })
          }
          .width(FULL_WIDTH)
          .justifyContent(FlexAlign.SpaceEvenly)
        }
      }
    }
    .width('100%')
    .height('100%')
  }

  customDotIndicator(): DotIndicator{
    let indicator = new DotIndicator()
    indicator.itemWidth(8)
    indicator.itemHeight(8)
    indicator.selectedItemWidth(8)
    indicator.selectedItemHeight(8)
    indicator.color(Color.Gray)
    indicator.selectedColor(Color.Red)
    return indicator
  }
}