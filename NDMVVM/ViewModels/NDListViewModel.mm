//
//  NDListViewModel.mm
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/ViewModels/NDListViewModel+Protected.h"

#import "NDMVVM/Abstracts/NDListViewModel.h"

@protocol NDListView;

@implementation NDListViewModel

- (instancetype)initWithItemViewModels:
    (NSArray<__kindof id<NDItemViewModel>> *)itemViewModels {
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
