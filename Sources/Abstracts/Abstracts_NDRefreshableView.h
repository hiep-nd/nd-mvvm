//
//  Abstracts_NDRefreshableView.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/10/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDView.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDRefreshableViewProtocol)
@protocol NDRefreshableView <NDView>

- (void)beginRefreshing;
- (void)endRefreshing;

@end

NS_ASSUME_NONNULL_END
