//
//  NDMutableTableViewController.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/26/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDMutableTableViewController.h>

@protocol NDMutableListViewModel;

@implementation NDMutableTableViewController

// MARK: - NDMutableListView

- (void)batchUpdate:(nonnull void (^)())update {
  if (@available(iOS 11, tvOS 11, *)) {
    [self.tableView performBatchUpdates:update completion:nil];
  } else {
    if (update) {
      [self.tableView beginUpdates];
      update();
      [self.tableView endUpdates];
    }
  }
}

- (void)deleteItem:(NSInteger)item {
  [self.tableView deleteRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:item
                                                               inSection:0] ]
                        withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)insertItem:(NSInteger)item {
  [self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:item
                                                               inSection:0] ]
                        withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)reloadAll {
  [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateItem:(NSInteger)item {
  [self.tableView reloadRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:item
                                                               inSection:0] ]
                        withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [super validateViewModel:viewModel] &&
         [viewModel conformsToProtocol:@protocol(NDMutableListViewModel)];
}

@end
