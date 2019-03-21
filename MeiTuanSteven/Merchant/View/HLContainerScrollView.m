//
//  HLContainerScrollView.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/3/7.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLContainerScrollView.h"

@implementation HLContainerScrollView

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint velocity = [pan velocityInView:self];
        float x = velocity.x;
        float y = velocity.y;
        double angle = atan2(y, x) * 180.0f / 3.14159f;
        if (angle < 0) angle += 360.0f;
        
//        NSLog(@"%f", angle);
        if (angle > 30 && angle < 150) {
            return NO;
        }
        
        if (angle > 200 && angle < 330) {
            return NO;
        }
    }
    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}

@end
