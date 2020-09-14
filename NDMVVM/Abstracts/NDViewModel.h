//
//  NDViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NDView;

NS_SWIFT_NAME(NDViewModelProtocol)
@protocol NDViewModel <NSObject>

/**
 The view. Don't use the setter unless you have got strong reason, use the
 NDConnect instead.
 */
@property(nonatomic, weak) __kindof id<NDView> _Nullable view;
- (BOOL)validateView:(__kindof id<NDView>)view;
- (void)didSetViewFromOldView:(__kindof id<NDView> _Nullable)oldView;

@end

/**
 Connect the view and view model. It creates a 2-way relationship of view and
 view model.

 @param viewModel The view model.
 @param view The view.
 */
FOUNDATION_EXPORT
void NDConnect(__kindof id<NDViewModel> _Nullable viewModel,
               __kindof id<NDView> _Nullable view)
    NS_SWIFT_NAME(nd_connect(viewModel:view:));

NS_ASSUME_NONNULL_END
