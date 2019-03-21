//
//  UILabel+HLFactory.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "UILabel+HLFactory.h"

#define HLFont(size) [UIFont systemFontOfSize:size];

@implementation UILabel (HLFactory)

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)color {
    return [self labelWithText:nil font:font textColor:color];
}

+ (instancetype)labelWithText:(nullable NSString *)text font:(UIFont *)font textColor:(UIColor *)color {
    UILabel *temp = [[UILabel alloc] init];
    temp.text = text;
    temp.font = font;
    temp.textColor = color;
    return temp;
}
@end
