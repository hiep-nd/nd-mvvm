//
//  NDViewModelDefaultImpl.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts/NDView.h>
#import <NDMVVM/Abstracts/NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

namespace nd {
template <typename RType>
inline RType View(id<NDViewModel> self) {
  return (RType)self.view;
}
}  // namespace nd

#define View_Default_Impl(RType)                \
  namespace {                                   \
  inline id<RType> View(id<NDViewModel> self) { \
    return nd::View<id<RType>>(self);           \
  }                                             \
  }

NS_ASSUME_NONNULL_END
