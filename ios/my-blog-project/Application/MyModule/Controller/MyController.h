//
//  MyController.h
//  my-blog-project
//
//  Created by 张城 on 2018/1/18.
//  Copyright © 2018年 张城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSArray *listArray;

@property (nonatomic, strong) UITableView *myModuleTableView; // 我的模块中的tableView

@end
