//
//  ViewModels_NDAppearableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDAppearableItemViewModel.h>

@implementation NDAppearableItemViewModel

- (instancetype)initWithIdentifier:(NSString*)identifier {
  self = [super initWithIdentifier:identifier];
  if (self) {
    _appear = [[NDEvent<NDAppearableItemViewModel*> alloc] initWithOwner:self];
  }
  return self;
}

@synthesize appear = _appear;

@end
