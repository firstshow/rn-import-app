//
//  HomeView.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/17.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubView];
    }
    return self;
}

- (void)loadSubView{
    UILabel * label = [[UILabel alloc] init];
    
    label.text = @"我是首页";
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(30);
        make.left.equalTo(self.mas_left).offset(30);
    }];
}

@end
