//
//  NDMutableListViewModelHelperTests.mm
//  NDMVVMTests
//
//  Created by Nguyen Duc Hiep on 6/30/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <NDMVVM/ViewModels/Privates/NDMutableListViewModelHelper.h>

#import <map>
#import <string>

using namespace std;

string ToString(const NDMutableListViewModelHelper::Section& val) {
  return string("(") + to_string(val.location) + "," +
         (val.originalLocation == NDMutableListViewModelHelper::Section::
                                      kOriginalLocationInvalid
              ? "*"
              : to_string(val.originalLocation)) +
         ")";
}

NDMutableListViewModelHelper::Section ToSection(const string& str) {
  auto index = str.find(",");
  if (index == string::npos) {
    throw invalid_argument("Invalid Section's serialization: '" + str + "'.");
  }

  auto originalStr = str.substr(index + 1);
  try {
    return {
        stoi(str.substr(0, index)),
        originalStr == "*"
            ? NDMutableListViewModelHelper::Section::kOriginalLocationInvalid
            : stoi(originalStr)};
  } catch (...) {
    throw invalid_argument("Invalid Section's serialization: '" + str + "'.");
  }
}

string ToString(const NDMutableListViewModelHelper& helper) {
  string str;
  for (auto& i : helper._items) {
    str = str + ToString(i);
  }
  return str;
}

NDMutableListViewModelHelper ToNDMutableListViewModelHelper(const string& str) {
  NDMutableListViewModelHelper obj;
  if (str.size() < 2 || str[0] != '(' || str[str.size() - 1] != ')') {
    throw invalid_argument("Invalid Section's serialization: '" + str + "'.");
  }

  if (str.size() == 3) {
    return obj;
  }

  obj._batchUpdating = true;

  size_t i = 1;
  auto end = str.size() - 2;
  while (i < end) {
    auto index = str.find(")(", i);
    if (index == string::npos) {
      index = end + 1;
    }
    obj._items.push_back(ToSection(str.substr(i, index - i)));
    i = index + 2;
  }
  return obj;
}

@interface NDMutableListViewModelHelperTests : XCTestCase

@end

@implementation NDMutableListViewModelHelperTests

- (void)testCpp:(void(NS_NOESCAPE ^)())block {
  try {
    block();
  } catch (exception& e) {
    XCTFail(@"%s.", e.what());
  } catch (...) {
    XCTFail(@"Unknown C++ thrown.");
  }
}

- (void)testSerialize {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(5,*)(7,6)");
    XCTAssertEqual(helper.IsBatchUpdating(), true);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(5,*)(7,6)");
  }];
}

- (void)test_Delete_LeadOriginal {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Delete(0);
    XCTAssertEqual(ToString(helper), "(0,1)(1,*)(3,3)(6,*)(7,7)");
  }];
}

- (void)test_Delete_LeadNew {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,*)(2,1)(4,4)(5,*)(6,8)");
    helper.Delete(0);
    XCTAssertEqual(ToString(helper), "(0,*)(1,1)(3,4)(4,*)(5,8)");
  }];
}

- (void)test_Delete_Trail {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Delete(10);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(7,*)(8,7)(10,10)");
  }];
}

- (void)test_Delete_TrailLead {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Delete(8);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(7,*)(8,8)");
  }];
}

- (void)test_Delete_Middle1ElementSection {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Delete(7);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(7,7)");
  }];
}

- (void)test_Delete_Middle1ElementSectionMergeOriginals {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(8,*)(9,7)");
    helper.Delete(8);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)");
  }];
}

- (void)test_Delete_Middle1ElementSectionMergeNew {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(5,*)(7,6)");
    helper.Delete(4);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(6,6)");
  }];
}

- (void)test_Update_NewSection {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Update(7);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(7,*)(8,7)");
  }];
}

- (void)test_Update_NewSectionLeadElement {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Update(2);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(7,*)(8,7)");
  }];
}

- (void)test_Update_NewSectionTrailElement {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(7,*)(8,7)");
    helper.Update(3);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(4,3)(7,*)(8,7)");
  }];
}

- (void)test_Update_NewSectionMiddleElement {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(5,3)(8,*)(9,7)");
    helper.Update(3);
    XCTAssertEqual(ToString(helper), "(0,0)(2,*)(5,3)(8,*)(9,7)");
  }];
}

- (void)test_BeginUpdates {
  [self testCpp:^{
    NDMutableListViewModelHelper helper;
    XCTAssertEqual(ToString(helper), "");

    helper.BeginUpdates();
    XCTAssertEqual(ToString(helper), "(0,0)");
  }];
}

- (void)test_IsBatchUpdating {
  [self testCpp:^{
    NDMutableListViewModelHelper helper;
    XCTAssertEqual(helper.IsBatchUpdating(), false);

    helper.BeginUpdates();
    XCTAssertEqual(helper.IsBatchUpdating(), true);

    NSMutableArray *deleteds, *updateds, *inserteds;
    helper.EndUpdates(&deleteds, &updateds, &inserteds);
    XCTAssertEqual(helper.IsBatchUpdating(), false);
  }];
}

