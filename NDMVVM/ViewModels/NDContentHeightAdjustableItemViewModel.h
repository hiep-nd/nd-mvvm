//
//  NDContentHeightAdjustableItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDItemViewModel.h>

#import <NDMVVM/Abstracts/NDContentHeightAdjustableViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDContentHeightAdjustableItemViewModel
    : NDItemViewModel <NDContentHeightAdjustableViewModel>

@end

NS_ASSUME_NONNULL_END
