//
//  NDCollectionViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDCollectionViewController.h>

#import <NDMVVM/Abstracts/NDItemViewModel.h>
#import <NDMVVM/Abstracts/NDListViewModel.h>
#import <NDMVVM/Views/NDCollectionViewCell.h>

#import <NDLog/NDLog.h>

#import "../Privates/NDUtils.h"

using namespace nd;

@implementation NDCollectionViewController

// MARK: - NDManualCollectionViewController

- (NSInteger)numberOfSectionsInCollectionView:
    (UICollectionView*)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return ViewModel(self).numberOfItems;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                 cellForItemAtIndexPath:(NSIndexPath*)indexPath {
  auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.item];
  NDCollectionViewCell* cell = [collectionView
      dequeueReusableCellWithReuseIdentifier:cellViewModel.identifier
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
  [self.collectionView reloadData];
}

// MARK: - Privates

ViewModel_Default_Impl(NDListViewModel);

@end
