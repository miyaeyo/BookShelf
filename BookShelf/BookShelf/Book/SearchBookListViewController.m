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
    __weak UISearchBar *mSearchBar;
}


@synthesize searchBar = mSearchBar;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - private

- (void)setupViews
{
    [mSearchBar setDelegate:self];
}


#pragma mark - search bar delegate

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SearchBarTextDidEndEditing object:[searchBar text]];
}


@end
