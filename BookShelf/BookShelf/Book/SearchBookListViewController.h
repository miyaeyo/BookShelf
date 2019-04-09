//
//  SearchBookListViewController.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "BookListViewController.h"


static const NSNotificationName SearchBarTextDidEndEditing = @"SearchBarTextDidEndEditing";


@interface SearchBookListViewController : BookListViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
