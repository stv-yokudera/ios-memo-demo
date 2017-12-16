//
//  SQLiteHelper.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
@import FMDB;

@interface SQLiteHelper : NSObject
@property (nonatomic) FMDatabase *db;

#pragma mark - Factory
+ (SQLiteHelper *)sharedManager;

#pragma mark - Helper
- (BOOL)dbOpen;
- (BOOL)dbClose;
- (BOOL)createMemoTable;
@end
