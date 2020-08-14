//
//  NDContentHeightAdjustableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDContentHeightAdjustableItemViewModel.h>

#import "../Privates/NDContentHeightAdjustableViewModelDefaultImpl.h"

@implementation NDContentHeightAdjustableItemViewModel

- (instancetype)initWithIdentifier:(NSString*)identifier {
  self = [super initWithIdentifier:identifier];
  if (self) {
    _contentReHeight =
        [[NDContentHeightAdjustableViewModelContentReHeightEvent alloc]
            initWithOwner:self];
  }
  return self;
}

NDContentHeightAdjustableView_Inheritance_Default_Impl;

@end
