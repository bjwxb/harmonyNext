/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct PickerDemo {
  build() {
    Column() {
      TitleBar({ title: 'Picker Demo' })

      Scroll() {
        Column() {
          TimePicker()
            .width("60%")
            .margin({ bottom: 30 })

          Circle().width(20).height(20).fill(Color.Brown).margin({bottom: 20})

          TimePicker()
            .width("60%")
            .useMilitaryTime(true)//true -置24小时制，也就是不显示上下午文本
            .backgroundColor(Color.Pink)
            .onChange((date) => {
              logService.e(`>>> hour = ${date.hour}, min = ${date.minute}`)
            })

          DatePicker()
            .width('80%')
            .onDateChange((d) => {
              logService.e(`date >>> year = ${d.getFullYear()}, month = ${d.getMonth()}, day = ${d.getDay()}`)
            })

          DatePicker()
            .width('80%')
            .lunar(true)
            .backgroundColor(Color.Orange)
            .margin({ top: 30, bottom: 30 })
            .onDateChange((d) => {
              logService.e(`date >>> year = ${d.getFullYear()}, month = ${d.getMonth()}, day = ${d.getDay()}`)
            })

          DatePicker({
            start: new Date('2021-1-1'),
            end: new Date('2023-12-31')
          })
            .width('80%')
            .backgroundColor(Color.Brown)
            .onDateChange((d) => {
              logService.e(`date >>> year = ${d.getFullYear()}, month = ${d.getMonth()}, day = ${d.getDay()}`)
            })
        }
      }
      .width(FULL_WIDTH)
      .layoutWeight(1)
    }
  }
}