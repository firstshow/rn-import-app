import { AppRegistry, YellowBox } from 'react-native'
import App from './app/App'
import {name as appName} from './app.json'

// 报警告：isMounted(...)is deprecated in plain JavaScript React classes 出现此错误提示的原因是源代码内有已被React舍弃的代码，但此并不影响程序运行
YellowBox.ignoreWarnings(['Warning: isMounted(...) is deprecated', 'Module RCTImageLoader'])
YellowBox.ignoreWarnings(['Class RCTCxxModule'])
YellowBox.ignoreWarnings(['Remote debugger'])

AppRegistry.registerComponent(appName, () => App)