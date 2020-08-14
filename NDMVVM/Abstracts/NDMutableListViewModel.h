//
//  NDMutableListViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 3/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDListViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDMutableListViewModelProtocol)
@protocol NDMutableListViewModel <NDListViewModel>

@property(nonatomic, strong)
    __kindof NSArray<__kindof id<NDItemViewModel>>* itemViewModels;

- (void)insertItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel
                     atItem:(NSInteger)item;
- (void)replaceItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel
                      atItem:(NSInteger)item;
- (void)deleteItemViewModelAtItem:(NSInteger)item;
- (void)batchUpdates:(void(NS_NOESCAPE ^)(void))updates;

@end

NS_ASSUME_NONNULL_END
