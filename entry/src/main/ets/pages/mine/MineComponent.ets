import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'

/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */
@Component
export struct MineComponent{

  build() {

    Column(){
      Text('mine page')
    }
    .justifyContent(FlexAlign.Center)
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}