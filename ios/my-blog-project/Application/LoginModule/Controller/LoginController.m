//
//  LoginController.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/16.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"
#import "HomeController.h"

@interface LoginController ()<UITextViewDelegate>

@property (nonatomic, strong)LoginView *loginView; // 备注的View
@property (nonatomic, strong)NSString *username;
@property (nonatomic, strong)NSString *password;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadChildView];
}

-(void)loadChildView {
    NSLog(@"你好啊");
    self.loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.loginView];
    
    // 给关闭登陆页面按钮增加登录事件
    [self.loginView.closeButton addTarget:self action:@selector(closeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    // 给用户名输入框增加改变事件
    [self.loginView.userTextField addTarget:self action:@selector(userTextFieldChangeAction:) forControlEvents:UIControlEventAllEditingEvents];
    
    // 给密码输入框增加改变事件
    [self.loginView.passTextField addTarget:self action:@selector(passTextFieldChangeAction:) forControlEvents:UIControlEventAllEditingEvents];
    
    // 给登录按钮增加登录事件
    [self.loginView.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)closeButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 监听账号输入框改变事件
 @param textField 改变的值
 */
-(void)userTextFieldChangeAction:(UITextField *) textField{
    NSString *value = textField.text;
    NSLog(@"改变了,%@",value);
    self.username = value;
    [self checkCanLogin];
}

/**
 监听密码输入框改变事件
 @param textField 改变的值
 */
-(void)passTextFieldChangeAction:(UITextField *) textField{
    NSString *value = textField.text;
    NSLog(@"改变了,%@",value);
    self.password = value;
    [self checkCanLogin];
}


/**
 监测是否可以进行登录操作
 当输入了账号，并且密码符合规范，则登录按钮变成主题色，可以进行点击登录
 如果没有符合规则，则登录按钮置灰
 return YES:能登录了； NO：不能登录
 */
-(Boolean)checkCanLogin {
    if(self.username.length > 6 && self.password.length > 6) {
        self.loginView.loginButton.backgroundColor = [UIColor colorWithHexString: ThemeColor];
        return YES;
    } else {
        self.loginView.loginButton.backgroundColor = [UIColor colorWithHexString: DisabledColor];
        return NO;
    }
}

/**
 登录
 */
-(void)loginAction
{
    Boolean canLogin = [self checkCanLogin];
    if(canLogin){
        [self closeButtonAction];
    } else {
        NSLog(@"登录失败");
    }
}

@end
