/**
 * Created on 2024/3/13.
 * Auth: wuxiaobo
 * Desc:
 */

export interface NevItemBean {
  icon: Resource
  iconSelected: Resource
  text: ResourceStr
  id: number
}

export enum TabId {
  HOME,
  CAR,
  MALL,
  MINE
}

export const nevList: NevItemBean[] = [
  {
    icon: $r('app.media.tab_home_normal'),
    iconSelected: $r('app.media.tab_home_selected'),
    text: '首页',
    id: TabId.HOME
  },
  {
    icon: $r('app.media.tab_mall_normal'),
    iconSelected: $r('app.media.tab_mall_selected'),
    text: '爱车',
    id: TabId.CAR
  },
  {
    icon: $r('app.media.tab_mall_normal'),
    iconSelected: $r('app.media.tab_mall_selected'),
    text: '商城',
    id: TabId.MALL
  },
  {
    icon: $r('app.media.tab_mine_normal'),
    iconSelected: $r('app.media.tab_mine_selected'),
    text: '我的',
    id: TabId.MINE
  }
]