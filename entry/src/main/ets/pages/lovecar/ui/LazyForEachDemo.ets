import { FULL_WIDTH } from '../../../common/constants/CommonConstant';
import logService from '../../../common/utils/LogService';
import { TitleBar } from '../../../common/widgets/TitleBar';
import { MyDataSource } from './lazy/MyDataSource';

@Entry
@Component
struct LazyForEachDemo {

  @State message: string = 'Hello World';

  private data:MyDataSource = new MyDataSource()

  aboutToAppear(): void {
    for(let i = 0; i <= 20; i++){
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    Column() {
      TitleBar({title:"LazyForEach Demo"})
        .onClick(()=>{
        })

      List({space: 3}){
        LazyForEach(this.data, (item:string) => {
         ListItem(){
           Row(){
             Text(item).fontSize(30)
               .onAppear(()=>{
                 logService.e(">>> appear item = " + item)
               })
           }
           .width(FULL_WIDTH)
           .height(100)
           .alignItems(VerticalAlign.Center)
           .padding({left: 20})
           .backgroundColor(Color.Pink)
         }
        }, (item:string) => item)
      }
    }
    .width('100%')
    .height('100%')
  }
}