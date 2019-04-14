//
//  PersistentStoreFetchManager.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fetchable.h"
#import "PersistentStore.h"
#import "Book.h"


@interface PersistentStoreFetchManager : NSObject<Fetchable>


+ (instancetype)bookmarkManager;
+ (instancetype)historyManager;

- (void)addBook:(Book *)book;
- (void)removeBook:(Book *)book;
- (BOOL)isExistBook:(Book *)book;


@end
