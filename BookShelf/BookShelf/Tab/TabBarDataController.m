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
#import "PersistentStoreFetchManager.h"


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


- (void)searchWithQuery:(NSString *)query
{
    APIFetchManager *manager = (APIFetchManager *)mFetchManager;
    [manager setSearchQuery:query];
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
            mFetchManager = [[PersistentStoreFetchManager alloc] init];
            break;
        case TabCategoryHistory:
            mFetchManager = [[PersistentStoreFetchManager alloc] init];
            break;
    }
    
    [mFetchManager fetchWithCompletionHandler:^(NSArray *books) {
        Tab *sTab = [Tab tabWithCategory:self->mSelectedCategory books:books];
        [[self delegate] tabBarDataController:self didFinishFetchWithTab:sTab];
    }];
}



@end
