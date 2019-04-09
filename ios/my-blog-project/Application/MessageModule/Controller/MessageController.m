//
//  MessageController.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/18.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "MessageController.h"
#import "MessageView.h"

@interface MessageController ()

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self loadChildView];
}

-(void)loadChildView{
    MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:messageView];
}

@end
