//
//  UIImage+HLRoundRect.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/3/7.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "UIImage+HLRoundRect.h"

@implementation UIImage (HLRoundRect)
- (instancetype)addRadius:(CGFloat)radius inSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    UIImage *draw = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return draw;
}
@end
