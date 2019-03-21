//
//  HLTableViewDataSource.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLTableViewDataSource.h"

@interface HLTableViewDataSource ()

@end

@implementation HLTableViewDataSource

- (instancetype)initWithItems:(NSArray *)items
                cellIdentifer:(NSString *)identifer
               configureBlock:(nullable HLCellConfigureBlock)block
{
    self = [super init];
    if (self) {
        _items = items;
        _cellIdentifer = identifer;
        _configureBlock = block;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifer forIndexPath:indexPath];
    id item = _items[indexPath.row];
    if (_configureBlock) {
        _configureBlock(cell, item);
    }
    return cell;
}

#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifer forIndexPath:indexPath];
    id item = _items[indexPath.row];
    if (_configureBlock) {
        _configureBlock(cell, item);
    }
    return cell;
}
@end
