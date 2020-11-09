//
//  Views_NDTableViewController+NDContentHeightAdjustableTableViewCell.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController+NDContentHeightAdjustableTableViewCell.h>

#import <NDMVVM/Views_NDContentHeightAdjustableTableViewCell.h>

#import <NDUtils/NDUtils.h>

@implementation NDTableViewController (NDContentHeightAdjustableTableViewCell)

+ (instancetype)contentHeightAdjustableItemsListViewController {
  NDTableViewController* obj = [[self alloc] init];
  [obj enableContentHeightAdjustableItems];
  return obj;
}

+ (void (^)(__kindof NDManualTableViewController* _Nonnull,
            __kindof UITableViewCell* _Nonnull,
            NSIndexPath* _Nonnull))
    contentHeightAdjustableItemsListViewControllerPrepareCellForRowAtIndexPathHandlerWithOldHandler:
        (void (^)(__kindof NDManualTableViewController* _Nonnull,
                  __kindof UITableViewCell* _Nonnull,
                  NSIndexPath* _Nonnull))oldHandler {
  return ^void(NDTableViewController* self, UITableViewCell* cell,
               NSIndexPath* indexPath) {
    NDCallIfCan(oldHandler, self, cell, indexPath);
    if ([cell isKindOfClass:NDContentHeightAdjustableTableViewCell.class]) {
      ((NDContentHeightAdjustableTableViewCell*)cell).tableView =
          self.tableView;
    }
  };
}

- (void)enableContentHeightAdjustableItems {
  self.prepareCellForRowAtIndexPathHandler = [self.class
      contentHeightAdjustableItemsListViewControllerPrepareCellForRowAtIndexPathHandlerWithOldHandler:
          self.prepareCellForRowAtIndexPathHandler];
}

@end
