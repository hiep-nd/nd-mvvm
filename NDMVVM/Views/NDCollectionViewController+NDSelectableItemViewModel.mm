//
//  NDCollectionViewController+NDSelectableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/15/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDCollectionViewController+NDSelectableItemViewModel.h>

#import <NDMVVM/Abstracts/NDItemViewModel.h>
#import <NDMVVM/Abstracts/NDListViewModel.h>
#import <NDMVVM/Abstracts/NDSelectableViewModel.h>

#import "../Privates/NDViewDefaultImpl.h"

@implementation NDCollectionViewController (NDSelectableItemViewModel)

+ (instancetype)selectableItemsListViewController {
  NDCollectionViewController* obj = [[self alloc] init];
  [obj enableSelectableItems];
  return obj;
}

+ (void (^)(__kindof NDManualCollectionViewController*, NSIndexPath*))
    selectableItemsListViewControllerDidSelectItemAtIndexPathHandlerWithOldHandler:
        (void (^_Nullable)(__kindof NDManualCollectionViewController*,
                           NSIndexPath*))oldHandler {
  return ^(NDCollectionViewController* self, NSIndexPath* indexPath) {
    if (oldHandler) {
      oldHandler(self, indexPath);
    }
    auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.row];
    if ([cellViewModel.class conformsToProtocol:@protocol(
                                                    NDSelectableViewModel)]) {
      [((id<NDSelectableViewModel>)cellViewModel).select on];
    }
  };
}

- (void)enableSelectableItems {
  self.didSelectItemAtIndexPathHandler = [self.class
      selectableItemsListViewControllerDidSelectItemAtIndexPathHandlerWithOldHandler:
          self.didSelectItemAtIndexPathHandler];
}

// MARK: - Privates
ViewModel_Default_Impl(NDListViewModel);

@end
