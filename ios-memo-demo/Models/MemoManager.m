//
//  MemoManager.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoManager.h"

@implementation MemoManager

+ (void)save:(Memo *)memo {

    // 新規メモで且つテキストが空文字でなければINSERT
    if ([self isNew:memo]) {

        if (![self isEmpty:memo]) {
            memo.updateDate = [[NSDate date] toStringWithFormat:@"yyyy/MM/dd HH:mm:ss"];
            [MemoDao insert:memo];
        }
        return;
    }

    // UPDATEするmemoIdをセット
    memo.memoId = [MemoDao selectByUpdateDate:memo.updateDate].memoId;

    // テキストが空文字の場合はDELETE、空文字でなければUPDATE
    if ([self isEmpty:memo]) {
        [MemoDao deleteId:memo.memoId];
        return;
    }
    memo.updateDate = [[NSDate date] toStringWithFormat:@"yyyy/MM/dd HH:mm:ss"];
    [MemoDao update:memo];
}

+ (NSMutableArray <MemoListCellItem *> *)allItems {

    NSArray <Memo *> *allMemo = [MemoDao selectAll];
    NSMutableArray <MemoListCellItem *> *items = [@[] mutableCopy];
    for (Memo *memo in allMemo) {
        MemoListCellItem *item = [[MemoListCellItem alloc] initWithMemo:memo];
        [items addObject:item];
    }
    return items;
}

#pragma mark - Private
/// 新規メモ判定
+ (BOOL)isNew:(Memo *)memo {
    if (memo.updateDate) {
        return NO;
    }
    return YES;
}

/// テキスト空文字判定
+ (BOOL)isEmpty:(Memo *)memo {
    return (memo.text.length == 0);
}
@end
