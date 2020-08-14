//
//  NDTableViewController+NDAppearableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDTableViewController+NDAppearableItemViewModel.h>

#import <NDMVVM/Abstracts/NDAppearableViewModel.h>
#import <NDMVVM/Abstracts/NDItemViewModel.h>
#import <NDMVVM/Abstracts/NDListViewModel.h>

#import <NDMVVM/Objects/NDEvent.h>

#import <NDMVVM/Views/NDTableViewCell.h>

#import "../Privates/NDViewDefaultImpl.h"

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
    auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.row];
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
ViewModel_Default_Impl(NDListViewModel);

@end
