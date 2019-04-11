//
//  DetailBook.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "Book.h"

@interface DetailBook : Book


@property (nonatomic, readonly) NSString    *authors;
@property (nonatomic, readonly) NSString    *publisher;
@property (nonatomic, readonly) NSString    *pages;
@property (nonatomic, readonly) NSString    *year;
@property (nonatomic, readonly) NSString    *rating;
@property (nonatomic, readonly) NSString    *descriptions;
@property (nonatomic, readonly) BOOL        isBookmarked;


@end
