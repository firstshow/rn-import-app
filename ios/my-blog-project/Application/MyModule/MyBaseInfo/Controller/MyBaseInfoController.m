//
//  MyBaseInfoController.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/18.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "MyBaseInfoController.h"
#import "MyBaseInfoView.h"

@interface MyBaseInfoController ()

@end

@implementation MyBaseInfoController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadChildView];
    
}

-(void)loadChildView{
    MyBaseInfoView *myBaseInfoView = [[MyBaseInfoView alloc] initWithFrame:CGRectMake(0, StateBarHeight + NavigationBarHeight, ScreenWidth, ScreenHeight - StateBarHeight - NavigationBarHeight)];
    [self.view addSubview:myBaseInfoView];
}

@end
