//
//  Views_NDViewModel+NDMVVM_Views.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 20/11/2020.
//

#import <NDMVVM/Views_NDViewModel+NDMVVM_Views.h>

#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

using namespace nd::objc;

void NDViewModelUIViewControllerDismiss(__kindof id<NDViewModel> self,
                                        BOOL animated,
                                        void (^completion)(void)) {
  auto view = self.view;
  if (!view) {
    return;
  }

  auto controller = Cast<UIViewController>(view);
  if (!controller) {
    NDCAssertionFailure(@"Can not NDViewModelUIViewControllerDismiss with "
                        @"self: '%@', view: '%@'.",
                        self, view);
    return;
  }

  __block auto capturedSelf = self;
  [controller dismissViewControllerAnimated:animated
                                 completion:^{
                                   NDCallIfCan(completion);
                                   capturedSelf = nil;
                                 }];
}

NSArray<UIViewController*>*
NDViewModelUIViewControllerPopToPreviousViewController(
    __kindof id<NDViewModel> self,
    UIViewController* viewController,
    BOOL animated,
    void (^_Nullable completion)(void)) {
  auto view = self.view;
  if (!view) {
    return nil;
  }

  auto controller = Cast<UIViewController>(view);
  if (!controller) {
    NDCAssertionFailure(
        @"Can not NDViewModelUIViewControllerPopToPreviousViewController with "
        @"self: '%@', view: '%@'.",
        self, view);
    return nil;
  }

  __block auto capturedSelf = self;
  return [controller.navigationController
      nd_popToPreviousViewController:viewController
                            animated:animated
                          completion:^{
                            NDCallIfCan(completion);
                            capturedSelf = nil;
                          }];
}

NSArray<UIViewController*>* NDViewModelUIViewControllerPopToPreviousViewModel(
    __kindof id<NDViewModel> self,
    __kindof id<NDViewModel> viewModel,
    BOOL animated,
    void (^_Nullable completion)(void)) {
  auto view = viewModel.view;
  if (!view) {
    return nil;
  }

  auto viewController = Cast<UIViewController>(view);
  if (!viewController) {
    NDCAssertionFailure(
        @"Can not NDViewModelUIViewControllerPopToPreviousViewModel with "
        @"view model: '%@', view: '%@'.",
        viewModel, view);
    return nil;
  }

  return NDViewModelUIViewControllerPopToPreviousViewController(
      self, viewController, animated, completion);
}

