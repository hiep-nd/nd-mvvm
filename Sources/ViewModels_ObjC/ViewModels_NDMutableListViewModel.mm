//
//  ViewModels_NDMutableListViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/24/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDMutableListViewModel.h>

#import <NDMVVM/Abstracts_NDMutableListView.h>

#import <NDMVVM/ViewModels_Privates_NDListViewModel+Protected.h>
#import <NDMVVM/ViewModels_Privates_NDMutableListViewModelHelper.h>

@implementation NDMutableListViewModel {
  NDMutableListViewModelHelper _helper;
}

// MARK: - NDMutableListViewModel

@dynamic itemViewModels;

- (void)setItemViewModels:
    (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels {
  super.itemViewModels = [[NSMutableArray alloc] initWithArray:itemViewModels];
  [View(self) reloadAll];
}

- (void)insertItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel
                     atItem:(NSInteger)item {
  [ItemViewModels(self) insertObject:itemViewModel atIndex:item];
  if (!_helper.IsBatchUpdating()) {
    [View(self) deleteItems:nil updateItems:nil insertItems:@[ @(item) ]];
  } else {
    _helper.Insert(item);
  }
}

- (void)replaceItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel
                      atItem:(NSInteger)item {
  ItemViewModels(self)[item] = itemViewModel;
  if (!_helper.IsBatchUpdating()) {
    [View(self) deleteItems:nil updateItems:@[ @(item) ] insertItems:nil];
  } else {
    _helper.Update(item);
  }
}

- (void)deleteItemViewModelAtItem:(NSInteger)item {
  [ItemViewModels(self) removeObjectAtIndex:item];
  if (!_helper.IsBatchUpdating()) {
    [View(self) deleteItems:@[ @(item) ] updateItems:nil insertItems:nil];
  } else {
    _helper.Delete(item);
  }
}

- (void)batchUpdates:(void(NS_NOESCAPE ^)(void))updates {
  if (!updates) {
    return;
  }

  if (_helper.IsBatchUpdating()) {
    updates();
  } else {
    _helper.BeginUpdates();
    updates();
    NSMutableArray *deleteds, *updateds, *inserteds;
    _helper.EndUpdates(&deleteds, &updateds, &inserteds);
    [View(self) deleteItems:deleteds
                updateItems:updateds
                insertItems:inserteds];
  }
}

// MARK: - NDViewModel

- (BOOL)validateView:(__kindof id<NDView>)view {
  return [super validateView:view] &&
         [view conformsToProtocol:@protocol(NDMutableListView)];
}

// MARK: - Privates

namespace {
inline id<NDMutableListView> View(id<NDViewModel> self) {
  return self.view;
}

inline NSMutableArray<__kindof id<NDItemViewModel>>* ItemViewModels(
    id<NDMutableListViewModel> self) {
  return self.itemViewModels;
}
}

@end

@implementation NDMutableListViewModel (NDUtils)

- (void)insertItemViewModels:
            (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels
                      atItem:(NSInteger)item {
  [itemViewModels enumerateObjectsUsingBlock:^(__kindof id<NDItemViewModel> obj,
                                               NSUInteger idx, BOOL* stop) {
    [self insertItemViewModel:obj atItem:idx + item];
  }];
}

- (void)addItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel {
  [self insertItemViewModel:itemViewModel atItem:ItemViewModels(self).count];
}

- (void)addItemViewModels:
    (NSArray<__kindof id<NDItemViewModel>>*)itemViewModels {
  [itemViewModels enumerateObjectsUsingBlock:^(__kindof id<NDItemViewModel> obj,
                                               NSUInteger, BOOL*) {
    [self addItemViewModel:obj];
  }];
}

@end
