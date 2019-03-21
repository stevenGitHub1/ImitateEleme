//
//  HLCommentsViewController.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLBaseViewController.h"
#import "HLShopContainerDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@protocol HLShopViewControllerChildDelegate;
@interface HLRatingListViewController : HLBaseViewController <HLShopContainerDelegate>

@end

NS_ASSUME_NONNULL_END
