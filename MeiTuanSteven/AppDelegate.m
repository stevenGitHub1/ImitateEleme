//
//  AppDelegate.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/24.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "AppDelegate.h"
#import "HLShopViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self _setupWindow];
    NSLog(@"make branch from dev test");
    NSLog(@"dev change");
    NSLog(@"this is branch_1 add code");
    
    NSLog(@"this for push without rebase in branch_1");
//    NSArray *arr = @[@"1"];
//    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
//    for (NSInteger i = 0; i < 3; i ++) {
//        [mutArr addObject:arr];
//    }
//    
//    NSLog(@"%p, %p", arr[0], mutArr[2][0]);
    return YES;
}

- (void)_setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = kWhiteColor;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HLShopViewController alloc] init]];
    [self.window makeKeyAndVisible];
}


@end
