//
//  NDViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDManualObject/NDManualObject.h>

#import <NDMVVM/Abstracts/NDView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDViewController : NDManualViewController<NDView>

@property(nonatomic, copy) void (^_Nullable loadHandler)(NDViewController*);

@end

NS_ASSUME_NONNULL_END
