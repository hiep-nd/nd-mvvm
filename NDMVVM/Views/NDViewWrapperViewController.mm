//
//  NDViewWrapperViewController.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 3/5/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/Views/NDViewWrapperViewController.h"

@interface NDViewWrapperViewController ()

@end

@implementation NDViewWrapperViewController

// MARK:- NDViewController

- (void)loadView {
  [super loadView];

  self.view = self.realView;
}

@end
