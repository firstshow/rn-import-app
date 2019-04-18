//
//  MyController.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/18.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "MyController.h"
#import "MyView.h"
#import "MyBaseInfoController.h"
#import "LoginController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridgeModule.h>
#import "CustomViewController.h"
#import "CodePush.h"

@interface MyController()<RCTBridgeModule>

@property (nonatomic, strong) MyView *myView;

@end

@implementation MyController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexString:BackColor];

    [self loadChildView];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPushNotification:) name:@"RNOpenOneVC" object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

-(void)loadChildView{
//    self.myView = [[MyView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//    [self.view addSubview:self.myView];
//
//    // 给登录按钮增加登录事件
//    [self.myView.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
//
//    // 给退出按钮增加登录事件
//    [self.myView.loginOutButton addTarget:self action:@selector(loginOutAction) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     定义账号列表
     */
    self.myModuleTableView = [[UITableView alloc] init];
    self.myModuleTableView.delegate = self;
    self.myModuleTableView.dataSource = self;
    self.myModuleTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.myModuleTableView];
    
    [self.myModuleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.myModuleTableView.tableFooterView = [[UIView alloc] init];
    [self.myModuleTableView reloadData];
    
    self.listArray = [[NSArray alloc] initWithObjects:[NSArray arrayWithObjects:@"我的收藏",@"我的关注", nil],[NSArray arrayWithObjects:@"我的书架", nil],[NSArray arrayWithObjects:@"最近浏览",@"反馈帮助中心",@"设置",@"退出", nil],nil];
}

/**
 登录
 */
-(void)loginAction
{
    NSLog(@"我到了");
    MyBaseInfoController *myBaseInfoController = [[MyBaseInfoController alloc] init];
    [self.navigationController pushViewController:myBaseInfoController animated:YES];
}

/**
 退出
 */
-(void)loginOutAction
{
    NSLog(@"退出");
//    LoginController *loginController = [[LoginController alloc] init];
//    [self presentViewController:loginController animated:YES completion:^{}];
    
    NSArray *imageList = @[@"http://foo.com/bar1.png",
                           @"http://foo.com/bar2.png"];

    NSDictionary *props = @{@"images" : imageList};
    
    NSURL *jsCodeLocation = [CodePush bundleURLForResource:@"bundle/main" withExtension:@"jsbundle"];

    // NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    
//#ifdef DEBUG
//    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
//#endif

    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                         moduleName: @"RNHighScores"
                         initialProperties:props
                         launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
    
}

/**
 设置tableView cell的高度
 @param tableView  数据视图对象本身
 @param indexPath indexPath description
 @return CGFloat
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45*WidthScale;
}

// 头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0){
        return 0;
    } else {
        return 10*WidthScale;
    }
}

// 设置头鼠兔高度的颜色
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

/**
 定义每一组的元素的个数，历史账号最多10个
 @param tableView 数据视图对象本身
 @param section 那一组需要的行数
 @return NSInteger
 */
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numRow = [[self.listArray objectAtIndex:section] count];
    return numRow;
}

/**
 设置数据视图的组数，这边只需要1组
 @param tableView 数据视图对象本身
 @return NSInteger
 */
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listArray.count;
}

/**
 声明列表中的其中一项
 
 @param tableView 数据视图对象本身
 @param indexPath indexPath description
 @return UITableViewCell
 */
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSString* cellStr = @"cell";
    UITableViewCell* cell = [self.myModuleTableView dequeueReusableCellWithIdentifier:cellStr];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:16*WidthScale];
    cell.textLabel.textColor =[UIColor colorWithHexString:TitleColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.listArray[indexPath.section][indexPath.row];
//    cell.textLabel.text = ;
    return cell;
}

/**
 列表添加事件
 @param tableView 数据视图对象本身
 @param indexPath indexPath description
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 2 && indexPath.row == 3) {
        [self loginOutAction];
    }
}

RCT_EXPORT_MODULE();  // 导出桥接模块   默认模块名为当前class类名即PushNative, 也可自定义模块名 举个🌰栗子：RCT_EXPORT_MODULE(RNNative);

RCT_EXPORT_METHOD(RNPushToNativeController:(NSString*)message){
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"调用到我了");
    });
}

RCT_EXPORT_METHOD(RNCallback:(NSDictionary *)dictionary callback:(RCTResponseSenderBlock)callback){
    NSLog(@"调用了回调 %@",[NSThread currentThread]);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *events=@[@"callback ", @"test ", @" array"];
        
        LoginController *loginController = [[LoginController alloc] init];
        UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;

        // 在这里加一个这个样式的循环 找到上一级ViewController 去做跳转
        while (topRootViewController.presentedViewController)
        {
            // 这里固定写法
            topRootViewController = topRootViewController.presentedViewController;
        }
        // 跳转到新页面
//        [topRootViewController presentViewController:loginController animated:YES completion:nil];

        // 返回到上一个页面，退出RN页面
        [topRootViewController dismissViewControllerAnimated:YES completion:nil];
        callback(@[[NSNull null],events]);
    });
}

@end
