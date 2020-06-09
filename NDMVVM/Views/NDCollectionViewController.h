//
//  NDCollectionViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/NDManualObjects.h>

#import <NDMVVM/Abstracts/NDMutableListView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDCollectionViewController
    : NDManualCollectionViewController <NDListView>
@end

NS_ASSUME_NONNULL_END
