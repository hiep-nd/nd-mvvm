//
//  NDViewWrapperViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 3/5/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import <NDMVVM/NDMVVM.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDViewWrapperViewController<ViewType> : NDViewController

@property (nonatomic, strong, readonly) ViewType realView;

@end

NS_ASSUME_NONNULL_END
