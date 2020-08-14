//
//  NDRefeshableViewModel.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDRefeshableViewModel.h>

#import <NDMVVM/Abstracts/NDRefeshableView.h>

#import "../Privates/NDViewModelDefaultImpl.h"

View_Default_Impl(NDRefeshableView);

void NDRefeshableViewModelMimicRefresh(id<NDRefeshableViewModel> self) {
  [View(self) beginRefreshing];
  [self.refresh on];
}
