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
    UITableView             *mTableView;
    Tab                     *mTab;
    UIActivityIndicatorView *mIndicatorView;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self)
    {
        mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        mIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [mIndicatorView startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    [mTableView setFrame: [[self view] bounds]];
    [mIndicatorView setFrame:[mTableView bounds]];
}


#pragma mark - tabsettable

- (void)setTab:(Tab *)tab
{
    mTab = tab;
    [mIndicatorView stopAnimating];
    [mTableView reloadData];
}


# pragma mark - tableview delegate, data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[mTab books] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    [cell setBook:[[mTab books] objectAtIndex:[indexPath row]]];
    [cell setDelegate:self];
    
    return cell;
}


#pragma mark - cell delegate

- (void)bookListViewCell:(BookListViewCell *)cell shouldOpenLinkWithURL:(NSURL *)url
{
    
}


#pragma mark - private

- (void)setupViews
{
    [mTableView addSubview:mIndicatorView];
    [[self view] addSubview:mTableView];
    [mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [mTableView setDelegate:self];
    [mTableView setDataSource:self];
    UINib *nib = [UINib nibWithNibName:kReuseIdentifier bundle:nil];
    [mTableView registerNib:nib forCellReuseIdentifier:kReuseIdentifier];
}


@end
