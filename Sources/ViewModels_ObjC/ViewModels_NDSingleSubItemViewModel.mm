//
//  ViewModels_NDSingleSubItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/13/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDSingleSubItemViewModel.h>

@interface NDSingleSubItemViewModel ()

@property(nonatomic, strong) __kindof id<NDViewModel> subViewModel;

@end

@implementation NDSingleSubItemViewModel

- (instancetype)initWithIdentifier:(NSString*)identifier
                      subViewModel:(id<NDViewModel>)subViewModel {
  self = [super initWithIdentifier:identifier];
  if (self) {
    self.subViewModel = subViewModel;
  }
  return self;
}

@end
