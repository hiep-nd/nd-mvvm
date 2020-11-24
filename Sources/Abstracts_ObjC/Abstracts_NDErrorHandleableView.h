//
//  Abstracts_NDErrorHandleableView.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 16/11/2020.
//

#import <NDMVVM/Abstracts_NDViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDErrorHandleableViewProtocol)
@protocol NDErrorHandleableView <NDView>

- (void)handleError:(NSError*)error completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
