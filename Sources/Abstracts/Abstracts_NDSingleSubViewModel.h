//
//  Abstracts_NDSingleSubViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDSingleSubViewModelProtocol)
@protocol NDSingleSubViewModel <NDViewModel>

@property(nonatomic, strong, readonly) __kindof id<NDViewModel> subViewModel;

@end

NS_ASSUME_NONNULL_END
