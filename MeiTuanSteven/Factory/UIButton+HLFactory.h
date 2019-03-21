//
//  UIButton+HLFactory.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HLFactory)

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(UIFont *)font color:(UIColor *)color selectedColor:(UIColor *)selectedColor;


+ (instancetype)buttonWithTarget:(id)target action:(SEL)action title:(NSString *)title image:(UIImage *)image font:(UIFont *)font color:(UIColor *)color hightLightedColor:(UIColor *)hightLightedColor;
@end

NS_ASSUME_NONNULL_END
