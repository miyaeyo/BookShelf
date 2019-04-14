//
//  BookListViewCell.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 12..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"


static NSString *kReuseIdentifier = @"BookListViewCell";


@class BookListViewCell;
@protocol BookListViewCellDelegate


- (void)bookListViewCell:(BookListViewCell *)cell shouldOpenLinkWithURL:(NSURL *)url;


@end


@interface BookListViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView         *bookImageView;
@property (weak, nonatomic) IBOutlet UILabel             *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel             *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel             *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton            *urlButton;
@property (nonatomic) Book                               *book;
@property (weak, nonatomic) id<BookListViewCellDelegate> delegate;


@end
