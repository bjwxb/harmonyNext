import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct RatingDemo {
  @State rating: number = 0


  build() {
    Column() {
      TitleBar({title: " Rating Demo"})

      Text(`current ratint = ${this.rating}`)

      Rating({rating: 3, indicator: true})//// 设置不可操作，默认值为0
        .width(150)
        .height(40)
        .stars(5)
        .margin({top: 30})

      Rating({rating: 3, indicator: false})// // 设置可操作，默认值为0
        .width(150)
        .height(40)
        .stars(5)
        .margin({top: 30})

      Rating({rating: 3})
        .stars(5)
        .stepSize(0.5)
        .margin({top: 30})
        .onChange((value) => {
          this.rating = value;
        })

      Rating({rating: 3})
        .stars(5)
        .stepSize(0.1)
        .margin({top: 30})
        .onChange((value) => {
          this.rating = value;
        })

      Text('自定义图片').margin({top: 60})
      Rating({rating: 3})
        .stars(5)
        .stepSize(0.5)
          .starStyle({
            backgroundUri:'/common/ic_star_normal.png',
            foregroundUri:'/common/ic_star_selected.png'
          })
        .margin({top: 10})
        .onChange((value) => {
          this.rating = value;
        })
    }
    .width('100%')
    .height('100%')
  }
}