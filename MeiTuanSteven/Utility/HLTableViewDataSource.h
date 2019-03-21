//
//  HLTableViewDataSource.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/27.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HLCellConfigureBlock) (id cell, id item);

NS_ASSUME_NONNULL_BEGIN

@interface HLTableViewDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifer;
@property (nonatomic, strong) HLCellConfigureBlock configureBlock;
- (instancetype)initWithItems:(NSArray *)items
                cellIdentifer:(NSString *)identifer
               configureBlock:(nullable HLCellConfigureBlock)block;
@end

NS_ASSUME_NONNULL_END
