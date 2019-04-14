//
//  ViewController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "BookListViewController.h"
#import "APIFetchManager+DetailBook.h"
#import "DetailBookViewController.h"
#import "BookWebViewController.h"
#import "PersistentStoreFetchManager.h"


@implementation BookListViewController
{
    UITableView                 *mTableView;
    Tab                         *mTab;
    UIActivityIndicatorView     *mIndicatorView;
    PersistentStoreFetchManager *mHistoryManager;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];    
    mHistoryManager = [PersistentStoreFetchManager historyManager];

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
    [mTableView reloadData];
}


- (void)startActivityIndicator
{
    [mIndicatorView startAnimating];
}


- (void)stopActivityIndicator
{
    [mIndicatorView stopAnimating];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Book *book =[[mTab books] objectAtIndex:[indexPath row]];
    APIFetchManager *fetchManager = [APIFetchManager managerWithAPIURLString:[NSString stringWithFormat:@"https://api.itbook.store/1.0/books/%@", [book isbn13]]];
    
    [fetchManager fetchDetailBookWithCompletionHandler:^(DetailBook *book) {
        [self->mHistoryManager addBook:book];
        DetailBookViewController *detailViewController = [[DetailBookViewController alloc] initWithDetailBook:book];
        [self presentViewController:detailViewController animated:NO completion:nil];
    }];
}


#pragma mark - cell delegate


- (void)bookListViewCell:(BookListViewCell *)cell shouldOpenLinkWithURL:(NSURL *)url
{
    BookWebViewController *webViewController = [[BookWebViewController alloc] init];
    [webViewController loadURL:url];
    [self presentViewController:webViewController animated:NO completion:nil];
}


#pragma mark - private


- (void)setupViews
{
    mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    mIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [mTableView addSubview:mIndicatorView];
    [[self view] addSubview:mTableView];
    [mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [mTableView setDelegate:self];
    [mTableView setDataSource:self];
    UINib *nib = [UINib nibWithNibName:kReuseIdentifier bundle:nil];
    [mTableView registerNib:nib forCellReuseIdentifier:kReuseIdentifier];
    
}


@end
