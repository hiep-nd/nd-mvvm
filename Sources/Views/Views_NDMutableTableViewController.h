//
//  Views_NDMutableTableViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/26/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views_NDTableViewController.h>

#import <NDMVVM/Abstracts_NDMutableListView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDMutableTableViewController
    : NDTableViewController <NDMutableListView>
@end

NS_ASSUME_NONNULL_END
