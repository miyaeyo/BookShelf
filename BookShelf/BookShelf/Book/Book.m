//
//  Book.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "Book.h"


@implementation Book
{
    NSString *mTitle;
    NSString *mSubtitle;
    NSString *mPrice;
    NSURL *mImageURL;
    NSURL *mUrl;
    NSString *mISBN13;
}


@synthesize title = mTitle;
@synthesize subtitle = mSubtitle;
@synthesize price = mPrice;
@synthesize imageURL = mImageURL;
@synthesize url = mUrl;
@synthesize isbn13 = mISBN13;


- (instancetype)initWithInfomation:(NSDictionary *)infomation
{
    self = [super init];
    
    if (self)
    {
        mTitle = [infomation objectForKey:@"title"];
        mSubtitle = [infomation objectForKey:@"subtitle"];
        mPrice = [infomation objectForKey:@"price"];
        mImageURL = [NSURL URLWithString:[infomation objectForKey:@"image"]];
        mUrl = [NSURL URLWithString:[infomation objectForKey:@"url"]];
        mISBN13 = [infomation objectForKey:@"isbn13"];
        
    }
    
    return self;
   
}


- (NSDictionary *)infomation
{
    return @{@"title"   : mTitle,
             @"subtitle": mSubtitle,
             @"price"   : mPrice,
             @"image"   : [mImageURL absoluteString],
             @"url"     : [mUrl absoluteString],
             @"isbn13"  : mISBN13};
}

- (BOOL)isEqual:(id)object
{
    return ([self hash] == [object hash]);
}

- (NSUInteger)hash
{
    return [mISBN13 hash];
}


@end
