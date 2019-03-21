//
//  Macro.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/24.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// 系统颜色
#define kBlackColor [UIColor blackColor]
#define kRedColor [UIColor redColor]
#define kYellowColor [UIColor yellowColor]
#define kGreenColor [UIColor greenColor]
#define kWhiteColor [UIColor whiteColor]
#define kClearColor [UIColor clearColor]
#define kOrangeColor [UIColor orangeColor]
#define kBlueColor [UIColor blueColor]
#define kClearColor [UIColor clearColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kDarkGrayColor [UIColor darkGrayColor]


// 自定义颜色
#define HLHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 字体
#define kSystemFont(size) [UIFont systemFontOfSize:size]

// 字体大小
#define kTextSize 13
#define kTitleSize 13
#define kContentSize 13

// 字体颜色
#define kTextColor kBlackColor
#define kTitleColor kBlackColor
#define kContentColor kLightGrayColor
#define kTextSelectedColor kOrangeColor
#endif /* Macro_h */


// convenience
#define HLImage(name) [UIImage imageNamed:name]
