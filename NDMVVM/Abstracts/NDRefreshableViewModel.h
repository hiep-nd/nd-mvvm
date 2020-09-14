//
//  NDRefreshableViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDViewModel.h>

#import <NDUtils/NDUtils.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDRefreshableViewModelProtocol)
@protocol NDRefreshableViewModel <NDViewModel>

@property(nonatomic, strong, readonly)
    NDEvent<__kindof id<NDRefreshableViewModel>>* refresh;

@end

FOUNDATION_EXPORT
void NDRefreshableViewModelMimicRefresh(id<NDRefreshableViewModel> self)
    NS_REFINED_FOR_SWIFT;

NS_ASSUME_NONNULL_END
