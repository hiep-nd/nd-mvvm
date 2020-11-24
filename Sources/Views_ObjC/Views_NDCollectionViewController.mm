//
//  Views_NDCollectionViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDCollectionViewController.h>

#import <NDMVVM/Abstracts_NDItemViewModel.h>
#import <NDMVVM/Abstracts_NDListViewModel.h>
#import <NDMVVM/Views_NDCollectionViewCell.h>

#import <NDLog/NDLog.h>

#import <NDMVVM/Abstracts_Privates_NDViewDefaultImpl.h>

using namespace nd;

@implementation NDCollectionViewController

// MARK: - NDManualCollectionViewController
- (void)manualInit {
  [super manualInit];

  self.numberOfItemsInSectionHandler =
      ^NSInteger(NDCollectionViewController* self, NSInteger) {
        return RViewModel(self).numberOfItems;
      };

  self.cellForItemAtIndexPathHandler = ^UICollectionViewCell*(
      NDCollectionViewController* self, NSIndexPath* indexPath) {
    auto cellViewModel = [RViewModel(self) viewModelForItem:indexPath.item];
    NDCollectionViewCell* cell = [self.collectionView
        dequeueReusableCellWithReuseIdentifier:cellViewModel.identifier
                                  forIndexPath:indexPath];
    NDConnect(cellViewModel, cell);
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

NDView_RViewModel_Default_Impl(NDListViewModel);

@end
