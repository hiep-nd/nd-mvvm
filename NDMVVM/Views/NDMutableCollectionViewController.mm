//
//  NDMutableCollectionViewController.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/26/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDMutableCollectionViewController.h>

@protocol NDMutableListViewModel;

@implementation NDMutableCollectionViewController

// MARK: - NDMutableListView

- (void)batchUpdate:(nonnull void (^)())update {
  [self.collectionView performBatchUpdates:update completion:nil];
}

- (void)deleteItem:(NSInteger)item {
  [self.collectionView
      deleteItemsAtIndexPaths:@[ [NSIndexPath indexPathForItem:item
                                                     inSection:0] ]];
}

- (void)insertItem:(NSInteger)item {
  [self.collectionView
      insertItemsAtIndexPaths:@[ [NSIndexPath indexPathForItem:item
                                                     inSection:0] ]];
}

- (void)reloadAll {
  [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (void)updateItem:(NSInteger)item {
  [self.collectionView
      reloadItemsAtIndexPaths:@[ [NSIndexPath indexPathForItem:item
                                                     inSection:0] ]];
}

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [super validateViewModel:viewModel] &&
         [viewModel conformsToProtocol:@protocol(NDMutableListViewModel)];
}

@end
