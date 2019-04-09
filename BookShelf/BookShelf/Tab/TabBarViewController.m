//
//  TabBarController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBarDataController.h"


@implementation TabBarViewController
{
    TabBarDataController *mDataController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupDataController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - delegate


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}


#pragma mark - private


- (void)setupViews
{
    
}


- (void)setupDataController
{
    mDataController = [TabBarDataController dataControllerWithTabItems:[[self tabBar] items]];
}

@end
