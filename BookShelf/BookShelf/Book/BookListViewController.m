//
//  ViewController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "BookListViewController.h"


@implementation BookListViewController
{
    UITableView *mTableView;
    Tab         *mTab;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [mTableView setDelegate:self];
    [mTableView setDataSource:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - public

- (void)setTab:(Tab *)tab
{
    mTab = tab;
    [mTableView reloadData];
}


# pragma mark - tableview delegate, data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[mTab books] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] init];
}


@end
