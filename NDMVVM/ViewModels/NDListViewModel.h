//
//  NDListViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDViewModel.h>

#import <NDMVVM/Abstracts/NDListViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDListViewModel : NDViewModel <NDListViewModel>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithItemViewModels:
    (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels
    NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
