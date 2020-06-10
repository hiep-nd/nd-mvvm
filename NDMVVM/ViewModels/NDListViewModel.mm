//
//  NDListViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import "Privates/NDListViewModel+Protected.h"

@protocol NDListView;

@implementation NDListViewModel

- (instancetype)initWithItemViewModels:
    (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels {
  self = [super init];
  if (self) {
    self.itemViewModels = itemViewModels;
  }
  return self;
}

- (NSInteger)numberOfItems {
  return self.itemViewModels.count;
}

- (__kindof id<NDViewModel>)viewModelForItem:(NSInteger)item {
  return self.itemViewModels[item];
}

// MARK: - NDViewModel

- (BOOL)validateView:(__kindof id<NDView>)view {
  return [super validateView:view] &&
         [view conformsToProtocol:@protocol(NDListView)];
}

@end
