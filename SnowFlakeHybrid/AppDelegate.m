//
//  AppDelegate.m
//  SnowFlakeHybrid
//
//  Created by jilei on 2018/6/1.
//  Copyright © 2018年 jilei. All rights reserved.
//

#import "AppDelegate.h"
#import "NSObject+DRExtension.h"
#import "WKWebviewHybridVC.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
static NSString * const UserAgent = @"Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/602.1.38 (KHTML, like Gecko) Version/8.4 Mobile/14A300 Safari/602.1/native_app";

@interface AppDelegate ()
@property(nonatomic,strong)WKWebviewHybridVC *wvc;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self DATA];
    return YES;
}

-(void)DATA
{
    NSString *version = [UIDevice currentDevice].systemVersion;
    if ([version floatValue]<9.0) {
        [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent" : UserAgent}];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    if ([NSObject getUser_base_url]==nil||[[NSObject getUser_base_url] isEqualToString:@""]) {
        [NSObject saveUser_base_url:@"http://192.168.10.1"];

    }
    if ([NSObject getAgentUrl]==nil||[[NSObject getAgentUrl] isEqualToString:@""]) {
        [NSObject saveAgentUrl:@"http://192.168.10.2"];

    }
    if ([NSObject getBet_base_url]==nil||[[NSObject getBet_base_url] isEqualToString:@""]) {
        [NSObject saveBet_base_url:@"http://192.168.10.3"];

    }


    //    if ([NSObject getUser_base_url]==nil||[[NSObject getUser_base_url] isEqualToString:@""]) {
    //        [NSObject saveUser_base_url:@"http://frontend.jinqiu365.com"];
    //
    //    }
    //    if ([NSObject getBet_base_url]==nil||[[NSObject getBet_base_url] isEqualToString:@""]) {
    //        [NSObject saveBet_base_url:@"http://dataapi.jinqiu365.com"];
    //
    //    }
    //    if ([NSObject getsocketBaseUrl]==nil||[[NSObject getsocketBaseUrl] isEqualToString:@""]) {
    //        [NSObject savesocketBaseUrl:@"ws://asenral.leadadvancetech.com:9031"];
    //
    //    }

    self.window=[[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];

    [self keybordSetUp];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    statusBar.backgroundColor = [UIColor colorWithHexString:@"#ff553f"];

    self.wvc =[self LoadWKWebview];
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:self.wvc];
    nav.navigationBarHidden=YES;
    self.window.rootViewController=nav;


}
-(WKWebviewHybridVC*)LoadWKWebview
{

    WKWebviewHybridVC *vc=[[WKWebviewHybridVC alloc] init];
    return vc;
}
-(void)keybordSetUp
{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量

    keyboardManager.enable = YES; // 控制整个功能是否启用

    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘

    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义

    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框

    keyboardManager.enableAutoToolbar = NO; // 控制是否显示键盘上的工具条

    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体

    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离

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
