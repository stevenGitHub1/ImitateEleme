//
//  HLCouponCollectionViewCell.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/3/7.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLCouponCollectionViewCell.h"

@interface HLCouponCollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation HLCouponCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupViewHierarchy];
    }
    return self;
}

- (void)_setupViewHierarchy {
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_coupon_yellow"]];
    _imageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}
@end
