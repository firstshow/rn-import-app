import React, { Component } from "react"
import {
    StyleSheet
} from 'react-native'

import { createStackNavigator, createAppContainer} from "react-navigation"
import StackViewStyleInterpolator from "react-navigation-stack/dist/views/StackView/StackViewStyleInterpolator"
import HomeScreen from "./pages/Home/index"
import BillDetailScreen from "./pages/BillDetail/index"
import { themeStyles } from './styles/theme'
import { computeSize } from './styles/computeSize'
import codePush from "react-native-code-push";

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

let Root = createAppContainer(MainScreen)

export default class App extends Component {
    constructor(props) {
        super(props)
    }

    componentDidMount () {
        codePush.sync()
    }

    render () {
        const testStr = 'asdadasdad'
        console.log('1235555', this.props.images)

        return (
            <Root state={testStr} />
        )
    }
}