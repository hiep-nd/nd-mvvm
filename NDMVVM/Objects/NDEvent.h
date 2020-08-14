//
//  NDEvent.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/3/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDUtils/NDUtils.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDEvent<__covariant Owner : id <NSObject>> : NDPossession <Owner>

@property(nonatomic, copy) void (^_Nullable handler)(Owner owner);
- (void)on;

- (void)addHandler:(void (^)(Owner owner))handler;
- (void)updateHandler:(void (^_Nullable)(void (^_Nullable oldHandler)(Owner),
                                         Owner owner))handler;
+ (instancetype)eventWithOwner:(Owner)owner
                       handler:(void (^_Nullable)(Owner))handler;

@end

NS_ASSUME_NONNULL_END
