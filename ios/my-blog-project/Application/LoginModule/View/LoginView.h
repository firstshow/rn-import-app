//
//  LoginView.h
//  my-blog-project
//
//  Created by 张城 on 2018/1/16.
//  Copyright © 2018年 张城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (nonatomic, strong) UIButton *closeButton; // 关闭登陆页面按钮
@property (nonatomic, strong) UIImageView *appLogoImageView; // 登录页面logo
@property (nonatomic, strong) UIImageView *userTextFieldIcon; // 账号输入框图标
@property (nonatomic, strong) UITextField *userTextField; // 账号输入框
@property (nonatomic, strong) UIImageView *passTextFieldIcon; // 密码输入框图标
@property (nonatomic, strong) UITextField *passTextField; // 密码输入框
@property (nonatomic, strong) UIButton *loginButton; // 登录按钮

@end
