//
//  HLGoodsCategory.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/28.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLGoods.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLGoodsCategory : NSObject
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, copy) NSArray <HLGoods *>*goods;
@end

NS_ASSUME_NONNULL_END
