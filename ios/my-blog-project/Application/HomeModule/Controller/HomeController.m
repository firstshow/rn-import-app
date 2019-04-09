//
//  HomeController.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/17.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "HomeController.h"
#import "HomeView.h"

@interface HomeController ()<UITextViewDelegate>

@property (nonatomic, strong) HomeView *homeView;
@property (nonatomic, strong) UIButton *loginButton; // 登录按钮

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    [self loadChildView];
}

-(void)loadChildView{
    HomeView *homeView = [[HomeView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:homeView];
}


@end
