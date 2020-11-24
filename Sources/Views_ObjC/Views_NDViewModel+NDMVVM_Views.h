//
//  Views_NDViewModel+NDMVVM_Views.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 20/11/2020.
//

#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT void NDViewModelUIViewControllerDismiss(
    __kindof id<NDViewModel> self,
    BOOL animated,
    void (^_Nullable completion)(void)) NS_REFINED_FOR_SWIFT;

FOUNDATION_EXPORT NSArray<UIViewController*>*
NDViewModelUIViewControllerPopToPreviousViewController(
    __kindof id<NDViewModel> self,
    UIViewController* viewController,
    BOOL animated,
    void (^_Nullable completion)(void)) NS_REFINED_FOR_SWIFT;

FOUNDATION_EXPORT
NSArray<UIViewController*>* NDViewModelUIViewControllerPopToPreviousViewModel(
    __kindof id<NDViewModel> self,
    __kindof id<NDViewModel> viewModel,
    BOOL animated,
    void (^_Nullable completion)(void)) NS_REFINED_FOR_SWIFT;

NS_ASSUME_NONNULL_END
