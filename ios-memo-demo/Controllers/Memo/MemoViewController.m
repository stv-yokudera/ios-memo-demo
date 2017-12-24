//
//  MemoViewController.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoViewController.h"
#import "MemoManager.h"

@interface MemoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) NSString *previousText;
@end

NSString *const storyboardName = @"MemoViewController";

@implementation MemoViewController

#pragma mark - Factory

+ (MemoViewController *)make:(NSString *)updateDate {
    MemoViewController *memoVC = (MemoViewController *)[MemoViewController initialViewControllerWithStoryboardName:storyboardName];
    memoVC.updateDate = updateDate;
    return memoVC;
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textView resignFirstResponder];
}

#pragma mark - IBAction

- (IBAction)didTapDoneButton:(id)sender {

    // メモが変更されていたら、保存処理をする
    if (![self.textView.text isEqualToString:self.previousText]) {

        Memo *memo = [[Memo alloc] init];
        memo.text = self.textView.text;
        NSString *updateDateString = self.updateDate;
        memo.updateDate = updateDateString;
        [MemoManager save:memo];
    }
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - Private

- (void)setup {
    // 更新日が渡されているのであればテキストを取得する
    if (self.updateDate) {
        NSString *updateDateString = self.updateDate;
        self.textView.text = [MemoDao selectByUpdateDate:updateDateString].text;
        self.previousText = self.textView.text;
    }
    [self.textView becomeFirstResponder];
}

@end
