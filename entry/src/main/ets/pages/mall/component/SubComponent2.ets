/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import toast from '../../../common/utils/Toast'
import { ActionA, ActionAArray, Student } from '../bean/StudentBean'

@Preview
@Component
export default struct SubComponent2{

  @ObjectLink arr:ActionA

  build() {
    Column(){
      Row(){
        Text(`>>>subComponent2 ${this.arr.score}  ${this.arr.va}<<<`).fontColor(Color.White)
      }
      .width(FULL_WIDTH)
      .height(60)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Red)
      .margin({top: 10})
      .onClick(()=>{
        this.arr.score = this.arr.score + 1
        // this.arr = new ActionA(9,'ss')
      })

    }
  }
}