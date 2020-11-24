//
//  Abstracts_NDContentHeightAdjustableViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDViewModel.h>

#import <NDUtils/NDUtils.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDContentHeightAdjustableViewModelProtocol)
@protocol NDContentHeightAdjustableViewModel <NDViewModel>

@property(nonatomic, strong, readonly)
    NDEvent<id<NDContentHeightAdjustableViewModel>>* contentReHeight;

@end

NS_ASSUME_NONNULL_END
