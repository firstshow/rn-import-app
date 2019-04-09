//
//  MyView.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/18.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@end

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubView];
    }
    return self;
}

-(void)loadSubView{
//    UILabel * label = [[UILabel alloc] init];
//
//    label.text = @"我是我的页面";
//    [self addSubview:label];
//
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(30);
//        make.left.equalTo(self.mas_left).offset(30);
//    }];
//
//    self.loginButton = [[UIButton alloc] init];
//    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
//    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:NomalFont];
//    self.loginButton.backgroundColor = [UIColor colorWithHexString:DisabledColor];
//    self.loginButton.layer.cornerRadius = 4;
//    [self addSubview:self.loginButton];
//
//    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(@(300*WidthScale));
//        make.height.mas_equalTo(@(40*WidthScale));
//        make.top.equalTo(self.mas_top).offset(100*WidthScale);
//        make.centerX.equalTo(self.mas_centerX);
//    }];
//
//    self.loginOutButton = [[UIButton alloc] init];
//    [self.loginOutButton setTitle:@"退出" forState:UIControlStateNormal];
//    self.loginOutButton.titleLabel.font = [UIFont systemFontOfSize:NomalFont];
//    self.loginOutButton.backgroundColor = [UIColor colorWithHexString:DisabledColor];
//    self.loginOutButton.layer.cornerRadius = 4;
//    [self addSubview:self.loginOutButton];
//
//    [self.loginOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(@(300*WidthScale));
//        make.height.mas_equalTo(@(40*WidthScale));
//        make.top.equalTo(self.loginButton.mas_bottom).offset(100*WidthScale);
//        make.centerX.equalTo(self.mas_centerX);
//    }];
}
@end
