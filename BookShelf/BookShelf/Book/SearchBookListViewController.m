//
//  SearchBookListViewController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "SearchBookListViewController.h"


@implementation SearchBookListViewController
{
    __weak UISearchBar       *mSearchBar;
    UITableView              *mTableView;
    Tab                      *mTab;
    UIActivityIndicatorView  *mIndicatorView;
}


@synthesize searchBar = mSearchBar;


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


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat y = CGRectGetMaxY([mSearchBar frame]);
    CGSize size = [[self view] bounds].size;
    
    [mTableView setFrame:CGRectMake(0, y, size.width, size.height - y)];
    [mIndicatorView setFrame:[mTableView bounds]];
}


#pragma mark - search bar delegate


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [mSearchBar resignFirstResponder];
    [mIndicatorView startAnimating];
    [[NSNotificationCenter defaultCenter] postNotificationName:SearchBarTextDidEndEditing object:[searchBar text]];
    
}


#pragma mark - tab settable

- (void)setTab:(Tab *)tab {
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
    [mSearchBar setDelegate:self];
    
    [[self view] addSubview:mTableView];
    [mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [mTableView setDelegate:self];
    [mTableView setDataSource:self];
    UINib *nib = [UINib nibWithNibName:kReuseIdentifier bundle:nil];
    [mTableView registerNib:nib forCellReuseIdentifier:kReuseIdentifier];
    [mTableView addSubview:mIndicatorView];    
}



@end
