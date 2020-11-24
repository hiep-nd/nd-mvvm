//
//  Views_NDTableViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/NDManualObjects.h>

#import <NDMVVM/Abstracts_NDListView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDTableViewController : NDManualTableViewController <NDListView>
@end

NS_ASSUME_NONNULL_END
