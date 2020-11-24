//
//  Abstracts_Privates_NDViewModelDefaultImpl.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 7/9/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/Abstracts_NDView.h>
#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

namespace nd {
namespace mvvm {
template <typename RType>
inline RType RView(id<NDViewModel> self) {
  return (RType)self.view;
}
}  // namespace mvvm
}  // namespace nd

#define NDViewModel_RView_Default_Impl(RType)    \
  namespace {                                    \
  inline id<RType> RView(id<NDViewModel> self) { \
    return nd::mvvm::RView<id<RType>>(self);     \
  }                                              \
  }

NS_ASSUME_NONNULL_END
