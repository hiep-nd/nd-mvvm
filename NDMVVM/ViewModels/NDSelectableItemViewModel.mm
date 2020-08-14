//
//  NDSelectableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 6/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDSelectableItemViewModel.h>

@implementation NDSelectableItemViewModel

@synthesize select = _select;

- (instancetype)initWithIdentifier:(NSString*)identifier {
  self = [super initWithIdentifier:identifier];
  if (self) {
    _select = [[NDEvent alloc] initWithOwner:self];
  }
  return self;
}

@end
