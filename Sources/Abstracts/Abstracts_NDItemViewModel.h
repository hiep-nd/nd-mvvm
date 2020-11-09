//
//  Abstracts_NDItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDItemViewModelProtocol)
@protocol NDItemViewModel <NDViewModel>

@property(nonatomic, strong, readonly) NSString* identifier;

@end

NS_ASSUME_NONNULL_END
