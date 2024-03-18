import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import logService from '../common/utils/LogService';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logService.i('Ability onCreate')
  }

  onDestroy(): void {
    logService.i('Ability onDestroy')
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logService.e('>>>>>> mainAbility onNewIntent <<<<<<')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    logService.i('Ability onWindowStageCreate')

    windowStage.loadContent('pages/boot/SplashPage', (err, data) => {
      if (err.code) {
        logService.e('Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '')
        return;
      }
      logService.i('Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '')
    });

    //设置状态栏属性
    windowStage.getMainWindowSync().setWindowSystemBarProperties({
      statusBarColor: "#ff0000"
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    logService.i('Ability onWindowStageDestroy')
  }

  onForeground(): void {
    // Ability has brought to foreground
    logService.i('Ability onForeground')
  }

  onBackground(): void {
    // Ability has back to background
    logService.i('Ability onBackground')
  }
}
