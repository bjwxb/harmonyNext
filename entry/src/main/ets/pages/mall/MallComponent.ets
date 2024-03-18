/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'
import logService from '../../common/utils/LogService'
import { ActionA, ActionAArray, Student } from './bean/StudentBean'
import { ChildComponent } from './component/ChildComponent'
import SubComponent from './component/SubComponent'
import SubComponent2 from './component/SubComponent2'

@Preview
@Component
export struct MallComponent{

  @State age:number = 18
  @State linkAge:number = 22
  @Provide provideAge:number = 11
  @State stu:Student = new Student("Melon", 18, new ActionA(10, "hah"))
  @State arr:ActionA[] = [new ActionA(1, "11"), new ActionA(33, "33")]

  build() {
    Column(){
      Text('状态管理验证').height(50)

      Button('state/prop单向绑定 age =' + this.age)
        .onClick(()=>{
          this.age++
          logService.e(`>>> ${this.arr[0].score}`)
        })
        .margin({bottom: 10})

      Button('state/link双向绑定 linkAge =' + this.linkAge)
        .onClick(()=>{
          this.linkAge++
        })
        .margin({bottom: 10})

      Button('provide/consume provideAge =' + this.provideAge)
        .onClick(()=>{
          this.provideAge++
          this.arr.push(new ActionA(99, "pp"))
        })
        .margin({bottom: 10, top: 10})

      Button('state/prod object ' + this.stu.age + ' , name = ' + this.stu.name + ", score=" + this.stu.action.score + this.stu.action.va)
        .onClick(()=>{
          this.stu.age++
          this.stu.action.va = "July"
          this.stu.action.score = this.stu.action.score + 1
          //测试数组的
          this.arr[0] = new ActionA(32, "iii")
        })
        .margin({bottom: 10, top: 10})

      Button('arr test, size =' + this.arr.length + ' first score = ' + this.arr[0].score)
        .onClick(()=>{
          this.arr[0].score = this.arr[0].score + 1
        })
        .margin({bottom: 10, top: 10})

      ChildComponent({subAge: this.age, linkAge: this.linkAge})
        .layoutWeight(1)

      SubComponent({stu: this.stu})
      SubComponent2({arr: this.arr[0]})
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }

}
