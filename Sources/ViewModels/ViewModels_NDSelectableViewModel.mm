//
//  ViewModels_NDSelectableViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/17/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDSelectableViewModel.h>

@implementation NDSelectableViewModel

@synthesize select = _select;

- (instancetype)init {
  self = [super init];
  if (self) {
    _select = [[NDEvent alloc] initWithOwner:self];
  }
  return self;
}

@end
