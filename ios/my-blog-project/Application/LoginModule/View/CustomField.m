//
//  CustomField.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/16.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "CustomField.h"

@implementation CustomField

// 输入框下边框
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithHexString:@"#ccc"].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}

// 控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 40 , 0 );
}

// 控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 40 , 0 );
}

@end
