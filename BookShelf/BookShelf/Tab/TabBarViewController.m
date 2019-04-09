//
//  TabBarController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "TabBarViewController.h"
#import "Fetchable.h"


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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - delegate


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    TabCategory category = (TabCategory)[item tag];
    [mDataController selectTabWithCategory:category];
}


- (void)tabBarDataController:(TabBarDataController *)dataController didSelectTab:(Tab *)tab
{
    
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

@end
