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

+ (instancetype)bookmarkManager
{
    static PersistentStoreFetchManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithType:PersistentStoreTypeBookMark];
    });
    
    return manager;
}


+ (instancetype)historyManager
{
    static PersistentStoreFetchManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithType:PersistentStoreTypeHistory];
    });
    
    return manager;
}


- (instancetype)initWithType:(PersistentStoreType)type
{
    self = [super init];
    
    if (self)
    {
        mStore = [PersistentStore storeWithType:type];
        [mStore loadBooksWithCompletionHandler:^(NSArray *books) {
            self->mBooks = [NSMutableSet setWithArray:books];
        }];
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

- (BOOL)isExistBook:(Book *)book
{
    return [mBooks member:book];
}


#pragma mark - fetchable

- (void)fetchWithCompletionHandler:(void (^)(NSArray *books))completionHandler
{
    NSArray *sBooks = [mBooks allObjects];
    completionHandler(sBooks);
}

- (void)cancel
{
    
}


@end
