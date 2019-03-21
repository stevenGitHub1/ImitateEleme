//
//  HLShopContainerDelegate.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/3/3.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HLShopContainerDelegate <NSObject>
@property (nonatomic, weak, readonly) UIScrollView *scrollView;
- (BOOL)isYourLimitView:(UIView *)touchedView;
@end

NS_ASSUME_NONNULL_END
