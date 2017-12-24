//
//  MemoListCellItem.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoListCellItem.h"

@implementation MemoListCellItem

- (instancetype)initWithMemo:(Memo *)memo {

    self = [super init];
    if (self) {
        self.memoId = memo.memoId;
        self.updateDate = [memo.updateDate toDateWithFormat:@"yyyy/MM/dd HH:mm:ss"];

        NSMutableArray <NSString *> *lines = [[memo.text componentsSeparatedByString:@"\n"] mutableCopy];
        [lines removeObject:@""];
        self.title = (lines.count > 0) ? lines.firstObject : @"";
        self.text = (lines.count > 1) ? lines[1] : @"";
    }
    return self;
}

@end
