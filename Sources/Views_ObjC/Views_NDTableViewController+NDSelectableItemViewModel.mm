//
//  Views_NDTableViewController+NDSelectableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController+NDSelectableItemViewModel.h>

#import <NDMVVM/Abstracts_NDItemViewModel.h>
#import <NDMVVM/Abstracts_NDListViewModel.h>
#import <NDMVVM/Abstracts_NDSelectableViewModel.h>

#import <NDMVVM/Abstracts_Privates_NDViewDefaultImpl.h>

@implementation NDTableViewController (NDSelectableItemViewModel)

+ (instancetype)selectableItemsListViewController {
  NDTableViewController* obj = [[self alloc] init];
  [obj enableSelectableItems];
  return obj;
}

+ (void (^)(__kindof NDManualTableViewController* _Nonnull,
            NSIndexPath* _Nonnull))
    selectableItemsListViewControllerDidSelectRowAtIndexPathHandlerWithOldHandler:
        (void (^)(__kindof NDManualTableViewController* _Nonnull,
                  NSIndexPath* _Nonnull))oldHandler {
  return ^(NDTableViewController* self, NSIndexPath* indexPath) {
    if (oldHandler) {
      oldHandler(self, indexPath);
    }
    auto cellViewModel = [RViewModel(self) viewModelForItem:indexPath.row];
    if ([cellViewModel.class conformsToProtocol:@protocol(
                                                    NDSelectableViewModel)]) {
      [((id<NDSelectableViewModel>)cellViewModel).select on];
    }
  };
}

- (void)enableSelectableItems {
  self.didSelectRowAtIndexPathHandler = [self.class
      selectableItemsListViewControllerDidSelectRowAtIndexPathHandlerWithOldHandler:
          self.didSelectRowAtIndexPathHandler];
}

// MARK: - Privates
NDView_RViewModel_Default_Impl(NDListViewModel);

@end
