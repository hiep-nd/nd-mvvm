//
//  NDViewDefaultImpl.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDLog/NDLog.h>
#import <NDMVVM/Abstracts/NDView.h>
#import <NDMVVM/Abstracts/NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

namespace nd {
template <typename RType>
inline RType ViewModel(id<NDView> self) {
  return self.viewModel;
}
}

#define ViewModel_Default_Impl(RType)           \
  namespace {                                   \
  inline id<RType> ViewModel(id<NDView> self) { \
    return nd::ViewModel<id<RType>>(self);      \
  }                                             \
  }

#define NDView_Default_Impl                                        \
  @synthesize viewModel = _viewModel;                              \
                                                                   \
  -(BOOL)validateViewModel : (__kindof id<NDViewModel>)viewModel { \
    return YES;                                                    \
  }                                                                \
                                                                   \
  -(void)didSetViewModelFromOldViewModel                           \
      : (__kindof id<NDViewModel>)oldViewModel {                   \
  }

NS_ASSUME_NONNULL_END
