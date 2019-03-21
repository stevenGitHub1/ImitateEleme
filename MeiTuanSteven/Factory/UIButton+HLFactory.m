//
//  UIButton+HLFactory.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "UIButton+HLFactory.h"

@implementation UIButton (HLFactory)

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(UIFont *)font color:(UIColor *)color selectedColor:(UIColor *)selectedColor {
    return [self buttonWithTarget:target action:action title:title font:font textColor:color highLightedTextColor:selectedColor selectedTextColor:selectedColor image:nil highLightedImage:nil selectedImage:nil];
}

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action title:(NSString *)title image:(UIImage *)image font:(UIFont *)font color:(UIColor *)color hightLightedColor:(UIColor *)hightLightedColor {
    return [self buttonWithTarget:target action:action title:title font:font textColor:color highLightedTextColor:hightLightedColor selectedTextColor:hightLightedColor image:image highLightedImage:image selectedImage:image];
}

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor highLightedTextColor:(UIColor *)highLightedTextColor selectedTextColor:(UIColor *)selectedTextColor image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage selectedImage:(UIImage *)selectedImage {
    UIButton *temp = [UIButton buttonWithType:UIButtonTypeCustom];
    temp.titleLabel.font = font;
    [temp addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [temp setTitle:title forState:UIControlStateNormal];
    [temp setImage:image forState:UIControlStateNormal];
    [temp setTitleColor:textColor forState:UIControlStateNormal];
    [temp setTitleColor:highLightedTextColor forState:UIControlStateHighlighted];
    return temp;
}
@end
