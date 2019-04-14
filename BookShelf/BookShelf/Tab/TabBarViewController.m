//
//  TabBarController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "TabBarViewController.h"
#import "Fetchable.h"
#import "TabSettable.h"
#import "SearchBookListViewController.h"


@implementation TabBarViewController
{
    TabBarDataController *mDataController;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setupDataController];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self setupNotifications];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([mDataController currentCategory] == TabCategoryBookmarks)
    {
        [mDataController selectTabWithCategory:TabCategoryBookmarks];
    }
}


- (void)searchTextDidEndEditing:(NSNotification *)notification
{
    NSString *query = [notification object];
    [mDataController searchWithQuery:query];
    UIViewController<TabSettable> *viewController = [[self viewControllers] objectAtIndex: TabCategorySearch];
    [viewController startActivityIndicator];
}


#pragma mark - delegate


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    TabCategory category = (TabCategory)[item tag];
    if (category != TabCategorySearch)
    {
        UIViewController<TabSettable> *viewController = [[self viewControllers] objectAtIndex: category];
        [viewController startActivityIndicator];
    }
    
    [mDataController selectTabWithCategory:category];
}


- (void)tabBarDataController:(TabBarDataController *)dataController didFinishFetchWithTab:(Tab *)tab
{
    UIViewController<TabSettable> *viewController = [[self viewControllers] objectAtIndex: [tab category]];
    [viewController setTab:tab];
    [viewController stopActivityIndicator];
}


#pragma mark - private


- (void)setupViews
{
    [mDataController selectTabWithCategory:TabCategoryNew];
    
    UIViewController<TabSettable> *viewController = [[self viewControllers] objectAtIndex: TabCategoryNew];
    [viewController startActivityIndicator];
}


- (void)setupDataController
{
    mDataController = [[TabBarDataController alloc] init];
    [mDataController setDelegate:self];
}


- (void)setupNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchTextDidEndEditing:) name:SearchBarTextDidEndEditing object:nil];
}


@end
