//
//  NDItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDMVVM/ViewModels/NDViewModel.h>

#import <NDMVVM/Abstracts/NDItemViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDItemViewModel : NDViewModel <NDItemViewModel>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithIdentifier:(NSString *)identifier
    NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
