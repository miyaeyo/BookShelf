//
//  TabBarDataController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "TabBarDataController.h"
#import "Book.h"
#import "Fetchable.h"
#import "APIFetchManager.h"
#import "BookMarkFetchManager.h"
#import "HistoryFetchManager.h"


@implementation TabBarDataController
{
    __weak id<TabBarDataControllerDelegate> mDelegate;
    TabCategory                             mSelectedCategory;
    id<Fetchable>                           mFetchManager;
   
}


@synthesize delegate = mDelegate;


#pragma mark - public


- (void)selectTabWithCategory:(TabCategory)category
{
    mSelectedCategory = category;
    if (mSelectedCategory != TabCategorySearch)
    {
        [self fetch];
    }
}


- (void)searchWithQuary:(NSString *)quary
{
    APIFetchManager *manager = (APIFetchManager *)mFetchManager;
    [manager setSearchQuary:quary];
    [self fetch];
}


#pragma mark - private


- (void)fetch
{
    switch (mSelectedCategory) {
        case TabCategoryNew:
            mFetchManager = [APIFetchManager managerWithAPIURLString:@"https://api.itbook.store/1.0/new"];
            break;
        case TabCategorySearch:
            mFetchManager = [APIFetchManager managerWithAPIURLString:@"https://api.itbook.store/1.0/search/"];
            break;
        case TabCategoryBookmarks:
            mFetchManager = [[BookmarkFetchManager alloc] init];
            break;
        case TabCategoryHistory:
            mFetchManager = [[HistoryFetchManager alloc] init];
            break;
    }
    
    [mFetchManager fetchWithCompletionHandler:^(NSArray *books) {
        Tab *sTab = [Tab tabWithTitle:[self tabTitle] books:books];
        [[self delegate] tabBarDataController:self didSelectTab:sTab];
    }];
}


- (NSString *)tabTitle
{
    switch (mSelectedCategory) {
        case TabCategoryNew:
            return @"New";
        case TabCategorySearch:
            return @"Search";
        case TabCategoryBookmarks:
            return @"Bookmarks";
        case TabCategoryHistory:
            return @"History";
    }
}


@end
