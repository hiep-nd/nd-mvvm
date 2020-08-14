//
//  NDViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDViewModel.h>

#import <NDMVVM/Abstracts/NDView.h>

#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

using namespace nd::objc;

@implementation NDViewModel

@synthesize view = _view;

// TODO: - need confirm
//- (void)setView:(__kindof id<NDView>)view {
////  if (NDSameOrEquals(_view, view)) {
////    return;
////  }
////
////  if (view && ![self validateView:view]) {
////    NDCAssertionFailure(@"Unexpected type: Set '%@' as '%@'.view.",
///view.class, /                        self.class); /    self.view = nil; /
///return; /  }
////
////  auto oldView = _view;
////  _view = view;
////  [self didSetViewFromOldView:oldView];
//}

- (BOOL)validateView:(__kindof id<NDView>)view {
  return YES;
}

- (void)didSetViewFromOldView:(__kindof id<NDView>)oldView {
}

@end

namespace {
inline void View_ViewModel_Setter(
    __kindof id<NDView> _Nullable view,
    __kindof id<NDViewModel> _Nullable viewModel) {
  if (!view) {
    return;
  }

  auto oldViewModel = view.viewModel;
  view.viewModel = viewModel;
  [view didSetViewModelFromOldViewModel:oldViewModel];
}

inline void ViewModel_View_Setter(__kindof id<NDViewModel> _Nullable viewModel,
                                  __kindof id<NDView> _Nullable view) {
  if (!viewModel) {
    return;
  }

  auto oldView = viewModel.view;
  viewModel.view = view;
  [viewModel didSetViewFromOldView:oldView];
}

inline void NDBlindRoute(__kindof id<NDViewModel> _Nullable viewModel,
                         __kindof id<NDView> _Nullable view,
                         __kindof id<NDViewModel> _Nullable viewModel1,
                         __kindof id<NDView> _Nullable view1) {
  View_ViewModel_Setter(viewModel.view, nil);
  ViewModel_View_Setter(view.viewModel, nil);
  ViewModel_View_Setter(viewModel, view1);
  View_ViewModel_Setter(view, viewModel);
}
}

void NDRoute(__kindof id<NDViewModel> _Nullable viewModel,
             __kindof id<NDView> _Nullable view) {
  auto testViews = SameOrEquals(viewModel.view, view);
  auto testViewModels = SameOrEquals(view.viewModel, viewModel);
  if (testViews && testViewModels) {
    return;
  }
  if (testViews != testViewModels) {
    NDCAssertionFailure(@"Detect invalid route between '%@' and '%@'.",
                        viewModel, view);
  }

  if (!view || !viewModel) {
    NDBlindRoute(viewModel, view, viewModel, view);
    return;
  }

  if (![viewModel validateView:view]) {
    NDCAssertionFailure(@"Unexpected type: Set '%@' as '%@'.view.", view.class,
                        viewModel.class);
    NDBlindRoute(viewModel, view, nil, nil);
    return;
  }

  if (![view validateViewModel:viewModel]) {
    NDCAssertionFailure(@"Unexpected type: Set '%@' as '%@'.viewModel.",
                        viewModel.class, view.class);
    NDBlindRoute(viewModel, view, nil, nil);
    return;
  }

  NDBlindRoute(viewModel, view, viewModel, view);
}
