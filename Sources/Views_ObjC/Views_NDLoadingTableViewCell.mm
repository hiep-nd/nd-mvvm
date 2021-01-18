//
//  Views_NDLoadingTableViewCell.m
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/01/2021.
//

#import <NDMVVM/Views_NDLoadingTableViewCell.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>

using namespace nd::autolayout;

@implementation NDLoadingTableViewCell

@synthesize activityIndicatorView = _activityIndicatorView;

- (void)manualInit {
  [super manualInit];

  self.backgroundColor = UIColor.clearColor;

  _activityIndicatorView = [[UIActivityIndicatorView alloc]
      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  [self.contentView nd_wrapItem:_activityIndicatorView
              visualConstraints:@[
                @"V:[safeArea_center][item_center]",
                @"V:[safeArea_top]-(>=16@999)-[item]",
                @"H:[safeArea_center][item_center]"
              ]];
}

@end
