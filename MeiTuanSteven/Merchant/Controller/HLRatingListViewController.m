//
//  HLCommentsViewController.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLRatingListViewController.h"
#import "HLShopViewController.h"

@interface HLRatingListViewController ()

@end

@implementation HLRatingListViewController
@synthesize scrollView;
- (BOOL)isYourLimitView:(UIView *)touchedView {
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"I am chenzilong, i am trying change this branch in develop either");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
