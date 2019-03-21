//
//  HLMerchantView.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLShopView.h"
//#import "HLMerchantActivityView.h"

#import <Masonry.h>

@interface HLShopView ()
// 商家头像名称视图
//@property (nonatomic, strong) HLShopHeaderView *headerView;
// 优惠券
@property (nonatomic, strong) UICollectionView *couponView;
// 商家头优惠活动和时间
//@property (nonatomic, strong) HLMerchantActivityView *activityView;

@end

@implementation HLShopView
{
    CGFloat _headerViewHeight;
}

- (instancetype)initWithHeaderViewHeight:(CGFloat)height
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        _headerViewHeight = height;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupHierarchy];
    }
    return self;
}

- (void)_setupHierarchy {
    // 1 Hierarchy
//    _headerView = [[HLHLShopHeaderView alloc] init];
//    [self addSubview:_headerView];

    [self _setupCouponView];
    [self addSubview:_couponView];
    
//    _activityView = [[HLMerchantActivityView alloc] init];
//    [self addSubview:_activityView];
    
    // 2 view Constrains
    [self _setupViewConstrains];
}

- (void)_setupCouponView {
    UICollectionViewLayout *couponLayout = [[UICollectionViewLayout alloc] init];
    
    _couponView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:couponLayout];
}

- (void)_setupViewConstrains {
//    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.width.equalTo(self);
//        make.height.mas_equalTo(_headerViewHeight);
//    }];
    
    [self _setupCouponViewAndDiscountsActivityViewConstrainsWithCoupons];
}

- (void)_setupCouponViewAndDiscountsActivityViewConstrainsWithCoupons {
    [self _setupCouponViewAndDiscountsActivityViewConstrainsWithVerticalMargin:10 couponHeight:36];
}

- (void)_setupCouponViewAndDiscountsActivityViewConstrainsWithNoCoupons {
    [self _setupCouponViewAndDiscountsActivityViewConstrainsWithVerticalMargin:0 couponHeight:0];
}

- (void)_setupCouponViewAndDiscountsActivityViewConstrainsWithVerticalMargin:(CGFloat)margin couponHeight:(CGFloat)height {
//    [_couponView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.headerView.mas_bottom).offset(margin);
//        make.left.width.equalTo(self);
//        make.height.mas_equalTo(height);
//    }];
//
//    [_activityView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.couponView.mas_bottom).offset(10);
//        make.left.width.bottom.equalTo(self);
//    }];
}
@end
