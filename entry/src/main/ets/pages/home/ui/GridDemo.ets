import { TitleBar } from '../../../common/widgets/TitleBar';
@Entry
@Component
struct GridDemo {
  private rowSpace: number = 10;             // 行间距
  private rowCount: number = 5;              // 行数
  private columnSpace: number = 10;          // 列间距
  private columnCount: number = 4;           // 列数

  private items: number[] = [];

  build() {
    Column() {

      TitleBar({title: "Grid Demo"})

      Grid() {
        ForEach(this.items, (item:number, index) => { // ForEach语法
          GridItem() {
            Text('Text:' + index)
          }
          .width('100%')
          .height(100)
          .backgroundColor('#bbccdd')
          // todo 感觉这些属性只有在固定grid高度时才有用
          // .rowStart(index == 15 ? 3 : 0)       // 第16个GridItem占用2行
          // .rowEnd(index == 15 ? 4 : 0)         // 第16个GridItem占用2行
          // .columnStart(index == 16 ? 0 : 0)    // 第17个GridItem占用2列
          // .columnEnd((index == 16 ? 1 : 0))    // 第17个GridItem占用2列
        })
      }
      .padding({left: this.columnSpace, right: this.columnSpace})
      .columnsTemplate("1fr 1fr 1fr 1fr")      // Grid宽度均分成4份
      .rowsGap(this.rowSpace)                  // 设置行间距
      .columnsGap(this.columnSpace)            // 设置列间距
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear() {
    for(let i = 0; i < 30; i++) {
      this.items[i] = i;
    }
  }
}