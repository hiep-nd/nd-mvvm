//
//  NDContentHeightAdjustableViewDefaultImpl.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDContentHeightAdjustableView.h>
#import <NDMVVM/Abstracts/NDContentHeightAdjustableViewModel.h>

#import "NDViewModelDefaultImpl.h"

NS_ASSUME_NONNULL_BEGIN

#define NDContentHeightAdjustableView_validateViewModel_Root_Default_Impl  \
  -(BOOL)validateViewModel : (__kindof id<NDViewModel>)viewModel {         \
    return [viewModel                                                      \
        conformsToProtocol:@protocol(NDContentHeightAdjustableViewModel)]; \
  }

#define NDContentHeightAdjustableView_validateViewModel_Inheritance_Default_Impl \
  -(BOOL)validateViewModel : (__kindof id<NDViewModel>)viewModel {               \
    return                                                                       \
        [super validateViewModel:viewModel] &&                                   \
        [viewModel                                                               \
            conformsToProtocol:@protocol(NDContentHeightAdjustableViewModel)];   \
  }

NS_ASSUME_NONNULL_END
