//
//  MemoDao.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "Memo.h"

@interface MemoDao : NSObject
+ (BOOL)insert:(Memo *)memoObject;
+ (BOOL)update:(Memo *)memoObject;
+ (NSArray <Memo *> *)selectAll;
+ (Memo *)selectByUpdateDate:(NSString *)dateString;
+ (BOOL)deleteAll;
+ (BOOL)deleteId:(NSInteger)memoId;

@end
