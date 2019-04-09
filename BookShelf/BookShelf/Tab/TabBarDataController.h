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


- (void)tabBarDataController:(TabBarDataController *)dataController didSelectTab:(Tab *)tab;


@end


@interface TabBarDataController : NSObject


@property (nonatomic, weak) id<TabBarDataControllerDelegate> delegate;

- (void)selectTabWithCategory:(TabCategory)category;
- (void)searchWithQuary:(NSString *)quary;


@end
