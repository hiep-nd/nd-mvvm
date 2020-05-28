//
//  NDSelectableTableViewController.mm
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/Views/NDSelectableTableViewController.h"

#import "NDMVVM/Abstracts/NDItemViewModel.h"
#import "NDMVVM/Abstracts/NDListViewModel.h"
#import "NDMVVM/Abstracts/NDSelectableViewModel.h"

@implementation NDSelectableTableViewController

#pragma mark - Table view data source

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.row];
  if ([cellViewModel.class conformsToProtocol:@protocol(
                                                  NDSelectableViewModel)]) {
    [cellViewModel select];
  }
}

// MARK:- Privates

namespace {
inline id<NDListViewModel> ViewModel(id<NDView> self) {
  return self.viewModel;
}
}

@end
