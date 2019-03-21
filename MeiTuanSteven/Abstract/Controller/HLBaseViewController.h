//
//  HLBaseViewController.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HLChildTransition)(void);

NS_ASSUME_NONNULL_BEGIN

@interface HLBaseViewController : UIViewController

- (void)hl_addChildViewController:(UIViewController *)child withTransition:(HLChildTransition)transition;
@end

NS_ASSUME_NONNULL_END
