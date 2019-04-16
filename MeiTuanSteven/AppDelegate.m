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
//    merge tool test
//    add something
    return YES;
}

- (void)_setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = kWhiteColor;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HLShopViewController alloc] init]];
    [self.window makeKeyAndVisible];
}


@end
