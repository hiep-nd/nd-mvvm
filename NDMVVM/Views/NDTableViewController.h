//
//  NDTableViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Neodata Co., Ltd. All rights reserved.
//

#import <NDManualObject/NDManualObject.h>

#import <NDMVVM/Abstracts/NDListView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDTableViewController : NDManualTableViewController<NDListView>

@property(nonatomic, copy) void (^_Nullable loadHandler)(NDTableViewController*)
    ;

- (void)registerClass:(Class)cls identifier:(NSString*)identifier;
- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier;

@end

NS_ASSUME_NONNULL_END
