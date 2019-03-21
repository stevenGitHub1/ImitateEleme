//
//  HLMarchantBottomViewController.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLShopViewController.h"
#import "HLFoodListController.h"
#import "HLRatingListViewController.h"
#import "HLSummaryListViewController.h"
#import "HLShopHeaderView.h"
#import "HLShopActivityView.h"
#import "HLShopContainerView.h"
#import "HLDynamicItem.h"
#import "HLTableViewDataSource.h"
#import "HLCouponCollectionViewCell.h"
#import <Masonry.h>

typedef void (^HLItemAction) (HLDynamicItem *item);
NSString * const kCouponCellIdentifier = @"CouponCellIdentifier";

@interface HLShopViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) HLShopHeaderView *headerView;
@property (nonatomic, strong) UICollectionView *couponView;
@property (nonatomic, strong) HLShopActivityView *activityView;
@property (nonatomic, strong) HLShopContainerView *containerView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) HLDynamicItem *dynamicItem;
@property (nonatomic, weak) UIDynamicItemBehavior *inertialBehavior;
@property (nonatomic, weak) UIViewController <HLShopContainerDelegate>*topViewController;
@property (nonatomic, strong) HLTableViewDataSource *couponDataSource;
@end

@implementation HLShopViewController
{
    CGFloat _topConstrains;
    CGFloat _topConstrainsMin;
    CGFloat _topConstrainsMax;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topConstrains = _topConstrainsMax = 200;
        _topConstrainsMin = 64;
        _dynamicItem = [HLDynamicItem new];
        _animator = [[UIDynamicAnimator alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupViewHierarchy];
    [self _setupViewControllerHierarchy];
    [self _addGestureRecognizer];
}

- (void)_setupViewHierarchy {
    _headerView = [[HLShopHeaderView alloc] init];
    [self.view addSubview:_headerView];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(240, 100);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _couponView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _couponView.backgroundColor = kWhiteColor;
    _couponDataSource = [[HLTableViewDataSource alloc] initWithItems:@[@"",@""]
                                                       cellIdentifer:kCouponCellIdentifier
                                                      configureBlock:nil];
    _couponView.dataSource = _couponDataSource;
    [_couponView registerClass:[HLCouponCollectionViewCell class] forCellWithReuseIdentifier:kCouponCellIdentifier];
    [self.view addSubview:_couponView];
    
    _activityView = [[HLShopActivityView alloc] init];
    [self.view addSubview:_activityView];
    
    _containerView = [[HLShopContainerView alloc] init];
    [self.view addSubview:_containerView];
    
    [self _setupViewConstrains];
}

- (void)_setupViewConstrains {
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.width.equalTo(self.view);
        make.height.equalTo(_topConstrainsMax);
    }];
    
    [_couponView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerView.mas_bottom).offset(10);
        make.centerX.width.equalTo(self.view);
        make.height.equalTo(100);
    }];
    
    [_activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_couponView.mas_bottom).offset(10);
        make.centerX.width.bottom.equalTo(self.view);
    }];
    
    [_containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(_topConstrains);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)_setupViewControllerHierarchy {
    HLFoodListController *foodVc = [[HLFoodListController alloc] init];
    HLRatingListViewController *ratingVc = [[HLRatingListViewController alloc] init];
    HLSummaryListViewController *summaryVc = [[HLSummaryListViewController alloc] init];
    
    [self hl_addChildViewController:foodVc withTransition:^{
        [self.containerView addSubviewToContent:foodVc.view withTitle:@"点菜"];
    }];
    [self hl_addChildViewController:ratingVc withTransition:^{
        [self.containerView addSubviewToContent:ratingVc.view withTitle:@"评价"];
    }];
    [self hl_addChildViewController:summaryVc withTransition:^{
        [self.containerView addSubviewToContent:summaryVc.view withTitle:@"商家"];
    }];
    
    _topViewController = foodVc;
}

- (void)_addGestureRecognizer {
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(_panGestureTriggered:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}

- (void)_panGestureTriggered:(UIPanGestureRecognizer *)recognizer {
    CGFloat translationY = [recognizer translationInView:self.view].y;
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            _topViewController = self.childViewControllers[_containerView.visibleIndex];
            [_animator removeAllBehaviors];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self _translateView:translationY];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            // the purpose use _dynamicItem as attribute is to get its velocity at bounceBehavior
            _dynamicItem.center = CGPointMake(0, translationY);
            
            // the purpose use _inertialBehavior as attribute is the same as _dynamicItem
            CGPoint veloticy = CGPointMake(0, [recognizer velocityInView:self.view].y);
            __block CGFloat previous = 0;
            __weak typeof(self) weak = self;
            HLItemAction action = ^(HLDynamicItem *item){
                CGFloat itemTop = item.center.y;
                [weak _translateView:itemTop-previous];
                previous = item.center.y;
            };
            UIDynamicItemBehavior *inertial = [self _inertialBehaviorWithItem:_dynamicItem
                                                                     velocity:veloticy
                                                                 updateMethod:action];
            [self.animator addBehavior:inertial];
            _inertialBehavior = inertial;
        }
            break;
        default:
            break;
    }

    [recognizer setTranslation:CGPointZero inView:self.view];
}

