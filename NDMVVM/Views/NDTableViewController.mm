//
//  NDTableViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDTableViewController.h>

#import <NDMVVM/Abstracts/NDItemViewModel.h>
#import <NDMVVM/Abstracts/NDListViewModel.h>
#import <NDMVVM/Views/NDTableViewCell.h>

#import <NDLog/NDLog.h>

#import "../Privates/NDUtils.h"

using namespace nd;

@implementation NDTableViewController

// MARK: - NDManualTableViewController

- (NSInteger)tableView:(UITableView*)tableView
    numberOfRowsInSection:(NSInteger)section {
  return ViewModel(self).numberOfItems;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.row];
  NDTableViewCell* cell =
      [tableView dequeueReusableCellWithIdentifier:cellViewModel.identifier
                                      forIndexPath:indexPath];
  NDRoute(cellViewModel, cell);
  return cell;
}

// MARK: - NDListView
@synthesize viewModel = _viewModel;

NDView_ViewModel_Setter_Default_Impl;

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [viewModel conformsToProtocol:@protocol(NDListViewModel)];
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [self.tableView reloadData];
}

// MARK: - Privates

ViewModel_Default_Impl(NDListViewModel);

@end