- (void)test_EndUpdates {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,0)(2,*)(4,3)(5,*)(7,6)");
    XCTAssertEqual(helper.IsBatchUpdating(), true);

    NSMutableArray *deleteds, *updateds, *inserteds;
    helper.EndUpdates(&deleteds, &updateds, &inserteds);

    XCTAssertEqualObjects(deleteds, @[]);
    XCTAssertEqualObjects(updateds, (@[ @(2), @(4), @(5) ]));
    XCTAssertEqualObjects(inserteds, (@[ @(3) ]));
  }];
}

- (void)test_EndUpdates_DeleteHead {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,1)(8,*)(10,9)");
    XCTAssertEqual(helper.IsBatchUpdating(), true);

    NSMutableArray *deleteds, *updateds, *inserteds;
    helper.EndUpdates(&deleteds, &updateds, &inserteds);

    XCTAssertEqualObjects(deleteds, (@[ @(0) ]));
    XCTAssertEqualObjects(updateds, (@[]));
    XCTAssertEqualObjects(inserteds, (@[ @(8), @(9) ]));
  }];
}

- (void)test_EndUpdates_ModifyHead {
  [self testCpp:^{
    auto helper = ToNDMutableListViewModelHelper("(0,*)(3,2)(10,10)");
    XCTAssertEqual(helper.IsBatchUpdating(), true);

    NSMutableArray *deleteds, *updateds, *inserteds;
    helper.EndUpdates(&deleteds, &updateds, &inserteds);

    XCTAssertEqualObjects(deleteds, (@[ @(9) ]));
    XCTAssertEqualObjects(updateds, (@[ @(0), @(1) ]));
    XCTAssertEqualObjects(inserteds, (@[ @(2) ]));
  }];
}

- (void)test_Insert_FromEgg {
  auto helper = ToNDMutableListViewModelHelper("(0,0)");
  for (auto i = 0; i < 10; i++) {
    helper.Insert(i);
  }
  XCTAssertEqual(ToString(helper), "(0,*)(10,0)");
  //
  //  NSMutableArray* deleteds, *updateds, *inserteds;
  //  helper.EndUpdates(&deleteds, &updateds, &inserteds);
  //
  //  XCTAssertEqualObjects(deleteds, @[]);
  //  XCTAssertEqualObjects(updateds, (@[@(2), @(4), @(5)]));
  //  XCTAssertEqualObjects(inserteds, (@[@(3)]));
}

//- (void)test_Insert_big {
//  auto helper = ToNDMutableListViewModelHelper("I1I2D3D4U5U6D7I8");
//  helper.Insert(10);
//  XCTAssertEqual(ToString(helper), "I1I2D3D4U5U6D7I8I10");
//}
//
//- (void)test_Insert_Small {
//  auto helper = ToNDMutableListViewModelHelper("I1I2D3D4U5U6D7I8");
//  helper.Insert(0);
//  XCTAssertEqual(ToString(helper), "I0I2I3D4D5U6U7D8I9");
//}
//
//- (void)test_Insert_Same_Inserted {
//  auto helper = ToNDMutableListViewModelHelper("I1I2D3D4U5U6D7I8");
//  helper.Insert(2);
//  XCTAssertEqual(ToString(helper), "I1I2I3D4D5U6U7D8I9");
//}
//
//- (void)test_Insert_Same_Deleted {
//  auto helper = ToNDMutableListViewModelHelper("I1I2D3D4U5U6D7I8");
//  helper.Insert(3);
//  XCTAssertEqual(ToString(helper), "I1I2U3D4U5U6D7I8");
//}
//
//- (void)test_Insert_Same_Updated {
//  auto helper = ToNDMutableListViewModelHelper("I1I2D3D4U5U6D7I8");
//  helper.Insert(5);
//  XCTAssertEqual(ToString(helper), "I1I2D3D4I5U6U7D8I9");
//}

//- (void)testHelper {
//  NDMutableListViewModelHelper helper;
//  helper.BeginUpdates();
//  helper.Insert(1);
//  XCTAssertEqual(ToString(helper), "I1");
//
//  helper.Update(3);
//  XCTAssertEqual(ToString(helper), "I1U3");
//
//  helper.Insert(2);
//  XCTAssertEqual(ToString(helper), "I1I2U4");
//
//  helper.Insert(1);
//  XCTAssertEqual(ToString(helper), "I1I2I3U5");
//
//  helper.Insert(2);
//  XCTAssertEqual(ToString(helper), "I1I2I3I4U6");
//
//  helper.Update(2);
//  XCTAssertEqual(ToString(helper), "I1I2I3I4U6");
//
//  helper.Update(0);
//  XCTAssertEqual(ToString(helper), "U0I1I2I3I4U6");
//
//  helper.Update(0);
//  XCTAssertEqual(ToString(helper), "U0I1I2I3I4U6");
//
//  helper.Update(6);
//  XCTAssertEqual(ToString(helper), "U0I1I2I3I4U6");
//
//
//
//  NSMutableArray* deleteds, *updateds, *inserteds;
//  helper.EndUpdates(&deleteds, &updateds, &inserteds);
//
//  //  XCTAssertEqualObjects(@[], deleteds);
//  //  XCTAssertEqualObjects(@[@(2)], updateds);
//  //  XCTAssertEqualObjects((@[@(1), @(2), @(3)]), inserteds);
//}

@end
