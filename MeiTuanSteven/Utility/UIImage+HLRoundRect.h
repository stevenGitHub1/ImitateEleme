//
//  UIImage+HLRoundRect.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/3/7.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HLRoundRect)
- (instancetype)addRadius:(CGFloat)radius inSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
