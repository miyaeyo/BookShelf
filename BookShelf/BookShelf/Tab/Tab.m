//
//  Tab.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "Tab.h"

@implementation Tab
{
    TabCategory mCategory;
    NSString    *mTitle;
    NSArray     *mBooks;
}


@synthesize category = mCategory;
@synthesize title = mTitle;
@synthesize books = mBooks;


+ (instancetype)tabWithCategory:(TabCategory)category books:(NSArray *)books
{
    return [[self alloc] initWithCategory:category books:books];
}


- (instancetype)initWithCategory:(TabCategory)category books:(NSArray *)books
{
    self = [super init];
    
    if (self)
    {
        mCategory = category;
        
        switch (category) {
            case TabCategoryNew:
                mTitle = @"New";
            case TabCategorySearch:
                mTitle = @"Search";
            case TabCategoryBookmarks:
                mTitle = @"Bookmarks";
            case TabCategoryHistory:
                mTitle = @"History";
        }
        
        mBooks = books;
    }
    
    return self;
}

@end
