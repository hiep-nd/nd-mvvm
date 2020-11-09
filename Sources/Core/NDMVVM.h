//
//  NDMVVM.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 1/21/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for NDMVVM.
FOUNDATION_EXPORT double NDMVVMVersionNumber;

//! Project version string for NDMVVM.
FOUNDATION_EXPORT const unsigned char NDMVVMVersionString[];

#if !defined(__has_include)
#error \
    "NDMVVM.h won't import anything if your compiler doesn't support __has_include. Please import the headers individually."
#else

#if __has_include(<NDMVVM/Abstracts.h>)
#import <NDMVVM/Abstracts.h>
#endif

//#if __has_include(<NDMVVM/ViewModels.h>)
//#import <NDMVVM/ViewModels.h>
//#endif
//
//#if __has_include(<NDMVVM/Views.h>)
//#import <NDMVVM/Views.h>
//#endif

#endif
