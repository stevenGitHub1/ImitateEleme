//
//  HLMerchantSectionTableViewCell.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLBaseTableViewCell.h"
#import "HLGoodsCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLMerchantSectionTableViewCell : HLBaseTableViewCell
- (void)configureWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
