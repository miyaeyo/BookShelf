//
//  DetailBookViewController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 13..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "DetailBookViewController.h"
#import "PersistentStoreFetchManager.h"
#import "PersistentStore.h"


@implementation DetailBookViewController
{
    DetailBook         *mDetailBook;
    __weak UILabel     *mTitleLabel;
    __weak UIImageView *mBookImageView;
    __weak UILabel     *mSubtitleLabel;
    __weak UILabel     *mAuthorsLabel;
    __weak UILabel     *mPublisherLabel;
    __weak UILabel     *mYearLabel;
    __weak UILabel     *mPagesLabel;
    __weak UILabel     *mRatingLabel;
    __weak UILabel     *mPriceLabel;
    __weak UITextView  *mDescriptionLabel;
    __weak UIButton    *mBookmarkButton;
    
    BOOL               mIsBookmarked;
    PersistentStoreFetchManager *mBookmarkManager;
}


@synthesize bookmarkButton = mBookmarkButton;
@synthesize titleLabel = mTitleLabel;
@synthesize bookImageView = mBookImageView;
@synthesize subtitleLabel = mSubtitleLabel;
@synthesize authorsLabel = mAuthorsLabel;
@synthesize publisherLabel = mPublisherLabel;
@synthesize yearLabel = mYearLabel;
@synthesize pagesLabel = mPagesLabel;
@synthesize ratingLabel = mRatingLabel;
@synthesize priceLabel = mPriceLabel;
@synthesize descriptionLabel = mDescriptionLabel;


- (instancetype)initWithDetailBook:(DetailBook *)detailBook
{
    self = [super initWithNibName:@"DetailBookViewController" bundle:nil];
    
    if (self)
    {
        [self view];
        mBookmarkManager = [PersistentStoreFetchManager bookmarkManager];
        [self setDetailBook:detailBook];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)bookmarkButtonTapped:(id)sender {
    mIsBookmarked = !mIsBookmarked;
    [self updateIsBookmarkedButton];
    if (mIsBookmarked)
    {
        [mBookmarkManager addBook: mDetailBook];
    }
    else
    {
        [mBookmarkManager removeBook:mDetailBook];
    }
}


- (IBAction)closeButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)setDetailBook:(DetailBook *)detailBook
{
    mDetailBook = detailBook;
    [mTitleLabel setText: [mDetailBook title]];
    [mBookImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[mDetailBook imageURL]]]];
    [mSubtitleLabel setText:[mDetailBook subtitle]];
    [mAuthorsLabel setText:[mDetailBook authors]];
    [mPublisherLabel setText:[mDetailBook publisher]];
    [mYearLabel setText:[NSString stringWithFormat:@"%@ year", [mDetailBook year]]];
    [mPagesLabel setText:[NSString stringWithFormat:@"%@ pages", [mDetailBook pages]]];
    [mRatingLabel setText:[NSString stringWithFormat:@"%@ points", [mDetailBook rating]]];
    [mPriceLabel setText:[NSString stringWithFormat:@"$%@", [mDetailBook price]]];
    [mDescriptionLabel setText:[mDetailBook descriptions]];
    
    mIsBookmarked = [mBookmarkManager isExistBook:mDetailBook];
    [self updateIsBookmarkedButton];
}


- (void)updateIsBookmarkedButton
{
    NSString *buttonText = mIsBookmarked ? @"bookmarked" : @"bookmark";
    UIColor *buttonColor = mIsBookmarked ? [UIColor redColor] : [UIColor blueColor];
    [mBookmarkButton setTitle:buttonText forState:UIControlStateNormal];
    [mBookmarkButton setTitleColor:buttonColor forState:UIControlStateNormal];
}


@end
