import promptAction from '@ohos.promptAction'

// Created on 2024/3/12.
// Auth: wuxiaobo
// Desc: toast
class Toast {

  show(msg:string) {
    promptAction.showToast({message: msg})
  }
}

let toast = new Toast()

export default toast
