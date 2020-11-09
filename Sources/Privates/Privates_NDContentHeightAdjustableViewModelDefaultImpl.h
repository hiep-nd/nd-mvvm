//
//  Privates_NDContentHeightAdjustableViewModelDefaultImpl.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDContentHeightAdjustableView.h>
#import <NDMVVM/Abstracts_NDContentHeightAdjustableViewModel.h>

#import <NDMVVM/Privates_NDViewModelDefaultImpl.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDContentHeightAdjustableViewModelContentReHeightEvent
    : NDEvent < id <NDContentHeightAdjustableViewModel>
> @end

#define NDContentHeightAdjustableView_validateView_Root_Default_Impl           \
  -(BOOL)validateView : (__kindof id<NDView>)view {                            \
    return [view conformsToProtocol:@protocol(NDContentHeightAdjustableView)]; \
  }

#define NDContentHeightAdjustableView_validateView_Inheritance_Default_Impl    \
  -(BOOL)validateView : (__kindof id<NDView>)view {                            \
    return [super validateView:view] &&                                        \
           [view conformsToProtocol:@protocol(NDContentHeightAdjustableView)]; \
  }

#define NDContentHeightAdjustableViewModel_contentReHeight_Default_Impl \
  @synthesize contentReHeight = _contentReHeight;

#define NDContentHeightAdjustableView_Root_Default_Impl           \
  NDContentHeightAdjustableViewModel_contentReHeight_Default_Impl \
      NDContentHeightAdjustableView_validateView_Root_Default_Impl

#define NDContentHeightAdjustableView_Inheritance_Default_Impl    \
  NDContentHeightAdjustableViewModel_contentReHeight_Default_Impl \
      NDContentHeightAdjustableView_validateView_Inheritance_Default_Impl

NS_ASSUME_NONNULL_END
