//
//  NDSelectableMutableCollectionViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDSelectableMutableCollectionViewController.h>

#import <NDMVVM/Abstracts/NDItemViewModel.h>
#import <NDMVVM/Abstracts/NDListViewModel.h>
#import <NDMVVM/Abstracts/NDSelectableViewModel.h>

#import "../Privates/NDUtils.h"

@implementation NDSelectableMutableCollectionViewController

// MARK: - NDMutableCollectionViewController

- (void)collectionView:(UICollectionView*)collectionView
    didSelectItemAtIndexPath:(NSIndexPath*)indexPath {
  auto cellViewModel = [ViewModel(self) viewModelForItem:indexPath.row];
  if ([cellViewModel.class conformsToProtocol:@protocol(
                                                  NDSelectableViewModel)]) {
    [cellViewModel select];
  }
}

// MARK: - Privates

ViewModel_Default_Impl(NDListViewModel);

@end