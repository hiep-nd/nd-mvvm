//
//  NDTableViewController.mm
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/Views/NDTableViewController.h"

#import "NDMVVM/Abstracts/NDItemViewModel.h"
#import "NDMVVM/Abstracts/NDListViewModel.h"
#import "NDMVVM/Views/NDTableViewCell.h"
#import "NDMVVM/Privates/NDUtils.h"

#import <NDLog/NDLog.h>

using namespace nd;

@implementation NDTableViewController

- (void)registerClass:(Class)cls identifier:(NSString*)identifier {
  [self.tableView registerClass:cls forCellReuseIdentifier:identifier];
}

- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier {
  [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil]
       forCellReuseIdentifier:identifier];
}

// MARK:- NDManualTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  if (self.loadHandler) {
    self.loadHandler(self);
    self.loadHandler = nil;
  }
}

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

// MARK:- NDListView
@synthesize viewModel = _viewModel;

NDView_ViewModel_Setter_Default_Impl;

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [viewModel conformsToProtocol:@protocol(NDListViewModel)];
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [self.tableView reloadData];
}

// MARK:- Privates

namespace {
inline id<NDListViewModel> ViewModel(id<NDView> self) {
  return self.viewModel;
}
}

@end
