//
//  NDSingleSubViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDMVVM/Abstracts/NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDSingleSubViewModelProtocol)
@protocol NDSingleSubViewModel<NDViewModel>

@property(nonatomic, strong, readonly) __kindof id<NDViewModel> subViewModel;

@end

NS_ASSUME_NONNULL_END
