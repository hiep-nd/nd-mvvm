//
//  ViewModels_NDRefreshableViewModel.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDRefreshableViewModel.h>

#import <NDMVVM/Abstracts_NDRefreshableView.h>

#import <NDMVVM/Privates_NDViewModelDefaultImpl.h>

NDViewModel_RView_Default_Impl(NDRefreshableView);

void NDRefreshableViewModelMimicRefresh(id<NDRefreshableViewModel> self) {
  [RView(self) beginRefreshing];
  [self.refresh on];
}
