//
//  HLMerchaintContainerView.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLShopContainerView : UIView

- (void)addSubviewToContent:(UIView *)view withTitle:(NSString *)title;
- (NSInteger)visibleIndex;
@end

NS_ASSUME_NONNULL_END
