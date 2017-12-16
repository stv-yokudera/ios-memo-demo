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
@end

NSString *const storyboardName = @"MemoViewController";

@implementation MemoViewController

#pragma mark - Factory

+ (MemoViewController *)make:(NSDate *)updateDate {
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

    Memo *memo = [[Memo alloc] init];
    memo.text = self.textView.text;
    memo.updateDate = self.updateDate;
    [MemoManager save:memo];

    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - Private

- (void)setup {
    if (self.updateDate) {
        self.textView.text = [MemoDao selectByUpdateDate:self.updateDate].text;
    }
    [self.textView becomeFirstResponder];
}

@end
