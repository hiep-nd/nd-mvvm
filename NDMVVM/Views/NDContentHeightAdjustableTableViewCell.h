//
//  NDContentHeightAdjustableTableViewCell.h
//  CuRazy
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 CuRazy. All rights reserved.
//

#import <NDMVVM/Views/NDTableViewCell.h>

#import <NDMVVM/Abstracts/NDContentHeightAdjustableView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDContentHeightAdjustableTableViewCell
    : NDTableViewCell <NDContentHeightAdjustableView>

@property(nonatomic, weak) UITableView* tableView;

@end

NS_ASSUME_NONNULL_END
