//
//  APIFetchManager.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "APIFetchManager.h"
#import "Book.h"


@implementation APIFetchManager
{
    NSString *mUrlString;
}


#pragma mark - init

+(instancetype)managerWithAPIURLString:(NSString *)urlString
{
    return [[self alloc] initWithAPIURLString:urlString];
}

- (instancetype)initWithAPIURLString:(NSString *)urlString
{
    self = [super init];
    
    if (self)
    {
        mUrlString = urlString;
    }
    
    return self;
}


#pragma mark - public

- (void)fetchWithCompletionHandler:(void (^)(NSArray *books))completionHandler
{
    [[[NSURLSession sharedSession] dataTaskWithRequest:[self urlRequest] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *sError = error;
        NSDictionary *sJsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&sError];
        NSArray *sBookInfos = [sJsonDict objectForKey:@"books"];
        NSMutableArray *sBooks = [NSMutableArray array];
        
        for (NSDictionary *sBookInfo in sBookInfos) {
            Book *sBook = [[Book alloc] initWithInfomation:sBookInfo];
            [sBooks addObject:sBook];
        }
        
        completionHandler(sBooks);
        
    }] resume];
}

- (void)setSearchQuary:(NSString *)quary
{
    mUrlString = [NSString stringWithFormat: @"%@%@", mUrlString, quary];
}


#pragma mark - private


- (NSURLRequest *)urlRequest
{
    NSMutableURLRequest *sRequest = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:mUrlString]];
    [sRequest setHTTPMethod:@"GET"];

    return sRequest;
}


@end
