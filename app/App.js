import React, { Component } from "react"
import {
    StyleSheet,
    View,
    Text,
    Alert
} from 'react-native'

import { createStackNavigator, createAppContainer} from "react-navigation"
import StackViewStyleInterpolator from "react-navigation-stack/dist/views/StackView/StackViewStyleInterpolator"
import HomeScreen from "./pages/Home/index"
import BillDetailScreen from "./pages/BillDetail/index"
import { themeStyles } from './styles/theme'
import { computeSize } from './styles/computeSize'
import codePush from "react-native-code-push"

// 二级导航
const MainScreen = createStackNavigator({
    Home: HomeScreen,
    BillDetail: BillDetailScreen
}, {
    initialRouteName: 'Home', // 设置默认的页面
    initialRouteParams: {aa: 212313},
    // 设置header默认样式
    defaultNavigationOptions: {
        headerStyle: {
            backgroundColor: themeStyles.themeColor,
            height: computeSize(88),
            borderBottomWidth: 0
        },
        headerTintColor: "#fff",
        headerTitleStyle: {
            fontSize: 18
        }
    },
    // 设置转场动画效果（安卓实现类似iOS的push动画)    来源： https://www.jianshu.com/p/dc9df5826651
    transitionConfig: () => ({
        screenInterpolator: StackViewStyleInterpolator.forHorizontal,
        transitionSpec: {
            duration: 300,
        },
    })
})

const styles = StyleSheet.create({
    tabItemImageStyle:{
        width:24,
        height:24
    }
})

let codePushOptions = {
    //设置检查更新的频率
    //ON_APP_RESUME APP恢复到前台的时候
    //ON_APP_START APP开启的时候
    //MANUAL 手动检查
    checkFrequency : codePush.CheckFrequency.ON_APP_RESUME
};

let Root = createAppContainer(MainScreen)

class App extends Component {
    constructor(props) {
        super(props)
        this.state = {
            progress: {
                receivedBytes: 0,
                totalBytes: 0
            }
        }
    }

    componentWillMount() {
        this.syncImmediate(); //开始检查更新
    }


    componentDidMount() {
        codePush.notifyAppReady()
    }

    //如果有更新的提示
    syncImmediate() {
        codePush.sync(
            {
                updateDialog: {
                    appendReleaseDescription: true,
                    descriptionPrefix:'\n\n更新内容：aswdsad\n',
                    title:'更新',
                    mandatoryUpdateMessage:'',
                    mandatoryContinueButtonLabel:'更新',
                },
                mandatoryInstallMode:codePush.InstallMode.IMMEDIATE,
                deploymentKey: 'afqk49NRa1Czzsfb963InLOVKIcQ97ebed02-f289-433b-a079-4199a723bdb0',
            },
            (status) => {
                // 0：最新的；1：更新安装完成；2：更新忽略；3：未知错误；4：正在同步；5:检测更新中；6：等待用户操作；7：下载安装包中
                Alert.alert(
                    'Alert提示 标题',
                    String(status),
                    [
                        /**
                         *  注意参数名字一定不能错
                         */
                        {text: '确定', onPress: ()=> console.log('点击确定')}
                    ]
                );
            },
            (progress) => {
                console.log();
                Alert.alert(
                    'Alert提示 标题',
                    progress.receivedBytes + " of " + progress.totalBytes + " received.",
                    [
                        /**
                         *  注意参数名字一定不能错
                         */
                        {text: '确定', onPress: ()=> console.log('点击确定')}
                    ]
                );
            }
        )
    }

    render () {
        return (
            <Root />
        )
    }
}

// 这一行必须要写
App = codePush(codePushOptions)(App)

export default App