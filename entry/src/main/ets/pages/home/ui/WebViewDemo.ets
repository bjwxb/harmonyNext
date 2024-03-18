import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'

import web_webview from '@ohos.web.webview'
import logService from '../../../common/utils/LogService'
import data from '@ohos.telephony.data'

let url_data = `
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <script type='text/javascript'>
      function test() {
        alert('button click');
      }
    </script>
</head>

<body>
<button onclick='test()' type='button'>Button Click</button>
</body>
</html>
`

@Entry
@Component
struct WebViewDemo {
  private url: string = 'https://www.baidu.com'
  // private url: string = 'https://cs.gwcare.com.cn/carserviceh5/home?businessSource=ORA_APP'
  private webController: web_webview.WebviewController = new web_webview.WebviewController()

  build() {
    Column() {
      TitleBar({title:"WebView Demo"})

      // Web({src: $rawfile('index.html'), controller: this.webController})
      Web({src: this.url, controller: this.webController})
        .width(FULL_WIDTH)
        .layoutWeight(1)
          //设置是否允许执行 JS 脚本，默认为 true ，表示允许执行。
        .javaScriptAccess(true)
          //设置是否开启通过 $rawfile(filepath/filename) 访问应用中 rawfile 路径的文件， 默认为 false，表示不启用。
        .fileAccess(true)
          //设置是否允许加载超文本传输协议（HTTP）和超文本传输安全协议（HTTPS）混合内容，
          // 默认为 MixedMode.None ， 表示不允许加载 HTTP 和 HTTPS 混合内容。
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .zoomAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .multiWindowAccess(true)
        .mixedMode(MixedMode.All)
        .zoomAccess(true)
        .onPageBegin(()=>{
          logService.e(">>> onPageBegin <<<")
        })
        .onPageEnd(()=>{
          logService.e(">>> onPage End <<<")
        })
        .onProgressChange((e) => {
          logService.e(`>>> onProgressChange = ${e?.newProgress} <<<`)
        })
        .onErrorReceive(()=>{
          logService.e(">>> onErrorReceive <<<")
        })
        .onHttpErrorReceive(()=>{
          logService.e(">>> onHttpErrorReceive <<<")
        })
        .onSslErrorEventReceive(()=>{
          logService.e(">>> onSslErrorEventReceive <<<")
        })


      Row({space: 10}) {
        Button("刷新")
          .onClick(() => {
            this.webController.refresh();
            this.webController.requestFocus()
          })

        Button("前进")
          .onClick(() => {
            logService.e(`====== ${this.webController.accessBackward()}`)
            this.webController.forward();
          })

        Button("后退")
          .onClick(() => {
            this.webController.backward();
          })
        Button("放大")
          .onClick(() => {
            this.webController.zoom(1.5);
          })

        Button("缩小")
          .onClick(() => {
            this.webController.zoom(0.8);
          })


        Button("清除记录")
          .onClick(() => {
            this.webController.clearHistory();
          })
      }.padding({top: 15, bottom: 15})
    }
    .width('100%')
    .height('100%')
  }
}