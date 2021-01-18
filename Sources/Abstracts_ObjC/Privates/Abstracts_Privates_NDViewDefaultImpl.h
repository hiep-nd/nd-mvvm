//
//  Abstracts_Privates_NDViewDefaultImpl.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#ifdef __cplusplus

#import <NDLog/NDLog.h>
#import <NDMVVM/Abstracts_NDView.h>
#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

namespace nd {
namespace mvvm {
template <typename RType>
inline RType RViewModel(id<NDView> self) {
  return self.viewModel;
}
}
}

#define NDView_RViewModel_Default_Impl(RType)     \
  namespace {                                     \
  inline id<RType> RViewModel(id<NDView> self) {  \
    return nd::mvvm::RViewModel<id<RType>>(self); \
  }                                               \
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

#endif
