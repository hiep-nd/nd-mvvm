//
//  NDSingleSubItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDMVVM/ViewModels/NDItemViewModel.h>

#import <NDMVVM/Abstracts/NDSingleSubViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDSingleSubItemViewModel : NDItemViewModel <NDSingleSubViewModel>

- (instancetype)initWithIdentifier:(NSString *)identifier NS_UNAVAILABLE;
- (instancetype)initWithIdentifier:(NSString *)identifier
                      subViewModel:(id<NDViewModel>)subViewModel
    NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
