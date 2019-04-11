//
//  DetailBook.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "DetailBook.h"


@implementation DetailBook
{
    NSString *mAuthors;
    NSString *mPublisher;
    NSString *mPages;
    NSString *mYear;
    NSString *mRating;
    NSString *mDescriptions;
}


@synthesize authors = mAuthors;
@synthesize publisher = mPublisher;
@synthesize pages = mPages;
@synthesize year = mYear;
@synthesize rating = mRating;
@synthesize descriptions = mDescriptions;


- (instancetype)initWithInfomation:(NSDictionary *)infomation
{
    self = [super initWithInfomation:infomation];
    
    if (self)
    {
        mAuthors = [infomation objectForKey:@"authors"];
        mPublisher = [infomation objectForKey:@"publisher"];
        mPages = [infomation objectForKey:@"pages"];
        mYear = [infomation objectForKey:@"year"];
        mRating = [infomation objectForKey:@"rating"];
        mDescriptions = [infomation objectForKey:@"desc"];
    }
    
    return self;
    
}


- (NSDictionary *)infomation
{
    NSMutableDictionary *sDict = [NSMutableDictionary dictionaryWithDictionary:[super infomation]];
    sDict[@"authors"] = mAuthors;
    sDict[@"publisher"] = mPublisher;
    sDict[@"pages"] = mPages;
    sDict[@"year"] = mYear;
    sDict[@"rating"] = mRating;
    sDict[@"desc"] = mDescriptions;

    return [NSDictionary dictionaryWithDictionary:sDict];
}


@end
