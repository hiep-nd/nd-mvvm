//
//  Abstracts_NDListViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NDItemViewModel;

NS_SWIFT_NAME(NDListViewModelProtocol)
@protocol NDListViewModel <NDViewModel>

- (NSInteger)numberOfItems;
- (__kindof id<NDItemViewModel>)viewModelForItem:(NSInteger)item;

@end

NS_ASSUME_NONNULL_END
