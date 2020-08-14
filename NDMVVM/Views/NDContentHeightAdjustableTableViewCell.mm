//
//  NDContentHeightAdjustableTableViewCell.mm
//  CuRazy
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 CuRazy. All rights reserved.
//

#import <NDMVVM/Views/NDContentHeightAdjustableTableViewCell.h>

#import "../Privates/NDContentHeightAdjustableViewDefaultImpl.h"

@implementation NDContentHeightAdjustableTableViewCell

- (void)updateHeight {
  [self.tableView beginUpdates];
  [self.tableView endUpdates];
}

NDContentHeightAdjustableView_validateViewModel_Inheritance_Default_Impl;

@end
