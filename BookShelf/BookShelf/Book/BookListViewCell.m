//
//  BookListViewCell.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 12..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "BookListViewCell.h"

@implementation BookListViewCell
{
    __weak UIImageView           *mBookImageView;
    __weak UILabel               *mTitleLabel;
    __weak UILabel               *mSubtitleLabel;
    __weak UILabel               *mPriceLabel;
    __weak UIButton              *mUrlButton;
    Book                         *mBook;
    __weak id<BookListViewCellDelegate> mDelegate;
}


@synthesize bookImageView = mBookImageView;
@synthesize titleLabel = mTitleLabel;
@synthesize subtitleLabel = mSubtitleLabel;
@synthesize priceLabel = mPriceLabel;
@synthesize urlButton = mUrlButton;
@dynamic book;
@synthesize delegate = mDelegate;


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [mUrlButton addTarget:self action:@selector(urlButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}


- (IBAction)urlButtonTapped:(id)sender
{
    [mDelegate bookListViewCell:self shouldOpenLinkWithURL:[mBook url]];
}


- (Book *)book
{
    return mBook;
}


- (void)setBook:(Book *)book
{
    mBook = book;
    NSData *sImageData = [NSData dataWithContentsOfURL: [mBook imageURL]];
    UIImage *sImage = [UIImage imageWithData:sImageData];
    [mBookImageView setImage:sImage];
    [mTitleLabel setText: [mBook title]];
    [mSubtitleLabel setText:[mBook subtitle]];
    [mPriceLabel setText:[mBook price]];
}

@end
