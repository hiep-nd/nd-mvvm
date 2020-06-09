//
//  NDMVVMTests.m
//  NDMVVMTests
//
//  Created by Nguyen Duc Hiep on 1/21/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <NDMVVM/NDMVVM.h>

@interface NDMVVMTests : XCTestCase

@end

@implementation NDMVVMTests

- (void)testRouteInvalid {
  auto view = [[NDTableViewController alloc] init];
  auto viewModel = [[NDViewModel alloc] init];
  @try {
    NDRoute(viewModel, view);
  } @catch (NSException* exception) {
    XCTAssertNotNil(exception);
  } @finally {
    XCTAssertNil(viewModel.view);
    XCTAssertNil(view.viewModel);
  }
}

@end
