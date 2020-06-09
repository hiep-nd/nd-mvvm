//
//  NDMutableCollectionViewController.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 4/26/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Views/NDCollectionViewController.h>

#import <NDMVVM/Abstracts/NDMutableListView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDMutableCollectionViewController
    : NDCollectionViewController <NDMutableListView>
@end

NS_ASSUME_NONNULL_END
