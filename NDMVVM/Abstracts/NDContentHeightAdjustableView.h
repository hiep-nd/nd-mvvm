//
//  NDContentHeightAdjustableView.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDView.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDContentHeightAdjustableViewProtocol)
@protocol NDContentHeightAdjustableView <NDView>

- (void)updateHeight;

@end

NS_ASSUME_NONNULL_END
