//
//  HLMerchantSectionTableViewCell.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLMerchantSectionTableViewCell.h"

@interface HLMerchantSectionTableViewCell ()
@property (nonatomic, strong) UILabel *sectionNameView;
@end

@implementation HLMerchantSectionTableViewCell

- (void)configureWithName:(NSString *)name {
    _sectionNameView.text = name;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _setupViewHierarchy];
    }
    return self;
}

- (void)_setupViewHierarchy {
    _sectionNameView = [UILabel labelWithFont:kSystemFont(kTextSize) textColor:kTextColor];
    _sectionNameView.numberOfLines = 0;
    [self.contentView addSubview:_sectionNameView];
    [_sectionNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(UIEdgeInsetsMake(8, 8, 8, 8));
    }];
}
@end
