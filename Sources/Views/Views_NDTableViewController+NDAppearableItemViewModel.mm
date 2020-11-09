//
//  Views_NDTableViewController+NDAppearableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController+NDAppearableItemViewModel.h>

#import <NDMVVM/Abstracts_NDAppearableViewModel.h>
#import <NDMVVM/Abstracts_NDItemViewModel.h>
#import <NDMVVM/Abstracts_NDListViewModel.h>

#import <NDUtils/NDUtils.h>

#import <NDMVVM/Views_NDTableViewCell.h>

#import <NDMVVM/Privates_NDViewDefaultImpl.h>

@implementation NDTableViewController (NDAppearableItemViewModel)

+ (instancetype)appearableItemsListViewController {
  NDTableViewController* obj = [[self alloc] init];
  [obj enableAppearableItems];
  return obj;
}

+ (void (^)(__kindof NDManualTableViewController*,
            __kindof UITableViewCell*,
            NSIndexPath*))
    appearableItemsListViewControllerWillDisplayCellForRowAtIndexPathHandlerWithOldHandler:
        (void (^_Nullable)(__kindof NDManualTableViewController*,
                           __kindof UITableViewCell*,
                           NSIndexPath*))oldHandler {
  return ^(NDTableViewController* self, NDTableViewCell* cell,
           NSIndexPath* indexPath) {
    if (oldHandler) {
      oldHandler(self, cell, indexPath);
    }
    auto cellViewModel = [RViewModel(self) viewModelForItem:indexPath.row];
    if ([cellViewModel.class conformsToProtocol:@protocol(
                                                    NDAppearableViewModel)]) {
      [((id<NDAppearableViewModel>)cellViewModel).appear on];
    }
  };
}

- (void)enableAppearableItems {
  self.willDisplayCellForRowAtIndexPathHandler = [self.class
      appearableItemsListViewControllerWillDisplayCellForRowAtIndexPathHandlerWithOldHandler:
          self.willDisplayCellForRowAtIndexPathHandler];
}

// MARK: -Privates
NDView_RViewModel_Default_Impl(NDListViewModel);

@end
