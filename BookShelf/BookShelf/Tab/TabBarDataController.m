//
//  TabBarDataController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "TabBarDataController.h"


@implementation TabBarDataController
{
    NSArray<UITabBarItem *> *mItems;
}


+ (instancetype)dataControllerWithTabItems:(NSArray<UITabBarItem *> *)items
{
    return [[TabBarDataController alloc] initWithTabItems:items];
    
}


- (instancetype)initWithTabItems:(NSArray<UITabBarItem *> *)items
{
    self = [super init];
    
    if (self)
    {
        mItems = items;
    }
    
    return self;
}


@end
