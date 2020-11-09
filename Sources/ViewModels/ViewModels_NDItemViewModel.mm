//
//  ViewModels_NDItemViewModel.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/ViewModels_NDItemViewModel.h>

@interface NDItemViewModel ()

@property(nonatomic, strong) NSString* identifier;

@end

@implementation NDItemViewModel

- (instancetype)initWithIdentifier:(NSString*)identifier {
  self = [super init];
  if (self) {
    self.identifier = identifier ?: NSStringFromClass(self.class);
  }
  return self;
}

@end
