//
//  MemoViewController.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import UIKit;

@interface MemoViewController : UIViewController
@property (nonatomic) NSString *updateDate;

/**
 MemoViewControllerのインスタンスを生成する

 @param updateDate 編集の場合はDBに登録されている更新日時、新規の場合はnil
 @return MemoViewControllerのインスタンス
 */
+ (MemoViewController *)make:(NSString *)updateDate;
@end
