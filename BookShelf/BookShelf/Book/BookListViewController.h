//
//  BookListViewController.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab.h"


@interface BookListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


- (void)setTab:(Tab *)tab;


@end

