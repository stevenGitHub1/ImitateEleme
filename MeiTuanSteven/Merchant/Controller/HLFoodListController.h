//
//  HLGoodsViewController.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLBaseViewController.h"
#import "HLShopContainerDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface HLFoodListController : HLBaseViewController <HLShopContainerDelegate>
@end


@interface HLFoodListController (UITableViewDelegate) <UITableViewDelegate>

@end
NS_ASSUME_NONNULL_END
