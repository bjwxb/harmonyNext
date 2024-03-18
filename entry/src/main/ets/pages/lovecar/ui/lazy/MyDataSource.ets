/**
 * Created on 2024/3/16.
 * Auth: wuxiaobo
 * Desc:
 */

class BasicDataSource implements IDataSource{
  private listeners:DataChangeListener[] = []
  private originDataArray:string[] = []

  totalCount(): number {
    return this.originDataArray.length
  }

  getData(index: number): string {
    return this.originDataArray[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if(this.listeners.indexOf(listener) < 0){
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if(pos >=0){
      this.listeners.splice(pos, 1)
    }
  }

  notifyDataAdd(index:number):void{
    this.listeners.forEach((l) => {
      l.onDataAdd(index)
    })
  }

  notifyDataChange(index:number):void{
    this.listeners.forEach(l => {
      l.onDataChange(index)
    })
  }

  notifyDataDelete(index:number):void{
    this.listeners.forEach(l=>{
      l.onDataDelete(index)
    })
  }
}

export class MyDataSource extends BasicDataSource{
  private dataArray:string[] = []

  public totalCount(): number {
    return this.dataArray.length
  }

  getData(index: number): string {
    return this.dataArray[index]
  }

  addData(index:number, data:string){
    this.dataArray.splice(index, 0, data)
    this.notifyDataAdd(index)
  }

  pushData(data:string){
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length - 1)
  }
}