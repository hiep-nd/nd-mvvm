//
//  NDMutableListView.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 12/6/19.
//  Copyright © 2019 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDListView.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDMutableListViewProtocol)
@protocol NDMutableListView <NDListView>

- (void)reloadAll;

/// Batch update list view.
/// @param deletedItems The original items will be deleted.
/// @param updatedItems The original items will be updated.
/// @param insertedItems The new items will be inserted.
- (void)deleteItems:(NSArray<NSNumber*>* _Nullable)deletedItems
        updateItems:(NSArray<NSNumber*>* _Nullable)updatedItems
        insertItems:(NSArray<NSNumber*>* _Nullable)insertedItems;

@end

NS_ASSUME_NONNULL_END
