//
//  Memo.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
@import FMDB;

@interface Memo : NSObject
@property (nonatomic) NSInteger memoId;
@property (nonatomic) NSString *updateDate;
@property (nonatomic) NSString *text;

- (instancetype)initWithFMResultSet:(FMResultSet *)results;
@end
