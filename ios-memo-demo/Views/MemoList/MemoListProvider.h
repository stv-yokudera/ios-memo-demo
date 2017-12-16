//
//  MemoListProvider.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
@import UIKit;
#import "MemoListCellItem.h"

@protocol DeleteMemoDelegate <NSObject>
- (void)didFinishDeleteMemo;
@end

@interface MemoListProvider : NSObject <UITableViewDataSource>
@property (nonatomic) NSArray <MemoListCellItem *> *items;
@property (weak, nonatomic) id <DeleteMemoDelegate> delegate;
@end
