import React, { Component } from 'react'
import {
    StyleSheet,
    TouchableOpacity,
    Text
} from "react-native"
import { themeStyles } from './../../styles/theme'
import PropTypes from 'prop-types'
import { computeSize } from './../../styles/computeSize'

export default class XButton extends Component {

    // 属性声名
    static propTypes = {
        text: PropTypes.string, // 按钮文案，默认为确定
        buttonState: PropTypes.bool, // 按钮状态，true为可以点击，false为不能点击
        onClick: PropTypes.func // 点击事件
    }

    // 默认属性
    static defaultProps = {
        buttonState: true,
        text: '确定',
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
     * 按钮点击事件；如果按钮状态为false，则不能点击
     * @private
     */
    _onPress () {
        // 当按钮状态为false的时候，表示信息还未填写完整，此时点击无效
        if (!this.props.buttonState) {
            return
        }
        this.props.onClick()
    }

    render() {
        return (
            <TouchableOpacity
                style={[styles.xButton, this.props.styles, {backgroundColor: this.props.buttonState ? themeStyles.themeColor : themeStyles.themeOpacityColor}]}
                onPress={this._onPress.bind(this)}
            >
                <Text style={{color: '#fff', fontSize: computeSize(34)}}>
                    {this.props.text}
                </Text>
            </TouchableOpacity>
        )
    }
}

const styles = StyleSheet.create({
    xButton: {
        justifyContent: 'center',
        alignItems: 'center',
        width: computeSize(610),
        height: computeSize(88),
        borderRadius: computeSize(44),
        backgroundColor: themeStyles.themeColor
    }
})
