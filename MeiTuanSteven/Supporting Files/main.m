//
//  main.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/24.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *lldbTest = @"lldbTest";
        [lldbTest stringByAppendingString:@"-Suffix"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
