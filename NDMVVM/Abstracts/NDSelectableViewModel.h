//
//  NDSelectableViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDMVVM/Abstracts/NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDSelectableViewModelProtocol)
@protocol NDSelectableViewModel<NDViewModel>

@property(nonatomic, copy, nullable) void (^selectHandler)(__kindof id<NDSelectableViewModel> item);
- (void)select;

@end

NS_ASSUME_NONNULL_END
