//
//  Views_NDCollectionViewController+NDSelectableItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/15/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDCollectionViewController+NDSelectableItemViewModel.h>

#import <NDMVVM/Abstracts_NDItemViewModel.h>
#import <NDMVVM/Abstracts_NDListViewModel.h>
#import <NDMVVM/Abstracts_NDSelectableViewModel.h>

#import <NDMVVM/Abstracts_Privates_NDViewDefaultImpl.h>

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
    auto cellViewModel = [RViewModel(self) viewModelForItem:indexPath.row];
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
NDView_RViewModel_Default_Impl(NDListViewModel);

@end
