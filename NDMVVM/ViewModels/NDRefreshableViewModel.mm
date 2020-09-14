//
//  NDRefreshableViewModel.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDRefreshableViewModel.h>

#import <NDMVVM/Abstracts/NDRefreshableView.h>

#import "../Privates/NDViewModelDefaultImpl.h"

NDViewModel_RView_Default_Impl(NDRefreshableView);

void NDRefreshableViewModelMimicRefresh(id<NDRefreshableViewModel> self) {
  [RView(self) beginRefreshing];
  [self.refresh on];
}
