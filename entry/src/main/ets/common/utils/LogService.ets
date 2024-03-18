import hilog from '@ohos.hilog'

/**
 * hilog封装
 */
class LogService{

  private domain: number;
  private tag: string;

  private format: string = '%{public}s, %{public}s';

  constructor(tag: string = 'melonApp', domain: number = 0x01) {
    this.tag = tag;
    this.domain = domain;
  }

  i(...args: string[]):void {
    // hilog.info(this.domain, this.tag, this.format, args)
    console.info(this.tag, args)
  }

  d(...args: string[]):void {
    // hilog.debug(this.domain, this.tag, this.format, args)
    console.debug(this.tag, args)
  }

  e(...args: string[]):void {
    // hilog.error(this.domain, this.tag, this.format, args)
    console.error(this.tag, args)
  }
}

let logService = new LogService();

export default logService
