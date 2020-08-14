//
//  NDRefeshableViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDViewModel.h>

#import <NDMVVM/Objects/NDEvent.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDRefeshableViewModelProtocol)
@protocol NDRefeshableViewModel <NDViewModel>

@property(nonatomic, strong, readonly)
    NDEvent<__kindof id<NDRefeshableViewModel>>* refresh;

@end

FOUNDATION_EXPORT
void NDRefeshableViewModelMimicRefresh(id<NDRefeshableViewModel> self)
    NS_REFINED_FOR_SWIFT;

NS_ASSUME_NONNULL_END
