//
//  HLMerchaintContainerView.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLShopContainerView.h"
#import "HLContainerScrollView.h"

@interface HLShopContainerView () <UIScrollViewDelegate>
@property (nonatomic, weak) UIView *containerView;
@property (nonatomic, strong) HLContainerScrollView *scrollView;
@property (nonatomic, weak) UIView *contentView;
@end

@implementation HLShopContainerView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}
- (void)addSubviewToContent:(UIView *)view withTitle:(NSString *)title{
    [_contentView addSubview:view];
    UIButton *menuBtn = [UIButton buttonWithTarget:self
                                            action:@selector(_menuButtonClicked:)
                                             title:title
                                              font:kSystemFont(kTextSize)
                                             color:kTextColor selectedColor:kTitleColor];
    [_containerView addSubview:menuBtn];
}

- (NSInteger)visibleIndex {
    return (NSInteger)(self.scrollView.contentOffset.x/self.bounds.size.width);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:kWhiteColor];
        [self _setupViewHierarchy];
    }
    return self;
}

- (void)_menuButtonClicked:(UIButton *)sender {
    
}

- (void)_setupViewHierarchy {
    UIView *containerView = [[UIView alloc] init];
    _containerView = containerView;
    [self addSubview:_containerView];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(40);
    }];
    
    _scrollView = [[HLContainerScrollView alloc] init];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(_containerView.mas_bottom);
    }];
    
    UIView *contentView = [[UIView alloc] init];
    _contentView = contentView;
    [_scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        make.height.equalTo(_scrollView);
    }];
}

- (void)updateConstraints {
    [_containerView.subviews mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(_containerView);
    }];
    [_containerView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [_contentView.subviews mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_scrollView);
        make.height.equalTo(_contentView);
    }];
    [_contentView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [super updateConstraints];
}
@end
