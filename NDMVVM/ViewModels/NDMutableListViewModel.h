//
//  NDMutableListViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/24/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDListViewModel.h>

#import <NDMVVM/Abstracts/NDMutableListViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDMutableListViewModel : NDListViewModel <NDMutableListViewModel>
@end

@interface NDMutableListViewModel (NDUtils)

- (void)insertItemViewModels:
            (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels
                      atItem:(NSInteger)item;
- (void)addItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel;
- (void)addItemViewModels:
    (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels;

@end

NS_ASSUME_NONNULL_END
