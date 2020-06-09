//
//  NDMutableListViewModel.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/24/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels/NDMutableListViewModel.h>

#import <NDMVVM/Abstracts/NDMutableListView.h>
#import <NDMVVM/ViewModels/NDListViewModel+Protected.h>

@implementation NDMutableListViewModel

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
  [View(self) insertItem:item];
}

- (void)replaceItemViewModel:(__kindof id<NDItemViewModel>)itemViewModel
                      atItem:(NSInteger)item {
  ItemViewModels(self)[item] = itemViewModel;
  [View(self) updateItem:item];
}

- (void)deleteItemViewModelAtItem:(NSInteger)item {
  [View(self) deleteItem:item];
}

- (void)batchUpdate:(void (^)())update {
  if (update) {
    if (View(self)) {
      [View(self) batchUpdate:update];
    } else {
      update();
    }
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
  return (NSMutableArray*)self.itemViewModels;
}
}

@end
