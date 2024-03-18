import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant';
import logService from '../../../common/utils/LogService';
import toast from '../../../common/utils/Toast';
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct ListDemo {
  @State
  private items: Student[] = [];
  private array:number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  onPageShow(){
    logService.e(">>>> listDemo onpage show")
    this.array.forEach(element => {
      let s = new Student();
      s.name = `July ${element}`;
      s.age = 18 + element;
      this.items.push(s)
    });
  }

  onPageHide(){
    logService.e(">>>> onpage hide")
  }

  aboutToAppear(){
    logService.e(">>>> about to appear")
  }

  aboutToDisappear(){
    logService.e(">>>>> about to disappear")
  }

  build() {
    Column() {
      TitleBar({title: "List Demo"})
      List(){
        ListItem(){
          Text("Header")
            .width(FULL_WIDTH)
            .height(80)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor(Color.Pink)
        .onClick(()=>{
          let s = new Student()
          s.age = 999
          s.name = "ooo"
          this.items[0] = s
        })

        ForEach(this.items, (item:Student, index)=>{
          ListItem(){
            Text(`index ${item.age}`)
          }
          .width(FULL_WIDTH)
          .height(80)
          .backgroundColor($r('app.color.main_bg_color'))
        })

        ListItem() {
          Text("Footer")
        }
        .width(FULL_WIDTH)
        .height(80)
        .backgroundColor(Color.Pink)
      }
      .sticky(StickyStyle.Header)
      .layoutWeight(1)
      .divider({strokeWidth: 1, color: Color.Red, startMargin: 10, endMargin: 10})
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}

class Student{
  public name?:string
  public age?:number
}