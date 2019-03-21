//
//  HLMerchantHeaderView.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLShopHeaderView.h"
#import "UIImage+HLRoundRect.h"
#import <Masonry.h>

@interface HLShopHeaderView ()

@property (nonatomic, strong) UIImageView *avatarView;// 头像
@property (nonatomic, strong) UIImageView *brandView;// 品牌
@property (nonatomic, strong) UILabel *titleView;// 店名
@property (nonatomic, strong) UILabel *annonucementView;// 公告
@property (nonatomic, strong) UILabel *gradeView;//
@property (nonatomic, strong) UILabel *salesVolumeView;//
@property (nonatomic, strong) UIImageView *couponView;//
@property (nonatomic, strong) UILabel *couponLabel;//
@property (nonatomic, strong) UIButton *couponButton;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UIView *verticalSeparateView;
@end

@implementation HLShopHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupGradientLayer];
        [self _setupHirarchy];
    }
    return self;
}

#pragma mark - action
- (void)_couponButtonClicked:(UIButton *)sender {
    
}

- (void)_setupGradientLayer {
    _gradientLayer = [[CAGradientLayer alloc] init];
    _gradientLayer.colors = @[(id)[UIColor whiteColor].CGColor,(id)[UIColor lightGrayColor].CGColor];
    [self.layer addSublayer:_gradientLayer];
}

#pragma mark - View Hierarchy And Layouts
- (void)_setupHirarchy {
    _avatarView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"food"] addRadius:8 inSize:CGSizeMake(90, 90)]];
    [self addSubview:_avatarView];
    
    _brandView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_brd"]];
    [self addSubview:_brandView];
    
    _titleView = [UILabel labelWithText:@"必胜客宅急送（前进店）" font:kSystemFont(kTitleSize) textColor:kWhiteColor];
    [self addSubview:_titleView];
    
    _annonucementView = [UILabel labelWithText:@"公告：欢迎光临必胜客宅急送，我们将竭力为您提供丰富的美食" font:kSystemFont(kTextSize) textColor:kWhiteColor];
    [self addSubview:_annonucementView];
    
    _gradeView = [UILabel labelWithText:@"4.9分 超出预期" font:kSystemFont(kTextSize) textColor:kTextSelectedColor];
    [self addSubview:_gradeView];
    
    _verticalSeparateView = [[UIView alloc] init];
    [self addSubview:_verticalSeparateView];
    
    _salesVolumeView = [UILabel labelWithText:@"月售1088" font:kSystemFont(kContentSize) textColor:kWhiteColor];
    [self addSubview:_salesVolumeView];
    
    _couponView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self addSubview:_couponView];
    
    _couponLabel = [UILabel labelWithText:@"优惠券活动" font:kSystemFont(kContentSize) textColor:kTextColor];
    [self addSubview:_couponLabel];

    _couponButton = [UIButton buttonWithTarget:self action:@selector(_couponButtonClicked:) title:@"3个优惠" image:HLImage(@"") font:kSystemFont(kContentSize) color:kContentColor hightLightedColor:kContentColor];
    [self addSubview:_couponButton];
    
    [self _setupSubViewsConstrans];
}

- (void)_setupSubViewsConstrans {
    [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.top.equalTo(self).offset(70);
        make.height.width.equalTo(90);
    }];
    
    [_brandView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(10);
        make.top.equalTo(self.avatarView);
        make.width.equalTo(30);
        make.height.equalTo(16);
    }];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.brandView.mas_right).offset(10);
        make.top.equalTo(self.avatarView);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    [_annonucementView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.brandView);
        make.right.equalTo(self.titleView);
        make.top.equalTo(self.brandView.mas_bottom).offset(10);
    }];
    
    [_gradeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.brandView);
        make.top.equalTo(self.annonucementView.mas_bottom).offset(15);
    }];
    
    [_verticalSeparateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gradeView.mas_right).offset(15);
        make.centerY.equalTo(self.gradeView);
        make.height.equalTo(20);
        make.width.equalTo(2);
    }];
    
    [_salesVolumeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verticalSeparateView.mas_right).offset(15);
        make.centerY.equalTo(self.gradeView);
    }];
    
    [_couponView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarView);
        make.top.equalTo(_avatarView.mas_bottom).offset(10);
    }];
    
    [_couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_couponView.mas_right).offset(10);
        make.centerY.equalTo(_couponView);
    }];
    
    [_couponButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_couponView);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, 150);
}
@end
