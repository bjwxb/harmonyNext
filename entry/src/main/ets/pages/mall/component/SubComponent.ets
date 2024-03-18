/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import toast from '../../../common/utils/Toast'
import { Student } from '../bean/StudentBean'

@Preview
@Component
export default struct SubComponent{
  @Consume provideAge:number
  @State a:number = this.provideAge
  @Link stu:Student

  build() {
    Column(){
      Row(){
        Text(`>>> ${this.a} subComponent consume age: ${this.provideAge} <<<`).fontColor(Color.White)
      }
      .width(FULL_WIDTH)
      .height(60)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Red)
      .margin({top: 10})
      .onClick(()=>{
        this.provideAge += 5
        this.a++
      })

      Row(){
        Text(`>>> name = ${this.stu.name} , age = ${this.stu.age}<< score = ${this.stu.action.score}< ${this.stu.action.va}}`).fontColor(Color.White)
      }
      .width(FULL_WIDTH)
      .height(60)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Red)
      .margin({top: 10})
      .onClick(()=>{
        this.stu.age++
        this.stu.name = ` July + ${this.stu.age}`
        //嵌套属性对象更改 观察不到
        let s = this.stu.action.score + 1
        toast.show("<>>> s = " + s)
        this.stu.action.score = s
        this.stu.action.va = "Hello"

      })
    }
  }
}