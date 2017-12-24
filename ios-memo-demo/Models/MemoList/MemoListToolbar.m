//
//  MemoListToolbar.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoListToolbar.h"

@implementation MemoListToolbar
+ (NSString *)rightButtonTitleWithMemoCount:(NSInteger)count {
    return (count == 0) ? [@"NO_MEMOS" localized] : [NSString stringWithFormat:[@"MEMOS_COUNT" localized], count];
}

+ (NSString *)leftButtonTitleWhenIsEditing:(BOOL)isEditing {
    return isEditing ? [@"DELETE_ALL" localized] : [@"ADD_MEMO" localized];
}
@end
