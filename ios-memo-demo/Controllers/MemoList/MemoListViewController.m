//
//  MemoListViewController.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "MemoListCell.h"
#import "MemoListProvider.h"
#import "MemoListToolbar.h"
#import "MemoListViewController.h"
#import "MemoManager.h"
#import "MemoViewController.h"

@interface MemoListViewController () <UITableViewDelegate, DeleteMemoDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftToolbarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightToolbarButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, getter=isEditing) BOOL editing;
@property (nonatomic) MemoListProvider *provider;
@end

@implementation MemoListViewController

#pragma mark - View life cycle

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self reloadToolbar];
    [self reloadTableView];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {

    [super setEditing:editing animated:animated];
    self.editing = !self.editing;
    [self reloadToolbar];
    self.tableView.editing = !self.tableView.isEditing;
}

#pragma mark - Private

- (void)setup {

    self.navigationItem.title = [@"MEMO" localized];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setupTableView];
}

- (void)setupTableView {

    UINib *nib = [UINib nibWithNibName:[MemoListCell nibName] bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:[MemoListCell identifier]];

    self.provider = [[MemoListProvider alloc] init];
    self.provider.delegate = self;
    self.provider.items = [MemoManager allItems];

    self.tableView.delegate = self;
    self.tableView.dataSource = self.provider;
}

/**
 Toolbarを再読み込みする
 */
- (void)reloadToolbar {

    NSInteger memoCount = [MemoManager selectAll].count;
    self.rightToolbarButton.title = [MemoListToolbar rightToolbarButtonTitle:memoCount];
    self.leftToolbarButton.title = [MemoListToolbar leftToolbarButtonTitle:self.isEditing];
}

/**
 TableViewを再読み込みする
 */
- (void)reloadTableView {

    self.provider.items = [MemoManager allItems];
    [self.tableView reloadData];
}

/**
 アクションシートを表示する
 */
- (void)showActionSheet {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    __weak typeof(self) weakSelf = self;
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:[@"DELETE_ALL" localized]
                                                           style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [MemoManager deleteAll];
                                                             [weakSelf reloadTableView];
                                                             [weakSelf reloadToolbar];

                                                         }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:[@"CANCEL" localized]
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:deleteAction];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark - IBAction

- (IBAction)didTapLeftToolbarButton:(id)sender {

    if (self.isEditing) {
        [self showActionSheet];
        return;
    }
    MemoViewController *memoVC = [MemoViewController make:nil];
    [self.navigationController pushViewController:memoVC animated:true];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MemoListCellItem *item = self.provider.items[indexPath.row];
    MemoViewController *memoVC = [MemoViewController make:item.updateDate];
    [self.navigationController pushViewController:memoVC animated:true];
}

#pragma mark - DeleteMemoDelegate

- (void)didFinishDeleteMemo {
    [self reloadToolbar];
}

@end
