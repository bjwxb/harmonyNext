/**
 * Created on 2024/3/15.
 * Auth: wuxiaobo
 * Desc:
 */

class ClassA{
  public c:number

  constructor(c:number) {
    this.c = c
  }
}

@Observed
class classB{
  public a: ClassA
  public b: number

  constructor(a:ClassA, b:number) {
    this.a = a
    this.b = b
  }
}