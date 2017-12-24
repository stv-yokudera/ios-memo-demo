//
//  MemoListToolbar.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface MemoListToolbar : NSObject
+ (NSString *)rightButtonTitleWithMemoCount:(NSInteger)count;
+ (NSString *)leftButtonTitleWhenIsEditing:(BOOL)isEditing;
@end
