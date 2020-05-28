//
//  NDMutableListView.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDMVVM/Abstracts/NDListView.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDMutableListViewProtocol)
@protocol NDMutableListView<NDListView>

- (void)reloadAll;
- (void)insertItem:(NSInteger)item;
- (void)updateItem:(NSInteger)item;
- (void)deleteItem:(NSInteger)item;
- (void)batchUpdate:(void (^)())update;

@end

NS_ASSUME_NONNULL_END
