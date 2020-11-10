//
//  ViewModels_NDViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDViewModel.h>

#import <NDMVVM/Abstracts_NDView.h>

#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

using namespace nd::objc;

@implementation NDViewModel

@synthesize view = _view;

- (BOOL)validateView:(__kindof id<NDView>)view {
  return YES;
}

- (void)didSetViewFromOldView:(__kindof id<NDView>)oldView {
}

@end
