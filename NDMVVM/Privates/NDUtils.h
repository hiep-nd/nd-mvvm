//
//  NDUtils.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/24/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDLog/NDLog.h>
#import <NDMVVM/Abstracts/NDView.h>
#import <NDMVVM/Abstracts/NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

namespace nd {
inline BOOL SameOrEqual(id lv, id rv) {
  return lv == rv || [lv isEqual:rv];
}

inline void ViewViewModelSetter(
    id<NDView> self,
    __kindof id<NDViewModel> _Nullable __strong& _viewModel,
    __kindof id<NDViewModel> _Nullable viewModel) {
  if (SameOrEqual(_viewModel, viewModel)) {
    return;
  }

  if (viewModel && ![self validateViewModel:viewModel]) {
    NDCAssertFailure(@"Unexpected type: Set '%@' as '%@'.viewModel.",
                     viewModel.class, self.class);
    ViewViewModelSetter(self, _viewModel, nil);
    return;
  }

  auto oldViewModel = _viewModel;
  _viewModel = viewModel;
  [self didSetViewModelFromOldViewModel:oldViewModel];
}
}

#define NDView_ViewModel_Setter_Default_Impl                     \
  -(void)setViewModel : (__kindof id<NDViewModel>)viewModel {    \
    return nd::ViewViewModelSetter(self, _viewModel, viewModel); \
  }

#define NDView_Default_Impl                                        \
  @synthesize viewModel = _viewModel;                              \
                                                                   \
  NDView_ViewModel_Setter_Default_Impl;                            \
                                                                   \
  -(BOOL)validateViewModel : (__kindof id<NDViewModel>)viewModel { \
    return YES;                                                    \
  }                                                                \
                                                                   \
  -(void)didSetViewModelFromOldViewModel                           \
      : (__kindof id<NDViewModel>)oldViewModel {                   \
  }

#define ViewModel_Default_Impl(RType)                                    \
  namespace {                                                            \
  inline id<RType> ViewModel(id<NDView> self) { return self.viewModel; } \
  }

NS_ASSUME_NONNULL_END
