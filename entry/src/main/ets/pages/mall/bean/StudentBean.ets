/**
 * Created on 2024/3/14.
 * Auth: wuxiaobo
 * Desc:
 */
export class Student{
  name:string
  age:number
  action:ActionA

  constructor(name:string, age:number, action:ActionA) {
    this.name = name
    this.age = age
    this.action = action
  }
}

@Observed
export class ActionAArray extends Array<ActionA>{

}

@Observed
export class ActionA {
  public score:number
  public va:string
  constructor(score:number, va:string) {
    this.score = score
    this.va = va
  }
}