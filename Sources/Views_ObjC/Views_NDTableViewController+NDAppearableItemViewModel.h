//
//  Views_NDTableViewController+NDAppearableItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDTableViewController (NDAppearableItemViewModel)

+ (instancetype)appearableItemsListViewController;
+ (void (^)(__kindof NDManualTableViewController*,
            __kindof UITableViewCell*,
            NSIndexPath*))
    appearableItemsListViewControllerWillDisplayCellForRowAtIndexPathHandlerWithOldHandler:
        (void (^_Nullable)(__kindof NDManualTableViewController*,
                           __kindof UITableViewCell*,
                           NSIndexPath*))oldHandler;
- (void)enableAppearableItems;

@end

NS_ASSUME_NONNULL_END
