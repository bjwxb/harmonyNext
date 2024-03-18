import { FULL_HEIGHT } from '../../../common/constants/CommonConstant'
import { TitleBar } from '../../../common/widgets/TitleBar'
import notificationManager from '@ohos.notificationManager';
import logService from '../../../common/utils/LogService';
import { data } from '@kit.TelephonyKit';
import toast from '../../../common/utils/Toast';
import wantAgent from '@ohos.app.ability.wantAgent';


/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
@Entry
@Component
struct NotificationDemo {

  @State value:number = 0

  aboutToAppear(): void {
    notificationManager.requestEnableNotification(()=>{
      logService.e(">> request enable notify <<")
    })
  }

  build() {
    Column({ space: 20 }) {
      TitleBar({ title: '通知测试' })

      Button('发送通知')
        .onClick(() => {
          this.pushNotification()
        })
        .width('60%')

      Button('进度条通知')
        .onClick(() => {
          this.pushProgressNotification()
        })
        .width('60%')

      Button('更新通知栏进度')
        .onClick(() => {
          if(this.value > 0){
            return
          }
          let id = setInterval(()=>{
            this.value++
            this.pushProgressNotification()
            if(this.value>=100){
              clearInterval(id)
            }
          }, 300)
        })
        .width('60%')

      Button('取消通知 by id')
        .onClick(() => {
          notificationManager.cancel(1)//按通知id取消
          // notificationManager.cancelAll()
        })
        .width('60%')

      Button('取消全部通知')
        .onClick(() => {
          notificationManager.cancelAll()
        })
        .width('60%')
    }
    .height(FULL_HEIGHT)
  }

  async pushNotification() {

    let wantAgentObj = await wantAgent.getWantAgent({
      wants: [//可以拉起UIAbility， 也可以发布公共事件
        {
          action: 'event_name', // 设置事件名
          parameters: {},
        }
      ],
      operationType: wantAgent.OperationType.SEND_COMMON_EVENT,
      requestCode: 100,
      wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG],
    })

    logService.e(">>> push notification <<< wantAgentObj = " + wantAgentObj)
    let notificationRequest: notificationManager.NotificationRequest = {
      id: 1, //通知id
      //SlotType.SOCIAL_COMMUNICATION：社交类型，状态栏中显示通知图标，有横幅和提示音。
      // SlotType.SERVICE_INFORMATION：服务类型，状态栏中显示通知图标，没有横幅但有提示音。
      // SlotType.CONTENT_INFORMATION：内容类型，状态栏中显示通知图标，没有横幅或提示音。
      // SlotType.OTHER_TYPES：其它类型，状态栏中不显示通知图标，没有横幅或提示音。
      notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: "通知内容标题",
          text: '通知内容详情',
          additionalText: "通知附加内容"
        }
      },
      wantAgent: wantAgentObj
    }

    // 需要有通知权限才能收到通知
    //todo 如何打印发送通知失败信息
    notificationManager.publish(notificationRequest)
      .then(() => { // 发布通知
        toast.show('发送通知')
      })
  }

  async isSupportProgressNotify() {
    return await notificationManager.isSupportTemplate('downloadTemplate')
  }

  async pushProgressNotification(){
    let isSupportTpl:boolean = await this.isSupportProgressNotify()
    logService.e(">>>> isSupport = " + isSupportTpl)
    if(!isSupportTpl){
      toast.show("不支持进度条模版通知")
      return
    }

    let notificationRequest: notificationManager.NotificationRequest = {
      id: 2, //通知id
      notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: "文件下载",
          text: 'senTemplate',
          additionalText: "60%"
        }
      },
      showDeliveryTime: true,
      template: {
        name: "downloadTemplate",
        data: {
          title: '标题：',
          fileName: 'music.mp4',
          progressValue: this.value,
          progressMaxValue:100,
        }
      }
    }
    notificationManager.publish(notificationRequest).then(()=>{
    })
  }
}