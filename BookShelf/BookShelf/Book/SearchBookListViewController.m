//
//  SearchBookListViewController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "SearchBookListViewController.h"
#import "BookListViewController.h"


@implementation SearchBookListViewController
{
    __weak UISearchBar       *mSearchBar;
    BookListViewController   *mBookListViewController;
}


@synthesize searchBar = mSearchBar;


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
    
    [[mBookListViewController view] setFrame:CGRectMake(0, y, size.width, size.height - y)];
}


#pragma mark - search bar delegate


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [mSearchBar resignFirstResponder];
    [[NSNotificationCenter defaultCenter] postNotificationName:SearchBarTextDidEndEditing object:[searchBar text]];
    
}


#pragma mark - tab settable


- (void)setTab:(Tab *)tab
{
    [mBookListViewController setTab:tab];
}


- (void)startActivityIndicator
{
    [mBookListViewController startActivityIndicator];
}


- (void)stopActivityIndicator
{
    [mBookListViewController stopActivityIndicator];
}


#pragma mark - private


- (void)setupViews
{
    [mSearchBar setDelegate:self];
    
    mBookListViewController = [[BookListViewController alloc] init];
    [self addChildViewController:mBookListViewController];
    [[self view] addSubview:[mBookListViewController view]];
    [mBookListViewController didMoveToParentViewController:self];
}



@end
