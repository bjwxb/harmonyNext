import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct PatternLockDemo {
  @State passwords: Number[] = [0,1,2,5,8]
  @State message: string = '请验证密码'
  private patternLockController: PatternLockController = new PatternLockController()

  build() {
    Column() {
      TitleBar({ title: '手势密码 Demo' })

      Text(this.message)
        .textAlign(TextAlign.Center)
        .fontSize(22)
        .margin({top: 25})

      PatternLock(this.patternLockController)
        .sideLength(200) // 设置宽高
        .circleRadius(6) // 设置圆点半径
        .pathColor(Color.Yellow)//连线颜色
        .regularColor(Color.Gray) // 设置圆点颜色
        .selectedColor(Color.Red) //圆点选中颜色
        .pathStrokeWidth(8) // 设置连线粗细
        .activeColor(Color.Green)
        .backgroundColor(Color.Pink) // 设置背景色
        .autoReset(true) // 支持用户在完成输入后再次触屏重置组件状态
        .margin(10)
        .onPatternComplete((input: Array<number>) => {
          if (input == null || input == undefined || input.length < 5) {
            this.message = "密码长度至少为5位数。";
            return;
          }
          logService.e(">>> " + input.toString())
          if (this.passwords.length > 0) {
            if (this.passwords.toString() == input.toString()) {
              this.passwords = input
              this.message = "密码设置成功"
            } else {
              this.message = '密码输入错误'
            }
          } else {
            this.passwords = input
            this.message = "密码输入错误"
          }
        })

      Button('重置密码')
        .onClick(() => {
          this.passwords = [];
          this.message = '请验证手势密码';
          this.patternLockController.reset();
        })
    }
    .width('100%')
    .height('100%')
  }
}