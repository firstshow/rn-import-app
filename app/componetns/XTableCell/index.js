import React, { Component } from 'react'
import {
    StyleSheet,
    TouchableOpacity,
    Text,
    Image,
    View
} from "react-native"
import { themeStyles } from './../../styles/theme'
import PropTypes from 'prop-types'
import { computeSize } from './../../styles/computeSize'

export default class XTableCell extends Component {

    // 属性声名
    static propTypes = {
        icon: PropTypes.any, // cell 图标，默认是没有
        title: PropTypes.string, // cell 标题
        subTitle: PropTypes.string, // cell 副标题
        isLink: PropTypes.bool, // 是否是操作cell，如果是的话，右边会显示右箭头，并且点击会有透明度变化
        hasBorder: PropTypes.bool, // 是否底边有边框
        onClick: PropTypes.func // 点击事件
    }

    // 默认属性
    static defaultProps = {
        icon: '',
        title: '标题',
        subTitle: '副标题',
        isLink: false,
        hasBorder: false,
        onClick: () => {}
    }

    constructor(props) {
        super(props)
        this.state = {
            text:'确定',
            disabled: false // 按钮是否可用
        }
    }

    /**
     * 渲染标题左边的icon
     * @returns {XML}
     * @private
     */
    _renderIcon () {
        if (this.props.icon) {
            return (
                <Image
                    source={this.props.icon}
                    style={styles.xCellIcon}
                />
            )
        }
    }

    /**
     * 渲染最右边的箭头图标，isLInk为true，则显示；不然则没有
     * @returns {XML}
     * @private
     */
    _renderArrowIcon () {
        if (this.props.isLink) {
            return (
                <Image
                    source={require('../../../res/images/img_public_icon/right_arrow_icon.png')}
                    style={styles.xCellArrowIcon}
                />
            )
        }
    }

    _onPress () {
        // 当按钮状态为false的时候，表示信息还未填写完整，此时点击无效
        if (!this.props.isLink) {
            return
        }
        this.props.onClick()
    }

    render() {
        return (
            <TouchableOpacity
                // 如果是isLink为true，则有透明度变化的点击效果；不然是纯展示
                activeOpacity={this.props.isLink ? 0.5 : 1}
                style={[styles.xTableCell, this.props.styles]}
                onPress={this._onPress.bind(this)}
            >
                <View style={[styles.xCellBox, this.props.hasBorder ? styles.xCellBorder : null]}>
                    <View style={styles.xCellTitle}>
                        {
                            this._renderIcon.apply(this)
                        }
                        <Text style={styles.xCellTitleText}>
                            {this.props.title}
                        </Text>
                    </View>

                    <View style={styles.xCellTitle}>
                        <Text style={styles.xCellSubTitleText}> {this.props.subTitle}</Text>
                        {
                            this._renderArrowIcon.apply(this)
                        }
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

const styles = StyleSheet.create({
    xTableCell: {
        width: computeSize(750),
        backgroundColor: '#fff'
    },
    xCellBox: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        marginLeft: computeSize(30),
        paddingTop: computeSize(34),
        paddingRight: computeSize(30),
        paddingBottom: computeSize(34),
    },
    xCellIcon: {
        width: computeSize(40),
        height: computeSize(40),
        marginRight: computeSize(30),
        tintColor:'#007aff'
    },
    xCellTitle: {
        flexDirection: 'row',
        alignItems: 'center'
    },
    xCellTitleText: {
        color: themeStyles.defaultTextColor,
        fontSize: computeSize(32),
    },
    xCellSubTitleText: {
        color: themeStyles.subTitleTextColor,
        fontSize: computeSize(32)
    },
    xCellArrowIcon: {
        width: computeSize(15),
        height: computeSize(28),
        marginLeft: computeSize(10)
    },
    xCellBorder: {
        borderBottomWidth: 1,
        borderBottomColor: themeStyles.borderColor
    }
})
