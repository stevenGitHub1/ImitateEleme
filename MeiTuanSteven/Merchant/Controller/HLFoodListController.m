//
//  HLGoodsViewController.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/25.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLFoodListController.h"
#import "HLMerchantSectionTableViewCell.h"
#import "HLMerchantGoodsTableViewCell.h"
#import "HLSectionTableViewDataSource.h"
#import "HLShopViewController.h"

#define kSectionCellReuseIdentifer @"sectionCellReuseIdentifer"
#define kGoodsCellReuseReuseIdentifer @"goodsCellReuseIdentifer"

@interface HLFoodListController ()

@property (nonatomic, strong) UITableView *categoryTableView;
@property (nonatomic, strong) UITableView *goodsTableView;

@property (nonatomic, strong) HLTableViewDataSource *sectionDataSource;
@property (nonatomic, strong) HLSectionTableViewDataSource *goodsDataSource;

@property (nonatomic, copy) NSArray <HLGoodsCategory *>*sections;
@end

@implementation HLFoodListController
{
    NSInteger _previousIndex;
    BOOL _shouldMappingToCategory;
}
#pragma mark - HLShopContainerDelegate
@synthesize scrollView;
- (UIScrollView *)scrollView {
    return _goodsTableView;
}

- (BOOL)isYourLimitView:(UIView *)touchedView {
    return _categoryTableView == touchedView;
}

#pragma mark - HLShopViewControllerChildDelegate
- (void)changeScrollViewContentOffSetY:(CGFloat)y {
    _goodsTableView.contentOffset = CGPointMake(0, y+_goodsTableView.contentOffset.y);
    NSLog(@"%f", _goodsTableView.contentOffset.y);
}
- (BOOL)contentOffSetWillBecomeZero:(CGFloat)y {
    return _goodsTableView.contentOffset.y + y <= 0;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldMappingToCategory = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _requestedData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:_previousIndex inSection:0]
                                        animated:YES
                                  scrollPosition:UITableViewScrollPositionTop];
}

- (void)_requestedData {
    [self.categoryTableView reloadData];
    [self.goodsTableView reloadData];
}

- (UITableView *)_createTableViewWithCellClass:(Class)cellClass
                                reuseIdentfier:(NSString *)identfier
                                    dataSource:(id <UITableViewDataSource>)dataSource{
    UITableView *temp = [[UITableView alloc] init];
    temp.delegate = self;
    temp.dataSource = dataSource;
    temp.separatorStyle = UITableViewCellSeparatorStyleNone;
    [temp registerClass:cellClass forCellReuseIdentifier:identfier];
    [self.view addSubview:temp];
    return temp;
}

#pragma mark - property lazy
- (UITableView *)categoryTableView {
    if (!_categoryTableView) {
        HLCellConfigureBlock configure = ^(HLMerchantSectionTableViewCell *cell, HLGoodsCategory *category) {
            [cell configureWithName:category.categoryName];
        };
        _sectionDataSource = [[HLTableViewDataSource alloc] initWithItems:self.sections
                                                            cellIdentifer:kSectionCellReuseIdentifer
                                                           configureBlock:configure];
        
        UITableView *temp = [self _createTableViewWithCellClass:[HLMerchantSectionTableViewCell class]
                                                 reuseIdentfier:kSectionCellReuseIdentifer
                                                     dataSource:_sectionDataSource];
        _categoryTableView = temp;
        [self.view addSubview:temp];
        [_categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.view);
            make.width.equalTo(60);
        }];
    }
    return _categoryTableView;
}

- (UITableView *)goodsTableView {
    if (!_goodsTableView) {
        HLRowsInSectionBlock rows = ^(NSInteger section) {
            return self.sections[section].goods;
        };
        HLCellConfigureBlock configure = ^(id cell, id item) {
            
        };
        _goodsDataSource = [[HLSectionTableViewDataSource alloc] initWithItems:self.sections
                                                                 cellIdentifer:kGoodsCellReuseReuseIdentifer
                                                                configureBlock:configure
                                                                     rowsBlock:rows];
        
        UITableView *temp = [self _createTableViewWithCellClass:[HLMerchantGoodsTableViewCell class]
                                                 reuseIdentfier:kGoodsCellReuseReuseIdentifer
                                                     dataSource:_goodsDataSource];
        _goodsTableView = temp;
        _goodsTableView.rowHeight = 100;
        _goodsTableView.scrollEnabled = NO;
        [self.view addSubview:temp];
        [_goodsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_categoryTableView.mas_right);
            make.top.bottom.right.equalTo(self.view);
        }];
    }
    return _goodsTableView;
}

- (NSArray<HLGoodsCategory *> *)sections {
    if (!_sections) {
        NSArray *names = @[@"夏日榴莲季",@"牛排",@"奶茶",@"早餐套餐",@"饮料",@"汤",@"小食",@"面/饭",@"意式披萨",@"经典铁盘沙绍",@"炸鸡"];
        NSMutableArray *categorys = [NSMutableArray arrayWithCapacity:0];
        for (NSString *name in names) {
            @autoreleasepool {
                NSMutableArray *goodsInCategory = [NSMutableArray arrayWithCapacity:0];
                HLGoodsCategory *category = [[HLGoodsCategory alloc] init];
                category.categoryName = name;
                for (NSInteger i = 0; i < 8; i ++) {
                    HLGoods *goods = [[HLGoods alloc] init];
                    [goodsInCategory addObject:goods];
                }
                category.goods = [goodsInCategory copy];
                [categorys addObject:category];
            }
        }
        _sections = [categorys copy];
    }
    return _sections;
}

@end



@implementation HLFoodListController (UITableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _categoryTableView) {
        _shouldMappingToCategory = NO;
        [_goodsTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row]
                               atScrollPosition:UITableViewScrollPositionTop
                                       animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_shouldMappingToCategory && scrollView == _goodsTableView) {
        CGFloat currentSectionHeight = (self.sections[_previousIndex].goods.count * self.goodsTableView.rowHeight);
        NSInteger index = scrollView.contentOffset.y/currentSectionHeight;
        if (_previousIndex != index) {
            _previousIndex = index;
            [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:_previousIndex inSection:0]
                                                animated:YES
                                          scrollPosition:UITableViewScrollPositionTop];
        }
    }
}

#pragma mark - force _goodsTableView stop scroll immediately when _categaotyTableView touched/dragged
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == _categoryTableView) {
        [self.goodsTableView setContentOffset:self.goodsTableView.contentOffset animated:NO];
    } else {
        _shouldMappingToCategory = YES;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _categoryTableView) {
        [self.goodsTableView setContentOffset:self.goodsTableView.contentOffset animated:NO];
    }
    return YES;
}
@end
