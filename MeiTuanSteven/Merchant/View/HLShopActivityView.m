//
//  HLMerchantActivityView.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLShopActivityView.h"

@interface HLShopActivityView ()

@end

@implementation HLShopActivityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupViewHierarchy];
    }
    return self;
}

- (void)_setupViewHierarchy {
    UILabel *couponLabel = [[UILabel alloc] init];
    couponLabel.attributedText = [self _stringWithAttachmentWithImage:[UIImage imageNamed:@"icon-coupons"] string:@"优惠券活动"];
    [self addSubview:couponLabel];
    [couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10);
        make.left.equalTo(10);
    }];
    
    UILabel *reduceLabel = [[UILabel alloc] init];
    reduceLabel.attributedText = [self _stringWithAttachmentWithImage:[UIImage imageNamed:@"icon-sale"] string:@"满20减5;满60减30"];
    [self addSubview:reduceLabel];
    [reduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(couponLabel.mas_bottom).offset(6);
        make.left.equalTo(couponLabel);
    }];
    
    UILabel *saleLabel = [[UILabel alloc] init];
    saleLabel.attributedText = [self _stringWithAttachmentWithImage:[UIImage imageNamed:@"icon-discounts"] string:@"折扣商品5折起"];
    [self addSubview:saleLabel];
    [saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reduceLabel.mas_bottom).offset(6);
        make.left.equalTo(couponLabel);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(saleLabel.mas_bottom).offset(10);
        make.centerX.width.equalTo(self);
        make.height.equalTo(1);
    }];
    
    UILabel *shopHoursLabel = [UILabel labelWithText:@"营业时间" font:kSystemFont(kTextSize) textColor:kTitleColor];
    [self addSubview:shopHoursLabel];
    [shopHoursLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(couponLabel);
        make.top.equalTo(line.mas_bottom).offset(10);
    }];
    
    UILabel *timeLabel = [UILabel labelWithText:@"00:00 - 23:00" font:kSystemFont(kContentSize) textColor:kTitleColor];
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(couponLabel);
        make.top.equalTo(shopHoursLabel.mas_bottom).offset(6);
    }];
    
    UILabel *announcementLabel = [UILabel labelWithText:@"公告:" font:kSystemFont(kTextSize) textColor:kTitleColor];
    [self addSubview:announcementLabel];
    [announcementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(couponLabel);
        make.top.equalTo(timeLabel.mas_bottom).offset(10);
    }];
    
    UILabel *describeLabel = [UILabel labelWithText:@"欢饮光临必胜客宅急送,我们将竭力为您提供丰富的美食" font:kSystemFont(kContentSize) textColor:kTitleColor];
    [self addSubview:describeLabel];
    [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(couponLabel);
        make.top.equalTo(announcementLabel.mas_bottom).offset(6);
    }];
}

- (NSAttributedString *)_stringWithAttachmentWithImage:(UIImage *)image string:(NSString *)string {
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, -5, image.size.width, image.size.height);
    
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:string];
    
    NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] init];
    [temp appendAttributedString:attachmentString];
    [temp appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    [temp appendAttributedString:attributeString];
    return [temp copy];
}
@end
