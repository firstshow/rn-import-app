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
    Image,
    ImageBackground,
    SectionList,
    TouchableOpacity,
    NativeModules,
    Alert
} from 'react-native'
import { publicStyles } from './../../styles/public'
import { computeSize } from './../../styles/computeSize'
import {themeStyles} from '../../styles/theme'
import codePush from "react-native-code-push";

// 首先获取指定原生模块 前面的Push可随意命名，后面的PushNative必须和iOS导出的模块名一致。
var Push = NativeModules.MyController

export default class Home extends Component {
    static navigationOptions = {
        title: '记账222',
        //drawerLabel:'页面1'
    }

    constructor(props) {
        super(props)
        this.state = {
            isRefreshing: true, // 是否在刷新
            canLoadMore: false, // 是否可以上拉加载
            isLoadMore: false, // 是否在上拉加载
            list: [
                {title: '2019-03-20', data: ['777.00', '222.00', '333.00', '444.00']},
                {title:  '2019-03-19', data: ['2231.00', '123.00', '213.00', '2143.00', '1223.00', '532.00', '765.00']},
            ]
        }
    }

    componentDidMount () {
        // 假设第一次进入，加载列表数据的异步请求
        setTimeout(() => {
            this.setState({
                isRefreshing: false,
                canLoadMore: true
            })
        }, 1000)
    }

    /**
     * 渲染列表项
     * @param item 每一项的数据
     * @private
     */
    _renderItem ({item}) {
        const navigate = this.props.navigation
        return (
            <TouchableOpacity
                style={styles.xListItemBox}
                onPress={() => {
                    if (item == '222.00') {
                        this.checkVersion.bind(this)
                    } else {
                        navigate.navigate('BillDetail')
                    }

                }}
            >
                <View style={styles.xListItemInnerBox}>
                    <View style={styles.xItemHead}>
                        <Image
                            source={require('../../../res/images/ic_favorite.png')}
                            style={styles.xItemIcon}
                        />
                        <Text style={styles.xItemMoney}>
                            ¥ {item}
                        </Text>
                    </View>
                    <Text style={styles.xItemTime}>19:09:55</Text>
                </View>
            </TouchableOpacity>
        )
    }

    /**
     * 渲染列表组的label
     * @param section
     * @returns {XML}
     * @private
     */
    _renderSectionHeader ({section}) {
        return (
            <View　style={styles.xListGroupHeadLabelBox}>
                <Text stytle={styles.xListGroupHeadLabelText}>{section.title}</Text>
            </View>
        )
    }

    _listFooterComponent () {
        if (this.state.isLoadMore) {
            return <Text>加载中...</Text>
        }

        return <Text>没有更多了</Text>
    }

    /**
     * 下拉刷新
     * @private
     */
    _refresh () {
        console.log('下拉刷新')
        this.setState({
            isRefreshing: true
        })

        setTimeout(() => {
            this.setState({
                isRefreshing: false,
            })
        }, 2000)
    }

    /**
     * 上拉加载
     * @private
     */
    _endReached () {
        if (!this.state.canLoadMore) return true

        console.log('上拉加载')
        let data = this.state.list.concat([{title: '2019-03-20', data: ['111.00', '222.00', '333.00', '444.00']}])
        this.setState({
            isLoadMore: true,
            canLoadMore: false,
        })
        setTimeout(() => {
            this.setState({
                isLoadMore: false,
                canLoadMore: true,
                list: data
            })
        }, 2000)
    }

    /**
     * alert弹框
     * @param content
     */
    xAlert (content) {
        Alert.alert(
            '提示',
            content,
            [
                /**
                 *  注意参数名字一定不能错
                 */
                {text: '确定', onPress: ()=> console.log('点击确定')}
            ]
        )
    }

    checkVersion () {
        console.log('检测更新')
        codePush.checkForUpdate()
            .then( (update) =>{
                console.log('检测更新ing')
                if( !update ){
                    this.xAlert('已经最新了')
                }else {
                    this.xAlert('有更新了')
                }
            }).catch( error => {
            this.xAlert(String(error))
        })
    }

    render() {
        return (
            <View style={publicStyles.container}>
                <ImageBackground
                    source={require('../../../res/images/img_home_page/home_head_back_img.jpg')}
                    style={publicStyles.xHeadBox}
                >
                    <Text style={publicStyles.xHeadBoxTitle}>今日记账总额（元）</Text>
                    <Text style={publicStyles.xHeadBoxContent}>1999.00</Text>
                </ImageBackground>
                <SectionList
                    style={{flex: 1}}
                    sections={this.state.list}
                    keyExtractor={item => item}
                    renderItem={this._renderItem.bind(this)}
                    renderSectionHeader={this._renderSectionHeader}
                    ListFooterComponent={this._listFooterComponent.bind(this)}
                    // 下拉刷新
                    refreshing={this.state.isRefreshing}
                    onRefresh={this._refresh.bind(this)}
                    // 上拉加载
                    onEndReachedThreshold={0.5}
                    onEndReached={this._endReached.bind(this)}
                ></SectionList>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    xListItemBox: {
        width: computeSize(750),
        paddingTop: computeSize(24),
        paddingLeft: computeSize(32),
        backgroundColor: '#fff'
    },
    xListItemInnerBox: {
        flexDirection: 'row',
        flex: 1,
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingBottom: computeSize(24),
        borderBottomWidth: 1,
        borderBottomColor: themeStyles.borderColor
    },
    xItemHead: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    xItemIcon: {
        width: computeSize(60),
        height: computeSize(60),
        marginRight: computeSize(30),
        tintColor:'#007aff'
    },
    xItemMoney: {
        color: themeStyles.defaultTextColor,
        fontSize: computeSize(28),
        fontWeight: 'bold'
    },
    xItemTime: {
        marginRight: computeSize(30),
        color: themeStyles.tipTextColor,
        fontSize: computeSize(30)
    },
    xListGroupHeadLabelBox: {
        paddingTop: computeSize(20),
        paddingBottom: computeSize(20),
        paddingLeft: computeSize(30),
        backgroundColor: themeStyles.backgroundColor
    },
    xListGroupHeadLabelText: {
        color: themeStyles.tipTextColor,
        fontSize: computeSize(24)
    }
})
