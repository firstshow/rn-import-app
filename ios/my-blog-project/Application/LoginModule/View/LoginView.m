//
//  LoginView.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/16.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "LoginView.h"
#import "CustomField.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubView];
    }
    return self;
}

- (void)loadSubView{
    [self initCloseButton];
    [self initLogo];
    [self initUserTextField];
    [self initLoginButton];
}


/**
 关闭登陆页面
 */
-(void)initCloseButton{
    self.closeButton = [[UIButton alloc] init];
    [self.closeButton setTitle:@"退出" forState:UIControlStateNormal];
    self.closeButton.titleLabel.font = [UIFont systemFontOfSize:NomalFont];
    [self.closeButton setTitleColor:[UIColor colorWithHexString: NomalColor] forState:UIControlStateNormal];
    self.closeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:self.closeButton];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(StateBarHeight);
        make.left.equalTo(self.mas_left).offset(10*WidthScale);
        make.width.mas_equalTo(@(60*WidthScale));
        make.height.mas_equalTo(@(30*WidthScale));
    }];
}

/**
 初始化布局logo
 */
-(void)initLogo {
    self.appLogoImageView = [[UIImageView alloc] init];
    [self.appLogoImageView setImage:[UIImage imageNamed:@"logo_img"]];
    
    [self addSubview:self.appLogoImageView];
    [self.appLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(150*WidthScale);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(@(75*WidthScale));
        make.height.mas_equalTo(@(75*WidthScale));
    }];
}

/**
 初始化账号、密码输入框
 */
-(void)initUserTextField {
    
    // 账号输入框
    self.userTextField = [[CustomField alloc] init];
    self.userTextField.backgroundColor = [UIColor whiteColor];
    self.userTextField.placeholder = @"请输入用户名";
    [self addSubview:self.userTextField];
    
    [self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appLogoImageView.mas_bottom).offset(50*WidthScale);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(@(300*WidthScale));
        make.height.mas_equalTo(@(40*WidthScale));
    }];
    
    // 账号输入框图标
    self.userTextFieldIcon = [[UIImageView alloc] init];
    [self.userTextFieldIcon setImage:[UIImage imageNamed:@"login_user_icon"]];
    
    [self addSubview:self.userTextFieldIcon];
    [self.userTextFieldIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userTextField.mas_centerY);
        make.left.equalTo(self.userTextField.mas_left);
        make.width.mas_equalTo(@(25*WidthScale));
        make.height.mas_equalTo(@(27*WidthScale));
    }];
    
    // 密码输入框
    self.passTextField = [[CustomField alloc] init];
    self.passTextField.backgroundColor = [UIColor whiteColor];
    self.passTextField.placeholder = @"请输入密码";
    [self addSubview:self.passTextField];
    
    [self.passTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userTextFieldIcon.mas_bottom).offset(30*WidthScale);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(@(300*WidthScale));
        make.height.mas_equalTo(@(40*WidthScale));
    }];
    
    // 密码输入框图标
    self.passTextFieldIcon = [[UIImageView alloc] init];
    [self.passTextFieldIcon setImage:[UIImage imageNamed:@"login_pass_icon"]];
    
    [self addSubview:self.passTextFieldIcon];
    [self.passTextFieldIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passTextField.mas_centerY);
        make.left.equalTo(self.userTextField.mas_left);
        make.width.mas_equalTo(@(25*WidthScale));
        make.height.mas_equalTo(@(27*WidthScale));
    }];
}


/**
 初始化登录按钮
 */
-(void)initLoginButton {
    self.loginButton = [[UIButton alloc] init];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:NomalFont];
    self.loginButton.backgroundColor = [UIColor colorWithHexString:DisabledColor];
    self.loginButton.layer.cornerRadius = 4;
    [self addSubview:self.loginButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(300*WidthScale));
        make.height.mas_equalTo(@(40*WidthScale));
        make.top.equalTo(self.passTextField.mas_bottom).offset(30*WidthScale);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

@end
