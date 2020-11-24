//
//  Views_NDTableViewController+NDSelectableItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDTableViewController (NDSelectableItemViewModel)

+ (instancetype)selectableItemsListViewController;
+ (void (^)(__kindof NDManualTableViewController*, NSIndexPath*))
    selectableItemsListViewControllerDidSelectRowAtIndexPathHandlerWithOldHandler:
        (void (^_Nullable)(__kindof NDManualTableViewController*,
                           NSIndexPath*))oldHandler;
- (void)enableSelectableItems;

@end

NS_ASSUME_NONNULL_END
