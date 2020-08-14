//
//  NDMutableTableViewController.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/26/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDMutableTableViewController.h>

namespace {
NSMutableArray<NSIndexPath*>* ToIndexPaths(NSArray<NSNumber*>* items) {
  if (!items) {
    return nil;
  }
  auto indexPaths = [[NSMutableArray alloc] initWithCapacity:items.count];
  for (__unsafe_unretained NSNumber* item in items) {
    [indexPaths addObject:[NSIndexPath indexPathForRow:item.integerValue
                                             inSection:0]];
  }
  return indexPaths;
}
}

@protocol NDMutableListViewModel;

@implementation NDMutableTableViewController

// MARK: - NDMutableListView

- (void)reloadAll {
  [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                withRowAnimation:UITableViewRowAnimationAutomatic];
}

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
  auto update = ^{
    if (deletedIndexPaths) {
      [self.tableView deleteRowsAtIndexPaths:deletedIndexPaths
                            withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (updatedIndexPaths) {
      [self reloadRowsAtIndexPaths:updatedIndexPaths
                  withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (insertedIndexPaths) {
      [self.tableView insertRowsAtIndexPaths:insertedIndexPaths
                            withRowAnimation:UITableViewRowAnimationAutomatic];
    }
  };

  [self performBatchUpdates:update];
  //  if (@available(iOS 11, tvOS 11, *)) {
  //    [self.tableView performBatchUpdates:update completion:nil];
  //  } else {
  //    if (update) {
  //      [self.tableView beginUpdates];
  //      update();
  //      [self.tableView endUpdates];
  //    }
  //  }
}

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [super validateViewModel:viewModel] &&
         [viewModel conformsToProtocol:@protocol(NDMutableListViewModel)];
}

@end
