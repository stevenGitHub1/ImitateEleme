//
//  HLBaseViewController.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLBaseViewController.h"

@interface HLBaseViewController ()

@end

@implementation HLBaseViewController

- (void)hl_addChildViewController:(UIViewController *)child withTransition:(nonnull HLChildTransition)transition{
    [self addChildViewController:child];
    if (transition) transition();
    [child didMoveToParentViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"change_dev_tmp");
}

@end
