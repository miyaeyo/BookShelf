//
//  PersistentStore.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 11..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, PersistentStoreType)
{
    PersistentStoreTypeBookMark = 0,
    PersistentStoreTypeHistory = 1,
};


@interface PersistentStore : NSObject


+ (instancetype)storeWithType:(PersistentStoreType)type;


- (void)saveBooks:(NSArray *)books;
- (void)loadBooksWithCompletionHandler:(void (^)(NSArray *books))completionHandler;


@end
