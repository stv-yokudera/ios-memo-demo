//
//  SQLiteHelper.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "Paths.h"
#import "SQLiteHelper.h"

@implementation SQLiteHelper

static SQLiteHelper *sharedInstance = nil;

#pragma mark - Factory

+ (SQLiteHelper *)sharedManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SQLiteHelper alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Initializer

- (instancetype)init {

    self = [super init];
    if (self) {
        DLOG(@"dbPath: %@", [Paths dbPath]);
        self.db = [[FMDatabase alloc] initWithPath:[Paths dbPath]];

#if DEBUG
        // デバッグ時のみSQLiteの実行をトレースする
        self.db.traceExecution = YES;
#endif
        
        [self createMemoTable];
    }
    return self;
}

#pragma mark - Helper

- (BOOL)dbOpen {
    return [self.db open];
}

- (BOOL)dbClose {
    return [self.db close];
}

#pragma mark - CREATE TABLE

/**
 MEMOテーブルが存在しなければ作成する

 @return YES: 成功, NO: 失敗
 */
- (BOOL)createMemoTable {

    NSString *sql = @"CREATE TABLE IF NOT EXISTS MEMO (memoId INTEGER PRIMARY KEY AUTOINCREMENT, updateDate DATE, text TEXT)";

    BOOL result = NO;

    [self dbOpen];
    result = [self.db executeUpdate:sql];
    [self dbClose];
    return result;
}
@end
