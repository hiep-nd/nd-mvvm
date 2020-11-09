//
//  Views_NDTableViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController.h>

#import <NDMVVM/Abstracts_NDItemViewModel.h>
#import <NDMVVM/Abstracts_NDListViewModel.h>
#import <NDMVVM/Views_NDTableViewCell.h>

#import <NDLog/NDLog.h>

#import <NDMVVM/Abstracts_Privates_NDViewDefaultImpl.h>

using namespace nd;

@implementation NDTableViewController

// MARK: - NDManualTableViewController
- (void)manualInit {
  [super manualInit];

  self.numberOfRowsInSectionHandler =
      ^NSInteger(NDTableViewController* self, NSInteger section) {
        return RViewModel(self).numberOfItems;
      };

  self.cellReusableIdentifierForRowAtIndexPathHandler =
      ^NSString*(NDTableViewController* self, NSIndexPath* indexPath) {
    return [RViewModel(self) viewModelForItem:indexPath.row].identifier;
  };
  self.prepareCellForRowAtIndexPathHandler =
      ^(NDTableViewController* self, NDTableViewCell* cell,
        NSIndexPath* indexPath) {
        NDConnect([RViewModel(self) viewModelForItem:indexPath.row], cell);
      };
}

// MARK: - NDListView
@synthesize viewModel = _viewModel;

// TODO: - need confirm
// NDView_ViewModel_Setter_Default_Impl;

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [viewModel conformsToProtocol:@protocol(NDListViewModel)];
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [self.tableView reloadData];
}

// MARK: - Privates

NDView_RViewModel_Default_Impl(NDListViewModel);

@end
