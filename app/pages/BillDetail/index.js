/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react'
import {
    StyleSheet,
    View,
    Text,
    NativeModules, // 导入原生模块集，它包含iOS端通过RCT_EXPORT_MODULE()导出的所有模块。
    // NativeAppEventEmitter
} from 'react-native'

import XTableCell from './../../componetns/XTableCell'
import XButton from './../../componetns/XButton'
import LinearGradient from 'react-native-linear-gradient'
import { publicStyles } from './../../styles/public'
import { computeSize } from './../../styles/computeSize'

// 首先获取指定原生模块 前面的Push可随意命名，后面的PushNative必须和iOS导出的模块名一致。
var Push = NativeModules.MyController

export default class BillDetail extends Component {
    static navigationOptions = {
        title: '记账',
        //drawerLabel:'页面1'
    }

    constructor(props) {
        super(props)
    }

    _delBill () {
        const navigate = this.props.navigation

        // // 调用iOS原生方法传值
        // Push.RNPushToNativeController('RN跳转Native')

        // 调用IOS放生方法，做回调
        Push.RNCallback(
            {'name':'good','description':'http://www.lcode.org'},
            (error,events)=>{
                if(error){
                    console.error('失败', error)
                }else{
                    console.log('成功', events)
                }
            }
        )

        navigate.goBack()
    }

    render() {

        return (
            <View style={publicStyles.container}>
                <LinearGradient colors={["#4D97F5", "#4DB0F5"]} style={publicStyles.xHeadBox}>
                    <Text style={publicStyles.xHeadBoxTitle}>今日记账总额（元）</Text>
                    <Text style={publicStyles.xHeadBoxContent}>1999.00</Text>
                </LinearGradient>
                <XTableCell
                    title="记账时间"
                    subTitle="2019-09-09 11:00:22"
                ></XTableCell>
                <XTableCell
                    title="支付方式"
                    subTitle="现金"
                ></XTableCell>
                <XTableCell
                    title="记账备注"
                    subTitle="暂无备注"
                ></XTableCell>

                <XButton
                    text="删除账单"
                    styles={{marginTop: computeSize(380)}}
                    onClick={this._delBill.bind(this)}
                ></XButton>
            </View>
        )
    }
}

const styles = StyleSheet.create({

})
