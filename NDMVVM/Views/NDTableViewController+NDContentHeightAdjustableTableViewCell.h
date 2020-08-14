//
//  NDTableViewController+NDContentHeightAdjustableTableViewCell.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDTableViewController (NDContentHeightAdjustableTableViewCell)

+ (instancetype)contentHeightAdjustableItemsListViewController;
+ (void (^)(__kindof NDManualTableViewController*,
            __kindof UITableViewCell*,
            NSIndexPath*))
    contentHeightAdjustableItemsListViewControllerPrepareCellForRowAtIndexPathHandlerWithOldHandler:
        (void (^_Nullable)(__kindof NDManualTableViewController*,
                           __kindof UITableViewCell*,
                           NSIndexPath*))oldHandler;
- (void)enableContentHeightAdjustableItems;

@end

NS_ASSUME_NONNULL_END
