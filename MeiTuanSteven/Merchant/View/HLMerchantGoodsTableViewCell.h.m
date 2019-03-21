//
//  HLGoodTableViewCell.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLMerchantGoodsTableViewCell.h"

@interface HLMerchantGoodsTableViewCell ()

@property (nonatomic, strong) UIImageView *avararView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *salesLabel;
@property (nonatomic, strong) UILabel *favourLabel;
@property (nonatomic, strong) UIImageView *hotView;
@property (nonatomic, strong) UIImageView *favourView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *nomarlPriceLabel;
@property (nonatomic, strong) UILabel *discountLabel;

@end


@implementation HLMerchantGoodsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _setupViewHierarchy];
        [self _setupViewLayouts];
    }
    return self;
}

- (void)_setupViewHierarchy {
    _avararView = [[UIImageView alloc] initWithImage:HLImage(@"food")];
    [self.contentView addSubview:_avararView];
    
    _nameLabel = [UILabel labelWithText:@"这里是商品名称" font:kSystemFont(kTextSize) textColor:kTextColor];
    [self.contentView addSubview:_nameLabel];
    
    _salesLabel = [UILabel labelWithText:@"月销121" font:kSystemFont(kTextSize) textColor:kTextColor];
    [self.contentView addSubview:_salesLabel];
    
    _favourLabel = [UILabel labelWithText:@"赞12" font:kSystemFont(kTextSize) textColor:kTextColor];
    [self.contentView addSubview:_favourLabel];
    
    _hotView = [[UIImageView alloc] initWithImage:HLImage(@"icon_chili")];
    [self.contentView addSubview:_hotView];
    
    _favourView = [[UIImageView alloc] initWithImage:HLImage(@"lab_like")];
    [self.contentView addSubview:_favourView];
    
    _priceLabel = [UILabel labelWithText:@"￥28" font:kSystemFont(kTextSize) textColor:kTextColor];
    [self.contentView addSubview:_priceLabel];
    
    _nomarlPriceLabel = [UILabel labelWithText:@"￥12" font:kSystemFont(kContentSize) textColor:kTextColor];
    [self.contentView addSubview:_nomarlPriceLabel];
    
    _discountLabel = [UILabel labelWithText:@"9折" font:kSystemFont(kContentSize) textColor:kTextColor];
    [self.contentView addSubview:_discountLabel];
}

- (void)_setupViewLayouts {
    [_avararView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(8);
        make.width.height.equalTo(86);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avararView.mas_right).offset(8);
        make.top.equalTo(_avararView);
        make.right.lessThanOrEqualTo(self.contentView).offset(-8);
    }];
    
    [_salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(4);
    }];
    
    [_favourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_salesLabel.mas_right).offset(10);
        make.centerY.equalTo(_salesLabel);
    }];
    
    [_hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_favourLabel.mas_right).offset(4);
        make.centerY.equalTo(_favourLabel);
    }];
    
    [_favourView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_salesLabel.mas_bottom).offset(4);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.equalTo(self.contentView).offset(-3);
    }];
    
    [_nomarlPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLabel.mas_right).offset(4);
        make.centerY.equalTo(_priceLabel);
    }];
    
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nomarlPriceLabel.mas_right).offset(8);
        make.centerY.equalTo(_priceLabel);
    }];
}
@end
