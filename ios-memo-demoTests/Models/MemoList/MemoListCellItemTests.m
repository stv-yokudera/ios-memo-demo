//
//  MemoListCellItemTests.m
//  ios-memo-demoTests
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MemoListCellItem.h"

#import "NSDate+ToString.h"
#import "NSString+ToDate.h"

@interface MemoListCellItemTests : XCTestCase

@end

@implementation MemoListCellItemTests

/// テキストに空行を含まない場合
- (void)testInit {

    Memo *dummyMemo = [self dummyMemo:@"1行目\n2行目"];
    MemoListCellItem *cellItem = [[MemoListCellItem alloc] initWithMemo:dummyMemo];

    XCTAssertEqual(cellItem.memoId, 10);
    XCTAssertEqualObjects(cellItem.updateDate, [@"2017/12/16 12:34:56" toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"]);
    XCTAssertEqualObjects(cellItem.title, @"1行目");
    XCTAssertEqualObjects(cellItem.text, @"2行目");
}

/// 1行目しかない場合
- (void)testOnlyFirstLine {

    Memo *dummyMemo = [self dummyMemo:@"1行目"];
    MemoListCellItem *cellItem = [[MemoListCellItem alloc] initWithMemo:dummyMemo];

    XCTAssertEqual(cellItem.memoId, 10);
    XCTAssertEqualObjects(cellItem.updateDate, [@"2017/12/16 12:34:56" toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"]);
    XCTAssertEqualObjects(cellItem.title, @"1行目");
    XCTAssertEqualObjects(cellItem.text, @"");
}

/// 1行目が空の場合
- (void)testFirstLineIsEmpty {

    Memo *dummyMemo = [self dummyMemo:@"\n2行目\n3行目"];
    MemoListCellItem *cellItem = [[MemoListCellItem alloc] initWithMemo:dummyMemo];

    XCTAssertEqual(cellItem.memoId, 10);
    XCTAssertEqualObjects(cellItem.updateDate, [@"2017/12/16 12:34:56" toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"]);
    XCTAssertEqualObjects(cellItem.title, @"2行目");
    XCTAssertEqualObjects(cellItem.text, @"3行目");
}

/// 2行目が空の場合
- (void)testSecondLineIsEmpty {

    Memo *dummyMemo = [self dummyMemo:@"1行目\n\n3行目"];
    MemoListCellItem *cellItem = [[MemoListCellItem alloc] initWithMemo:dummyMemo];

    XCTAssertEqual(cellItem.memoId, 10);
    XCTAssertEqualObjects(cellItem.updateDate, [@"2017/12/16 12:34:56" toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"]);
    XCTAssertEqualObjects(cellItem.title, @"1行目");
    XCTAssertEqualObjects(cellItem.text, @"3行目");
}

/// 1行目と3行目が空の場合
- (void)testFirstAndThirdLinesAreEmpty {

    Memo *dummyMemo = [self dummyMemo:@"\n2行目\n\n4行目"];
    MemoListCellItem *cellItem = [[MemoListCellItem alloc] initWithMemo:dummyMemo];

    XCTAssertEqual(cellItem.memoId, 10);
    XCTAssertEqualObjects(cellItem.updateDate, [@"2017/12/16 12:34:56" toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"]);
    XCTAssertEqualObjects(cellItem.title, @"2行目");
    XCTAssertEqualObjects(cellItem.text, @"4行目");
}

#pragma mark - Private

- (Memo *)dummyMemo:(NSString *)text {

    Memo *memo = [[Memo alloc] init];
    memo.memoId = 10;
    memo.updateDate = @"2017/12/16 12:34:56";
    memo.text = text;

    return memo;
}

@end
