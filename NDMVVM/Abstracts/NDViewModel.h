//
//  NDViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NDView;

NS_SWIFT_NAME(NDViewModelProtocol)
@protocol NDViewModel<NSObject>

/**
 The view. Don't use the setter unless you have got strong reason, use the
 NDRoute instead.
 */
@property(nonatomic, weak) __kindof id<NDView> _Nullable view;
- (BOOL)validateView:(__kindof id<NDView>)view;
- (void)didSetViewFromOldView:(__kindof id<NDView> _Nullable)oldView;

@end

/**
 Route the view and view model. It creates a 2-way relationship of view and view
 model.

 @param viewModel The view model.
 @param view The view.
 */
FOUNDATION_EXPORT
void NDRoute(__kindof id<NDViewModel> _Nullable viewModel,
             __kindof id<NDView> _Nullable view)
  NS_SWIFT_NAME(route(viewModel:view:));

NS_ASSUME_NONNULL_END
