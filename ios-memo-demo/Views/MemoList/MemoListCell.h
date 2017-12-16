//
//  MemoListCell.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import UIKit;
#import "MemoListCellItem.h"

@interface MemoListCell : UITableViewCell
+ (NSString *)identifier;
+ (NSString *)nibName;
- (void)setItem:(MemoListCellItem *)item;
@end
