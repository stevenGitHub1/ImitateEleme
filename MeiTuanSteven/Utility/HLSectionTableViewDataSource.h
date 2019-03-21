//
//  HLSectionTableViewDataSource.h
//  MeiTuanSteven
//
//  Created by 陈子龙 on 2019/2/28.
//  Copyright © 2019 陈子龙. All rights reserved.
//

#import "HLTableViewDataSource.h"

typedef NSArray* (^HLRowsInSectionBlock)(NSInteger section);

NS_ASSUME_NONNULL_BEGIN

@interface HLSectionTableViewDataSource : HLTableViewDataSource

- (instancetype)initWithItems:(NSArray *)items
                cellIdentifer:(NSString *)identifer
               configureBlock:(HLCellConfigureBlock)block
                    rowsBlock:(HLRowsInSectionBlock)rowsBlock;
@end

NS_ASSUME_NONNULL_END
