//
//  NDView.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NDViewModel;

NS_SWIFT_NAME(NDViewProtocol)
@protocol NDView<NSObject>

/**
The view model. Don't use the setter unless you have got strong reason, use the
NDRoute instead.
 */
@property(nonatomic, strong) __kindof id<NDViewModel> _Nullable viewModel;
- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel;
- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel> _Nullable)oldViewModel;

@end

NS_ASSUME_NONNULL_END
