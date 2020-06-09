//
//  NDViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/4/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDViewController.h>

#import "../Privates/NDUtils.h"

using namespace nd;

@implementation NDViewController

// MARK: - NDManualViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  if (self.loadHandler) {
    self.loadHandler(self);
    self.loadHandler = nil;
  }
}

// MARK: - NDView
NDView_Default_Impl;

@end
