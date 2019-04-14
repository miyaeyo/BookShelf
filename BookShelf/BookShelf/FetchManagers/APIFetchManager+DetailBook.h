//
//  APIFetchManager+DetailBook.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 13..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "APIFetchManager.h"
#import "DetailBook.h"


@interface APIFetchManager (DetailBook)


- (void)fetchDetailBookWithCompletionHandler:(void (^)(DetailBook *book))completionHandler;


@end
