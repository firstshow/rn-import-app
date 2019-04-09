import {
    StyleSheet
} from 'react-native'
import { themeStyles } from './theme'
import { computeSize } from './computeSize'

export const publicStyles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'flex-start',
        alignItems: 'center',
        backgroundColor: themeStyles.backgroundColor
    },
    // 首页与账单详情头部盒子的样式，如果此处改动会影响两边，改动请慎重
    xHeadBox: {
        alignItems: 'center',
        width: computeSize(750),
        height: computeSize(280)
    },
    // 首页与账单详情头部标题的样式，如果此处改动会影响两边，改动请慎重
    xHeadBoxTitle: {
        marginTop: computeSize(50),
        color: '#fff',
        fontSize: computeSize(28),
        opacity: .7
    },
    // 首页与账单详情头部金额的样式，如果此处改动会影响两边，改动请慎重
    xHeadBoxContent: {
        marginTop: computeSize(40),
        color: '#fff',
        fontSize: computeSize(72)
    },
})