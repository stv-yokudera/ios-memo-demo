//
//  MemoListCell.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoListCell.h"

@interface MemoListCell ()
@property (weak, nonatomic) IBOutlet UILabel *memoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoDateLabel;
@end

NSString *const identifier = @"MemoListCell";
NSString *const nibName = @"MemoListCell";

@implementation MemoListCell

+ (NSString *)identifier {
    return identifier;
}

+ (NSString *)nibName {
    return nibName;
}

- (void)setItem:(MemoListCellItem *)item {
    self.memoTitleLabel.text = item.title;
    self.memoTextLabel.text = item.text;
    self.memoDateLabel.text = [item.updateDate dateStyle];
}

@end
