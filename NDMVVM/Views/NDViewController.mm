//
//  NDViewController.mm
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/Views/NDViewController.h"

#import "NDMVVM/Privates/NDUtils.h"

using namespace nd;

@implementation NDViewController

// MARK:- NDManualViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  if (self.loadHandler) {
    self.loadHandler(self);
    self.loadHandler = nil;
  }
}

// MARK:- NDView
NDView_Default_Impl;

@end
