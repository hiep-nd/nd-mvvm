//
//  NDSelectableItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 6/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDItemViewModel.h>

#import <NDMVVM/Abstracts/NDSelectableViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDSelectableItemViewModel : NDItemViewModel <NDSelectableViewModel>
@end

NS_ASSUME_NONNULL_END
