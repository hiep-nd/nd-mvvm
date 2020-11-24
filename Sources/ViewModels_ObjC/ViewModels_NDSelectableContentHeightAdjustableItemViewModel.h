//
//  ViewModels_NDSelectableContentHeightAdjustableItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDContentHeightAdjustableItemViewModel.h>

#import <NDMVVM/Abstracts_NDSelectableViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDSelectableContentHeightAdjustableItemViewModel
    : NDContentHeightAdjustableItemViewModel <NDSelectableViewModel>

@end

NS_ASSUME_NONNULL_END
