//
//  NDViewModel.mm
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/ViewModels/NDViewModel.h"

#import "NDMVVM/Abstracts/NDView.h"
#import "NDMVVM/Privates/NDUtils.h"

#import <NDLog/NDLog.h>

using namespace nd;

@implementation NDViewModel

@synthesize view = _view;

- (void)setView:(__kindof id<NDView>)view {
  if (SameOrEqual(_view, view)) {
    return;
  }

  if (view && ![self validateView:view]) {
    NDCAssertFailure(@"Unexpected type: Set '%@' as '%@'.view.", view.class,
                     self.class);
    self.view = nil;
    return;
  }

  auto oldView = _view;
  _view = view;
  [self didSetViewFromOldView:oldView];
}

- (BOOL)validateView:(__kindof id<NDView>)view {
  return YES;
}

- (void)didSetViewFromOldView:(__kindof id<NDView>)oldView {
}

@end

inline void NDBlindRoute(__kindof id<NDViewModel> _Nullable viewModel,
                         __kindof id<NDView> _Nullable view,
                         __kindof id<NDViewModel> _Nullable viewModel1,
                         __kindof id<NDView> _Nullable view1) {
  viewModel.view.viewModel = nil;
  view.viewModel.view = nil;
  viewModel.view = view1;
  view.viewModel = viewModel1;
}

void NDRoute(__kindof id<NDViewModel> _Nullable viewModel,
             __kindof id<NDView> _Nullable view) {
  auto testViews = SameOrEqual(viewModel.view, view);
  auto testViewModels = SameOrEqual(view.viewModel, viewModel);
  if (testViews && testViewModels) {
    return;
  }
  if (testViews != testViewModels) {
    NDCAssertFailure(@"Detect invalid route between '%@' and '%@'.", viewModel,
                     view);
  }

  if (!view || !viewModel) {
    NDBlindRoute(viewModel, view, viewModel, view);
    return;
  }

  if (![viewModel validateView:view]) {
    NDCAssertFailure(@"Unexpected type: Set '%@' as '%@'.view.", view.class,
                     viewModel.class);
    NDBlindRoute(viewModel, view, nil, nil);
    return;
  }

  if (![view validateViewModel:viewModel]) {
    NDCAssertFailure(@"Unexpected type: Set '%@' as '%@'.viewModel.",
                     viewModel.class, view.class);
    NDBlindRoute(viewModel, view, nil, nil);
    return;
  }

  NDBlindRoute(viewModel, view, viewModel, view);
}
