//
//  Tab.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, TabCategory)
{
    TabCategoryNew = 0,
    TabCategorySearch = 1,
    TabCategoryBookmarks = 2,
    TabCategoryHistory = 3
};


@interface Tab : NSObject

@property (nonatomic, readonly) TabCategory category;
@property (nonatomic, readonly) NSString    *title;
@property (nonatomic, readonly) NSArray     *books;


+ (instancetype)tabWithCategory:(TabCategory)category books:(NSArray *)books;


@end
