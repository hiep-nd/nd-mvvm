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

#import "../Privates/NDViewDefaultImpl.h"

using namespace nd;

@implementation NDCollectionViewController

// MARK: - NDManualCollectionViewController
- (void)manualInit {
  [super manualInit];

  self.numberOfItemsInSectionHandler =
      ^NSInteger(NDCollectionViewController* self, NSInteger) {
        return ViewModel(self).numberOfItems;
      };

  self.cellForItemAtIndexPathHandler = ^UICollectionViewCell*(
      NDCollectionViewController* self, NSIndexPath* indexPath) {
    auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.item];
    NDCollectionViewCell* cell = [self.collectionView
        dequeueReusableCellWithReuseIdentifier:cellViewModel.identifier
                                  forIndexPath:indexPath];
    NDRoute(cellViewModel, cell);
    return cell;
  };
}

// MARK: - NDListView
@synthesize viewModel = _viewModel;

- (BOOL)validateViewModel:(__kindof id<NDViewModel>)viewModel {
  return [viewModel conformsToProtocol:@protocol(NDListViewModel)];
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [self.collectionView reloadData];
}

// MARK: - Privates

ViewModel_Default_Impl(NDListViewModel);

@end
