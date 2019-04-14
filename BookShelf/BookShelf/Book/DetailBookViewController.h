//
//  DetailBookViewController.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 13..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailBook.h"


@interface DetailBookViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *publisherLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *pagesLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIButton *bookmarkButton;


- (instancetype)initWithDetailBook:(DetailBook *)detailBook;


@end
