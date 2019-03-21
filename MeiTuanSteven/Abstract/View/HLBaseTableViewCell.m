//
//  HLBaseTableViewCell.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLBaseTableViewCell.h"

@implementation HLBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self hl_setupViewHierarchy];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self hl_setupViewHierarchy];
    }
    return self;
}

- (void)hl_setupViewHierarchy {
    _separatorView = [[UIView alloc] init];
    _separatorView.backgroundColor = kLightGrayColor;
    [self.contentView addSubview:_separatorView];
    
    [self hl_setupViewLayout];
}

- (void)hl_setupViewLayout {
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(1);
    }];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}
@end
