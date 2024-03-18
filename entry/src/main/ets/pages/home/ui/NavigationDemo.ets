@Entry
@Component
struct NavigationDemo {
  @State message: string = 'Hello World'

  build() {
    Navigation() {
      Text('content')
        .textAlign(TextAlign.Center)
        .fontSize(30)
        .size({ width: '100%', height: '100%' })
        .backgroundColor('#aabbcc')
    }
    .title(this.title())
    .backgroundColor(Color.Pink)
  }

  @Builder title() { // 通过Builder自定义标题栏，可以灵活的设置标题样式
    Text('Builder标题')
      .fontSize(20)
      .backgroundColor(Color.Red)
  }
}