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
        [self fetchWithQuery:nil];
    }
}


- (void)searchWithQuery:(NSString *)query
{
    [self fetchWithQuery:query];
}


#pragma mark - private


- (void)fetchWithQuery:(nullable NSString *)query
{
    [mFetchManager cancel];
    switch (mSelectedCategory) {
        case TabCategoryNew:
            mFetchManager = [APIFetchManager managerWithAPIURLString:@"https://api.itbook.store/1.0/new"];
            break;
        case TabCategorySearch:
            mFetchManager = [APIFetchManager managerWithAPIURLString: [NSString stringWithFormat:@"https://api.itbook.store/1.0/search/%@", query]];
            break;
        case TabCategoryBookmarks:
            mFetchManager = [PersistentStoreFetchManager bookmarkManager];
            break;
        case TabCategoryHistory:
            mFetchManager = [PersistentStoreFetchManager historyManager];
            break;
    }
    
    [mFetchManager fetchWithCompletionHandler:^(NSArray *books) {
        Tab *sTab = [Tab tabWithCategory:self->mSelectedCategory books:books];
        [[self delegate] tabBarDataController:self didFinishFetchWithTab:sTab];
    }];
}



@end
