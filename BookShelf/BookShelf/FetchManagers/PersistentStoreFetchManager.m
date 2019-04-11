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


#pragma mark - fetchable

- (void)fetchWithCompletionHandler:(void (^)(NSArray *books))completionHandler
{
    [mStore loadBooksWithCompletionHandler:^(NSArray *books) {
        completionHandler(books);
    }];
}


@end
