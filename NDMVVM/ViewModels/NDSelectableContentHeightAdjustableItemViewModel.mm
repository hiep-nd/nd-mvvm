//
//  NDSelectableContentHeightAdjustableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDSelectableContentHeightAdjustableItemViewModel.h>

@implementation NDSelectableContentHeightAdjustableItemViewModel

- (instancetype)initWithIdentifier:(NSString*)identifier {
  self = [super initWithIdentifier:identifier];
  if (self) {
    _select = [[NDEvent alloc] initWithOwner:self];
  }
  return self;
}

@synthesize select = _select;

@end
