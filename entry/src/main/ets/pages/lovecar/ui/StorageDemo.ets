/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'

AppStorage.setOrCreate("type", "selected")

PersistentStorage.persistProp("propA", 22)

@Entry
@Component
struct StorageDemo{

  // private localStorage = new LocalStorage({"name":"hah", "age":22})

  @State type:string = AppStorage.get('type')??''

  @StorageLink('propA') propA:number = 99

  build() {
    Column({space: 12}){
      TitleBar({title: '存储测试'})

      Button(`AppStorage score=${AppStorage.get("score")}, type = ${AppStorage.get("type")}`)
        .onClick(()=>{
          AppStorage.setOrCreate('score', 1000)
          AppStorage.setOrCreate("type", "hah")
        })

      Button(`PersistentStorage propA = ${this.propA}`)
        .onClick(()=>{
          this.propA += 1
        })

      StorageItemComponent()

    }
    .height(FULL_HEIGHT)
  }
}

@Component
struct StorageItemComponent{

  @LocalStorageProp("name") name:string = 'July'
  @LocalStorageLink("age") age:number = 19

  @StorageProp('score') score:number = 10
  @StorageLink('type') type:string = "normal"

  build() {
    Column(){
      Row(){
        Text(`>> LocalStroageProp.name = ${this.name}, LocalStroageLink.age = ${this.age} <<`)
      }
      .width(FULL_WIDTH)
      .height(100)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Gray)

      Row(){
        Text(`>> AppStroageProp.score = ${this.score}, AppStroageLink.type = ${this.type} <<`)
      }
      .width(FULL_WIDTH)
      .height(100)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Pink)
      .onClick(()=>{
        this.score = this.score + 1
        this.type = this.type + this.score
      })
    }
    .height(FULL_HEIGHT)
  }
}