- (void)_translateView:(CGFloat)translation {
    if (_topConstrains > _topConstrainsMin) {
        [self _updateTopConstrains:translation];
        return;
    }
    
    if (translation <= 0) { /** direction == up; translation isEqual to 0 when have no inertial*/
        [self _updateContentOffSetUp:translation];
        return;
    }
    
    if (_topViewController.scrollView.contentOffset.y != 0) { // direction == down
        [self _updateContentOffSetDown:translation];
        return;
    }
    
    [self _updateTopConstrains:translation];
}

- (void)_updateContentOffSetDown:(CGFloat)value {
    CGFloat Y = fmax(0, _topViewController.scrollView.contentOffset.y - value);
    _topViewController.scrollView.contentOffset = CGPointMake(0,Y);
}

- (void)_updateContentOffSetUp:(CGFloat)value {
    CGFloat Y = _topViewController.scrollView.contentOffset.y - value;
    CGFloat maxY = _topViewController.scrollView.contentSize.height-_topViewController.scrollView.bounds.size.height;
    if (Y >= maxY) {
        Y = _topViewController.scrollView.contentOffset.y - value*0.6;
        _topViewController.scrollView.contentOffset = CGPointMake(0,Y);
        if (_inertialBehavior) {
            __weak typeof (self) weak = self;
            [self _addBounceAtCriticalWithAnchor:CGPointMake(0, maxY)
                                          center:_topViewController.scrollView.contentOffset
                                    updateMethod:^(HLDynamicItem *item) {
                                        weak.topViewController.scrollView.contentOffset = item.center;
                                    }];
        }
    } else {
        _topViewController.scrollView.contentOffset = CGPointMake(0,Y);
    }
}

- (void)_updateTopConstrains:(CGFloat)value {
    _topConstrains += value;
    _topConstrains = fmax(_topConstrains,_topConstrainsMin);
    if (_topConstrains >= _topConstrainsMax && _inertialBehavior) {
        __weak typeof (self) weak = self;
        [self _addBounceAtCriticalWithAnchor:CGPointMake(0, _topConstrainsMax)
                                      center:CGPointMake(0, _topConstrains)
                                updateMethod:^(HLDynamicItem *item) {
                                    __strong typeof (weak) strong = weak;
                                    strong->_topConstrains = item.center.y;
                                    [strong.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
                                        make.top.equalTo(strong->_topConstrains);
                                    }];
                                }];
    }
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topConstrains);
    }];
}

- (void)_addBounceAtCriticalWithAnchor:(CGPoint)anchor
                                center:(CGPoint)center
                          updateMethod:(void (^)(HLDynamicItem *item))updateMethod {
    CGPoint velocity = [_inertialBehavior linearVelocityForItem:_dynamicItem];
    [_animator removeAllBehaviors];
    
    HLDynamicItem *item = [HLDynamicItem new];
    item.center = center;
    
    UIDynamicItemBehavior *inertial = [self _inertialBehaviorWithItem:item
                                                             velocity:CGPointMake(0, fabs(velocity.y))
                                                         updateMethod:updateMethod];
    [_animator addBehavior:inertial];
    
    UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:anchor];
    attach = attach;
    attach.length = 0;
    attach.damping = 1;
    attach.frequency = 2;
    [_animator addBehavior:attach];
    NSLog(@"_addBounceAtCriticalWithAnchor");
}

- (UIDynamicItemBehavior *)_inertialBehaviorWithItem:(HLDynamicItem *)item
                                            velocity:(CGPoint)velocity
                                        updateMethod:(void (^)(HLDynamicItem *item))updateMethod {
    UIDynamicItemBehavior *inertial = [[UIDynamicItemBehavior alloc] initWithItems:@[item]];
    [inertial addLinearVelocity:velocity forItem:item];
    inertial.resistance = 2.0;
    inertial.action = ^{
        updateMethod(item);
    };
    return inertial;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([_topViewController isYourLimitView:otherGestureRecognizer.view]) return NO;
    
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
    CGPoint velocity = [pan velocityInView:self.view];
    float x = velocity.x;
    float y = velocity.y;
    double angle = atan2(y, x) * 180.0f / 3.14159f;
    if (angle < 0) angle += 360.0f;
    
//    NSLog(@"%f", angle);
    if (angle > 45 && angle < 135) {
        return YES;
    }
    
    if (angle > 225 && angle < 315) {
        return YES;
    }
    
    return NO;
}
@end
