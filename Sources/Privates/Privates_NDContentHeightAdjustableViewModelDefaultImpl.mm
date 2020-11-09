//
//  Privates_NDContentHeightAdjustableViewModelDefaultImpl.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Privates_NDContentHeightAdjustableViewModelDefaultImpl.h>

@implementation NDContentHeightAdjustableViewModelContentReHeightEvent

- (void)on {
  [super on];

  [nd::mvvm::RView<id<NDContentHeightAdjustableView>>(self.owner) updateHeight];
}

@end
