//
//  MemoListCellTests.m
//  ios-memo-demoTests
//
//  Created by OkuderaYuki on 2017/12/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MemoListCell.h"
#import "MemoListViewController.h"
#import "UIViewController+Storyboard.h"
#import "NSDate+ToString.h"
#import "NSString+ToDate.h"

@interface MemoListViewController (MemoListCellTestsPrivate)
@property (nonatomic) IBOutlet UITableView *tableView;
@end

@interface MemoListCell (MemoListCellTestsPrivate)
@property (nonatomic) IBOutlet UILabel *memoTitleLabel;
@property (nonatomic) IBOutlet UILabel *memoTextLabel;
@property (nonatomic) IBOutlet UILabel *memoDateLabel;
@end

@interface MemoListCellTests : XCTestCase
@property (nonatomic) IBOutlet UITableView *fakeTableView;
@property (nonatomic) MemoListViewController *memoListVC;
@property (nonatomic) MemoListCell *cell;
@property (nonatomic) UIView *view;
@end

@implementation MemoListCellTests

- (void)setUp {
    [super setUp];
    UINavigationController *navigationController = [MemoListViewController initialViewControllerWithStoryboardName:@"MemoListViewController"];
    self.memoListVC = (MemoListViewController *)navigationController.topViewController;
    [self.memoListVC performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];

    [self setUpTableView];
}

- (void)setUpTableView {
    self.view = self.memoListVC.view;
    self.fakeTableView = self.memoListVC.tableView;

    UINib *nib = [UINib nibWithNibName:[MemoListCell nibName] bundle:nil];
    [self.fakeTableView registerNib:nib forCellReuseIdentifier:[MemoListCell identifier]];
    self.cell = (MemoListCell *)[self.fakeTableView dequeueReusableCellWithIdentifier:[MemoListCell identifier]];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testViewLoads {
    XCTAssertNotNil(self.memoListVC.view);
    XCTAssertNotNil(self.memoListVC.tableView);
}

/// CellのIdentifierを確認するテスト
- (void)testIdentifier {
    XCTAssertEqualObjects([MemoListCell identifier], @"MemoListCell");
}

/// CellのNibNameを確認するテスト
- (void)testNibName {
    XCTAssertEqualObjects([MemoListCell nibName], @"MemoListCell");
}

/// 日付を確認するテスト (今日)
- (void)testDateLabelForToday {

    // 今日
    NSString *today = @"2017/12/25 01:23:45";
    MemoListCellItem *item = [self dummyItemForDateLabelTest:today];
    [self.cell setItem:item];

    XCTAssertEqualObjects(self.cell.memoDateLabel.text, @"01:23");
}

/// 日付を確認するテスト (今年)
- (void)testDateLabelForThisYear {

    // 今年 (今日以外)
    NSString *sameYear = @"2017/01/02 01:23:45";
    MemoListCellItem *item = [self dummyItemForDateLabelTest:sameYear];
    [self.cell setItem:item];

    XCTAssertEqualObjects(self.cell.memoDateLabel.text, @"01/02");
}

/// 日付を確認するテスト (今年以外)
- (void)testDateLabelForOtherYears {

    // 今年以外
    NSString *someOtherYear = @"2010/01/02 01:23:45";
    MemoListCellItem *item = [self dummyItemForDateLabelTest:someOtherYear];
    [self.cell setItem:item];

    XCTAssertEqualObjects(self.cell.memoDateLabel.text, @"2010/01/02");
}

/// タイトルを確認するテスト
- (void)testTitleLabel {

    MemoListCellItem *item = [self dummyItemForTitleLabelAndTextLabelTest:@"タイトル\n本文"];
    [self.cell setItem:item];

    XCTAssertEqualObjects(self.cell.memoTitleLabel.text, @"タイトル");
}

/// 本文を確認するテスト
- (void)testTextLabel {

    MemoListCellItem *item = [self dummyItemForTitleLabelAndTextLabelTest:@"タイトル\n本文"];
    [self.cell setItem:item];

    XCTAssertEqualObjects(self.cell.memoTextLabel.text, @"本文");
}

#pragma mark - Private

- (MemoListCellItem *)dummyItemForDateLabelTest:(NSString *)dateString {
    return [self dummyItemForTestWithDate:dateString text:@"タイトル\n本文"];
}

- (MemoListCellItem *)dummyItemForTitleLabelAndTextLabelTest:(NSString *)text {
    return [self dummyItemForTestWithDate:[[NSDate date] toStringWithFormat:@"yyyy/MM/dd HH:mm"]
                                     text:text];
}

- (MemoListCellItem *)dummyItemForTestWithDate:(NSString *)dateString text:(NSString *)text {
    Memo *testMemo = [[Memo alloc] init];
    testMemo.memoId = 0;
    testMemo.updateDate = dateString;
    testMemo.text = text;

    return [[MemoListCellItem alloc] initWithMemo:testMemo];
}

@end
