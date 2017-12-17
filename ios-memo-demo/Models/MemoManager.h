//
//  MemoManager.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoDao.h"
#import "MemoListCellItem.h"

@interface MemoManager : NSObject
+ (void)save:(Memo *)memo;
+ (NSMutableArray <MemoListCellItem *> *)allItems;
@end
