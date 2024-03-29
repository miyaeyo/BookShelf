//
//  TabBarDataController.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab.h"


@class TabBarDataController;
@protocol TabBarDataControllerDelegate


- (void)tabBarDataController:(TabBarDataController *)dataController didFinishFetchWithTab:(Tab *)tab;


@end


@interface TabBarDataController : NSObject


@property (nonatomic, weak) id<TabBarDataControllerDelegate> delegate;
@property (nonatomic, readonly) TabCategory currentCategory;


- (void)selectTabWithCategory:(TabCategory)category;
- (void)searchWithQuery:(NSString *)query;


@end
