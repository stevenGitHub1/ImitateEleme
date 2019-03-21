//
//  HLSectionTableViewDataSource.m
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/28.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLSectionTableViewDataSource.h"

@interface HLSectionTableViewDataSource ()
@property (nonatomic, strong) HLRowsInSectionBlock rowsBlock;
@end

@implementation HLSectionTableViewDataSource

- (instancetype)initWithItems:(NSArray *)items cellIdentifer:(NSString *)identifer configureBlock:(HLCellConfigureBlock)block rowsBlock:(HLRowsInSectionBlock)rowsBlock
{
    self = [super initWithItems:items cellIdentifer:identifer configureBlock:block];
    if (self) {
        _rowsBlock = rowsBlock;
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowsBlock(section).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifer forIndexPath:indexPath];
    id item = self.rowsBlock(indexPath.section)[indexPath.row];
    if (self.configureBlock) {
        self.configureBlock(cell, item);
    }
    return cell;
}

@end
