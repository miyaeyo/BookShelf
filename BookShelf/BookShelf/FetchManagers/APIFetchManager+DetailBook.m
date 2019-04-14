//
//  APIFetchManager+DetailBook.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 13..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "APIFetchManager+DetailBook.h"

@implementation APIFetchManager (DetailBook)


- (void)fetchDetailBookWithCompletionHandler:(void (^)(DetailBook *book))completionHandler
{
    [[[NSURLSession sharedSession] dataTaskWithRequest:[self urlRequest] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *sError = error;
        NSDictionary *sJsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&sError];
        
        DetailBook *book = [[DetailBook alloc] initWithInfomation:sJsonDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(book);
        });
    }] resume];
}


@end
