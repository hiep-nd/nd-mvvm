//
//  NDSelectableViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/17/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDSelectableViewModel.h>

@implementation NDSelectableViewModel

@synthesize selectHandler;

- (void)select {
  if (self.selectHandler) {
    self.selectHandler(self);
  }
}

@end
