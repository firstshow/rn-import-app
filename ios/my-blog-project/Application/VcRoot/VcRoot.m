//
//  VcRoot.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/17.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "VcRoot.h"
#import "HomeController.h"

@implementation VcRoot

-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor yellowColor];
    // 设置导航栏的标题
    self.title = @"你好啊";
    // 设置导航栏是不透明的
    self.navigationController.navigationBar.translucent = NO;
    // 设置导航栏的风格
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    // 设置导航栏的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:ThemeColor];
    // 设置导航栏中左右两侧按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:NomalColor];
    
    // 添加左侧导航按钮
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    // 添加右侧导航按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    // 添加自定义，多按钮
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 40)];
    label.text = @"test";
    
    UIBarButtonItem *custom = [[UIBarButtonItem alloc] initWithCustomView:label];
    NSArray *arry = [NSArray arrayWithObjects:rightBarButton,custom,nil];
    self.navigationItem.rightBarButtonItems = arry;
    
    self.navigationController.toolbarHidden = NO;
    
}

-(void)leftBarButtonAction {
    NSLog(@"点击了按钮");
}

-(void)rightBarButtonAction {
    HomeController *home = [[HomeController alloc] init];
    [self.navigationController pushViewController:home animated:YES];
    
}


@end
