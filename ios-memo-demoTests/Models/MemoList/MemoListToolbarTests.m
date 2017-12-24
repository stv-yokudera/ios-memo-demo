//
//  MemoListToolbarTests.m
//  ios-memo-demoTests
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MemoListToolbar.h"

@interface MemoListToolbarTests : XCTestCase

@end

@implementation MemoListToolbarTests

/// ツールバー右のボタンのタイトルをテスト
- (void)testRightToolbarButtonTitle {

    // メモ0件の場合
    XCTAssertEqualObjects([MemoListToolbar rightButtonTitleWithMemoCount:0],
                          @"メモなし");

    // メモ1件の場合
    XCTAssertEqualObjects([MemoListToolbar rightButtonTitleWithMemoCount:1],
                          @"1件のメモ");
}

/// ツールバー左のボタンのタイトルをテスト
- (void)testLeftToolbarButtonTitle {

    // 通常モード
    XCTAssertEqualObjects([MemoListToolbar leftButtonTitleWhenIsEditing:NO],
                          @"メモ追加");
    // 編集モード
    XCTAssertEqualObjects([MemoListToolbar leftButtonTitleWhenIsEditing:YES],
                          @"すべて削除");
}

@end
