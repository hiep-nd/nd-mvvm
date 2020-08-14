//
//  NDCollectionViewController+NDSelectableItemViewModel.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/15/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDCollectionViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDCollectionViewController (NDSelectableItemViewModel)

+ (instancetype)selectableItemsListViewController;
+ (void (^)(__kindof NDManualCollectionViewController*, NSIndexPath*))
    selectableItemsListViewControllerDidSelectItemAtIndexPathHandlerWithOldHandler:
        (void (^_Nullable)(__kindof NDManualCollectionViewController*,
                           NSIndexPath*))oldHandler;
- (void)enableSelectableItems;

@end

NS_ASSUME_NONNULL_END
