//
//  NDListViewModel+Protected.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/24/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/ViewModels/NDListViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NDListViewModel ()

@property(nonatomic, strong)
    NSArray<__kindof id<NDItemViewModel>> *itemViewModels;

@end

NS_ASSUME_NONNULL_END
