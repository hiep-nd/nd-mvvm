//
//  NDItemViewModel.mm
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import "NDMVVM/ViewModels/NDItemViewModel.h"

@interface NDItemViewModel ()

@property(nonatomic, strong) NSString *identifier;

@end

@implementation NDItemViewModel

- (instancetype)initWithIdentifier:(NSString *)identifier {
  self = [super init];
  if (self) {
    self.identifier = identifier ?: NSStringFromClass(self.class);
  }
  return self;
}

@end
