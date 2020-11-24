//
//  NDMVVMTests.m
//  NDMVVMTests
//
//  Created by Nguyen Duc Hiep on 1/21/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <NDMVVM/NDMVVM.h>
#import <NDManualObjects/NDManualObjects.h>
#import <NDUtils/NDUtils.h>

using namespace nd::objc;

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

- (void)test_NDConnect_valid {
  auto view = [[NDView alloc] init];
  auto viewModel = [[NDViewModel alloc] init];

  NDConnect(viewModel, view);
  XCTAssertTrue(SameOrEquals(viewModel.view, view));
  XCTAssertTrue(SameOrEquals(viewModel, view.viewModel));
}

- (void)test_NDConnect_reconnectWithNil {
  auto view = [[NDView alloc] init];
  auto viewModel = [[NDViewModel alloc] init];

  NDConnect(viewModel, view);
  NDConnect(viewModel, nil);
  XCTAssertNil(viewModel.view);
  XCTAssertNil(view.viewModel);
}

- (void)test_NDConnect_reconnectWithNil2 {
  auto view = [[NDView alloc] init];
  auto viewModel = [[NDViewModel alloc] init];

  NDConnect(viewModel, view);
  NDConnect(nil, view);
  XCTAssertNil(viewModel.view);
  XCTAssertNil(view.viewModel);
}

- (void)test_NDConnect_nil {
  NDConnect(nil, nil);
}

- (void)test_NDConnect_nil2 {
  auto view = [[NDView alloc] init];
  NDConnect(nil, view);
}

- (void)test_NDConnect_nil3 {
  auto viewModel = [[NDViewModel alloc] init];
  NDConnect(viewModel, nil);
}

@end
