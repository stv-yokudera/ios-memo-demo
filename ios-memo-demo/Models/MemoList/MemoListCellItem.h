//
//  MemoListCellItem.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
#import "Memo.h"

@interface MemoListCellItem : NSObject
@property (nonatomic) NSInteger memoId;
@property (nonatomic) NSDate *updateDate;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *text;

- (instancetype)initWithMemo:(Memo *)memo;
@end
