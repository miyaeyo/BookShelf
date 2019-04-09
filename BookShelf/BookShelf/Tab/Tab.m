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
    NSString *mTitle;
    NSArray  *mBooks;
}


@synthesize title = mTitle;
@synthesize books = mBooks;


+ (instancetype)tabWithTitle:(NSString *)title books:(NSArray *)books
{
    return [[self alloc] initWithTitle:title books:books];
}


- (instancetype)initWithTitle:(NSString *)title books:(NSArray *)books
{
    self = [super init];
    
    if (self)
    {
        mTitle = title;
        mBooks = books;
    }
    
    return self;
}

@end
