//
//  Memo.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "Memo.h"

@implementation Memo

- (instancetype)initWithFMResultSet:(FMResultSet *)results {
    self = [super init];
    if (self) {
        self.memoId = [results intForColumn:@"memoId"];
        self.updateDate = [[results dateForColumn:@"updateDate"] nullToNil];
        self.text = [[results stringForColumn:@"text"] nullToNil];
    }
    return self;
}


@end
