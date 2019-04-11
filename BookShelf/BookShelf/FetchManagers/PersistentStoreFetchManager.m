//
//  PersistentStoreFetchManager.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "PersistentStoreFetchManager.h"


@implementation PersistentStoreFetchManager
{
    PersistentStore *mStore;
    NSMutableSet    *mBooks;
}


#pragma mark - init

+ (instancetype)managerWithType:(PersistentStoreType)type
{
    return [[self alloc] initWithType:type];
}

- (instancetype)initWithType:(PersistentStoreType)type
{
    self = [super init];
    
    if (self)
    {
        mStore = [PersistentStore storeWithType:type];
    }
    
    return self;
}


#pragma mark - public

- (void)addBook:(Book *)book
{
    [mBooks addObject:book];
    [mStore saveBooks:[mBooks allObjects]];
}

- (void)removeBook:(Book *)book
{
    [mBooks removeObject:book];
    [mStore saveBooks:[mBooks allObjects]];
}


#pragma mark - fetchable

- (void)fetchWithCompletionHandler:(void (^)(NSArray *books))completionHandler
{
    [mStore loadBooksWithCompletionHandler:^(NSArray *books) {
        completionHandler(books);
    }];
}


@end
