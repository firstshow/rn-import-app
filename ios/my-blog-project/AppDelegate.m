//
//  AppDelegate.m
//  my-blog-project
//
//  Created by 张城 on 2018/1/16.
//  Copyright © 2018年 张城. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeController.h"
#import "MessageController.h"
#import "MyController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 显示window
//    [self.window makeKeyAndVisible];
    
    // 首页
    HomeController *home = [[HomeController alloc] init];
    UITabBarItem *homeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"home_tab"] selectedImage:[UIImage imageNamed:@"home_select_tab"]];
    home.tabBarItem = homeTabBarItem;
    
    // 消息页面
    MessageController *message = [[MessageController alloc] init];
    UITabBarItem *messageTabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"message_tab"] selectedImage:[UIImage imageNamed:@"message_select_tab"]];
    message.tabBarItem = messageTabBarItem;
    
     // 我的页面
    MyController *my = [[MyController alloc] init];
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:my];
    UITabBarItem *myTabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"my_tab"] selectedImage:[UIImage imageNamed:@"my_select_tab"]];
    myNav.tabBarItem = myTabBarItem;
    
    // 创建tab控制器
    UITabBarController * tabController = [[UITabBarController alloc] init];
    
    // tabBar 不透明
    tabController.tabBar.translucent = NO;
    // 选中的颜色
    tabController.tabBar.tintColor =[UIColor colorWithHexString: ThemeColor];
    
    NSArray *tabArry = [NSArray arrayWithObjects:home, message, myNav, nil];
    tabController.viewControllers = tabArry;
    
    self.window.rootViewController = tabController;
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
