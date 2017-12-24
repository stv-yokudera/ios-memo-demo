//
//  MemoDaoTests.m
//  ios-memo-demoTests
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MemoDao.h"
#import "MemoManager.h"
#import "Paths.h"
#import "SQLiteHelper.h"

@interface MemoDaoTests : XCTestCase

@end

@implementation MemoDaoTests

- (void)setUp {
    [super setUp];
    [MemoDao deleteAll];
}

- (void)tearDown {
    [MemoDao deleteAll];
    [super tearDown];
}

- (void)testInsert {

    // DB登録数0件であることをテスト
    XCTAssertEqual([MemoManager allItems].count, 0);

    [MemoDao insert:[self dummyMemo]];
    // 1件登録されていることをテスト
    XCTAssertEqual([MemoManager allItems].count, 1);

    Memo *savedMemo = [MemoDao selectAll].firstObject;
    // 取得したメモのテキスト、更新日をテスト
    XCTAssertEqualObjects(savedMemo.text, @"タイトル\n本文");
    XCTAssertEqualObjects(savedMemo.updateDate, @"2017/12/23 12:34:56");
}

- (void)testUpdate {

    // DB登録数0件であることをテスト
    XCTAssertEqual([MemoManager allItems].count, 0);

    [MemoDao insert:[self dummyMemo]];
    // 1件登録されていることをテスト
    XCTAssertEqual([MemoManager allItems].count, 1);

    Memo *savedMemo = [MemoDao selectAll].firstObject;
    savedMemo.text = @"新しいタイトル\n\n新しい本文";
    savedMemo.updateDate = @"2017/12/24 12:34:56";
    [MemoDao update:savedMemo];
    // 登録件数が変わっていないことをテスト
    XCTAssertEqual([MemoManager allItems].count, 1);

    Memo *updatedMemo = [MemoDao selectAll].firstObject;
    // メモのテキスト、更新日が更新されていることをテスト
    XCTAssertEqualObjects(updatedMemo.text, @"新しいタイトル\n\n新しい本文");
    XCTAssertEqualObjects(updatedMemo.updateDate, @"2017/12/24 12:34:56");
}

#pragma mark - Private

- (Memo *)dummyMemo {

    Memo *memo = [[Memo alloc] init];
    memo.text = @"タイトル\n本文";
    memo.updateDate = @"2017/12/23 12:34:56";

    return memo;
}

- (Memo *)updatedDummyMemo {

    Memo *memo = [[Memo alloc] init];
    memo.text = @"新しいタイトル\n\n新しい本文";
    memo.updateDate = @"2017/12/24 12:34:56";

    return memo;
}

@end
