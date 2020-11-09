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

- (void)testConnectInvalid {
  auto view = [[NDTableViewController alloc] init];
  auto viewModel = [[NDViewModel alloc] init];
  @try {
    NDConnect(viewModel, view);
  } @catch (NSException* exception) {
    XCTAssertNotNil(exception);
  } @finally {
    XCTAssertNil(viewModel.view);
    XCTAssertNil(view.viewModel);
  }
}

@end
