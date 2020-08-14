//
//  NDMutableCollectionViewController.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/26/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDMutableCollectionViewController.h>

namespace {
inline NSMutableArray<NSIndexPath*>* ToIndexPaths(NSArray<NSNumber*>* items) {
  if (!items) {
    return nil;
  }
  auto indexPaths = [[NSMutableArray alloc] initWithCapacity:items.count];
  for (__unsafe_unretained NSNumber* item in items) {
    [indexPaths addObject:[NSIndexPath indexPathForItem:item.integerValue
                                              inSection:0]];
  }
  return indexPaths;
}
}

@protocol NDMutableListViewModel;

@implementation NDMutableCollectionViewController

// MARK: - NDMutableListView

- (void)deleteItems:(NSArray<NSNumber*>*)deletedItems
        updateItems:(NSArray<NSNumber*>*)updatedItems
        insertItems:(NSArray<NSNumber*>*)insertedItems {
  if (deletedItems.count == 0 && updatedItems.count == 0 &&
      insertedItems.count == 0) {
    return;
  }

  auto deletedIndexPaths = ToIndexPaths(deletedItems);
  auto updatedIndexPaths = ToIndexPaths(updatedItems);
  auto insertedIndexPaths = ToIndexPaths(insertedItems);
  [self.collectionView
      performBatchUpdates:^{
        if (deletedIndexPaths) {
          [self.collectionView deleteItemsAtIndexPaths:deletedIndexPaths];
        }
        if (updatedIndexPaths) {
          [self.collectionView reloadItemsAtIndexPaths:updatedIndexPaths];
        }
        if (insertedIndexPaths) {
          [self.collectionView insertItemsAtIndexPaths:insertedIndexPaths];
        }
      }
               completion:nil];
}

- (void)reloadAll {
  [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [super validateViewModel:viewModel] &&
         [viewModel conformsToProtocol:@protocol(NDMutableListViewModel)];
}

@end
