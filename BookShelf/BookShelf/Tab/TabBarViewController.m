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


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupNotifications];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)searchTextDidEndEditing:(NSNotification *)notification
{
    NSString *query = [notification object];
    [mDataController searchWithQuery:query];
}


#pragma mark - delegate


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    TabCategory category = (TabCategory)[item tag];
    [mDataController selectTabWithCategory:category];
}


- (void)tabBarDataController:(TabBarDataController *)dataController didFinishFetchWithTab:(Tab *)tab
{
    UIViewController<TabSettable> *viewController = [[self viewControllers] objectAtIndex: [tab category]];
    [viewController setTab:tab];
}

#pragma mark - private


- (void)setupViews
{
    [mDataController selectTabWithCategory:TabCategoryNew];
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
