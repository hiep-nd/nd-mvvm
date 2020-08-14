//
//  NDContentHeightAdjustableViewModelDefaultImpl.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import "NDContentHeightAdjustableViewModelDefaultImpl.h"

@implementation NDContentHeightAdjustableViewModelContentReHeightEvent

- (void)on {
  [super on];

  [nd::View<id<NDContentHeightAdjustableView>>(self.owner) updateHeight];
}

@end
