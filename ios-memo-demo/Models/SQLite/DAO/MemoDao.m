//
//  MemoDao.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoDao.h"
#import "SQLiteHelper.h"

@implementation MemoDao

#pragma mark - INSERT

/**
 レコードを新規登録する
 @param memoObject 登録するMemoObject
 @return 成功 or 失敗
 */
+ (BOOL)insert:(Memo *)memoObject {

    memoObject.updateDate = [NSDate date];

    NSString* sql = @"INSERT INTO MEMO(updateDate, text) VALUES(?, ?)";

    BOOL result = NO;

    [[SQLiteHelper sharedManager] dbOpen];
    result = [[SQLiteHelper sharedManager].db executeUpdate:sql
                                       withArgumentsInArray:@[memoObject.updateDate, memoObject.text]];
    [[SQLiteHelper sharedManager] dbClose];
    return result;
}

#pragma mark - UPDATE

/**
 レコードを更新する
 @param memoObject 更新するMemoObject
 @return 成功 or 失敗
 */
+ (BOOL)update:(Memo *)memoObject {

    NSString* sql = @"UPDATE MEMO SET updateDate = :UPDATEDATE, text = :TEXT WHERE memoId = :MEMOID";

    NSDictionary<NSString *, id> *params = @{@"UPDATEDATE": memoObject.updateDate,
                                             @"TEXT": memoObject.text,
                                             @"MEMOID": @(memoObject.memoId)};

    BOOL result = NO;

    [[SQLiteHelper sharedManager] dbOpen];
    result = [[SQLiteHelper sharedManager].db executeUpdate:sql
                                    withParameterDictionary:params];
    [[SQLiteHelper sharedManager] dbClose];
    return result;
}

#pragma mark - SELECT

/**
 更新日の降順で全レコードを取得する
 @return Memoの配列
 */
+ (NSArray <Memo *> *)selectAll {

    NSString *sql = @"SELECT * FROM MEMO ORDER BY updateDate DESC";

    NSMutableArray<Memo *>* resultArray = [@[] mutableCopy];

    [[SQLiteHelper sharedManager] dbOpen];

    FMResultSet *results = [[SQLiteHelper sharedManager].db executeQuery:sql];
    while ([results next]) {
        Memo *memoObject = [[Memo alloc] initWithFMResultSet:results];
        [resultArray addObject:memoObject];
    }

    [[SQLiteHelper sharedManager] dbClose];
    return resultArray;
}

/**
 更新日を指定して、1件レコードを取得する
 @param date 取得するレコードの更新日
 @return MemoObject
 */
+ (Memo *)selectByUpdateDate:(NSDate *)date {

    NSString *sql = @"SELECT * FROM MEMO WHERE updateDate = ?";

    [[SQLiteHelper sharedManager] dbOpen];

    FMResultSet *results = [[SQLiteHelper sharedManager].db executeQuery:sql withArgumentsInArray:@[date]];

    Memo *memoObject = nil;
    while ([results next]) {
        memoObject = [[Memo alloc] initWithFMResultSet:results];
    }
    [[SQLiteHelper sharedManager] dbClose];
    return memoObject;
}

#pragma mark - DELETE

/**
 全レコードを削除する
 @return 成功 or 失敗
 */
+ (BOOL)deleteAll {

    NSString *sql = @"DELETE FROM MEMO";

    BOOL result = NO;

    [[SQLiteHelper sharedManager] dbOpen];
    result = [[SQLiteHelper sharedManager].db executeUpdate:sql];
    [[SQLiteHelper sharedManager] dbClose];
    return result;
}

/**
 memoIdを指定して、1件レコードを削除する
 @param memoId 削除するレコードのmemoId
 @return 成功 or 失敗
 */
+ (BOOL)deleteId:(NSInteger)memoId {

    NSString *sql = @"DELETE FROM MEMO WHERE memoId = ?";

    BOOL result = NO;

    [[SQLiteHelper sharedManager] dbOpen];
    result = [[SQLiteHelper sharedManager].db executeUpdate:sql withArgumentsInArray:@[@(memoId)]];
    [[SQLiteHelper sharedManager] dbClose];
    return result;
}
@end
