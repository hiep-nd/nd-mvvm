//
//  Views_NDViewWrapperViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 3/5/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDViewWrapperViewController<ViewType> : NDViewController

@property(nonatomic, strong, readonly) ViewType realView;

@end

NS_ASSUME_NONNULL_END
