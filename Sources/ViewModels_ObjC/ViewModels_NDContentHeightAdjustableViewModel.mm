//
//  ViewModels_NDContentHeightAdjustableViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDContentHeightAdjustableViewModel.h>

#import <NDMVVM/ViewModels_Privates_NDContentHeightAdjustableViewModelDefaultImpl.h>

@implementation NDContentHeightAdjustableViewModel

- (instancetype)init {
  self = [super init];
  if (self) {
    _contentReHeight =
        [[NDContentHeightAdjustableViewModelContentReHeightEvent alloc]
            initWithOwner:self];
  }
  return self;
}

NDContentHeightAdjustableView_Inheritance_Default_Impl;

@end
