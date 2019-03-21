//
//  HLDynamicItem.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/3/2.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLDynamicItem : NSObject <UIDynamicItem>

@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readonly) CGRect bounds;
@property (nonatomic, readwrite) CGAffineTransform transform;
@end

NS_ASSUME_NONNULL_END
