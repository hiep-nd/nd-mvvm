//
//  NDAppearableViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDViewModel.h>

#import <NDMVVM/Objects/NDEvent.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAppearableViewModelProtocol)
@protocol NDAppearableViewModel <NDViewModel>

@property(nonatomic, strong, readonly)
    NDEvent<id<NDAppearableViewModel>>* appear;

@end

NS_ASSUME_NONNULL_END
