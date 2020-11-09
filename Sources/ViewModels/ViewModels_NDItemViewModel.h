//
//  ViewModels_NDItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDViewModel.h>

#import <NDMVVM/Abstracts_NDItemViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDItemViewModel : NDViewModel <NDItemViewModel>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithIdentifier:(NSString*)identifier
    NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
