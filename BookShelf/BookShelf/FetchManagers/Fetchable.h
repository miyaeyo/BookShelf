//
//  Fetchable.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#ifndef Fetchable_h
#define Fetchable_h

#import "Tab.h"


@protocol Fetchable


- (void)fetchWithCompletionHandler:(void (^)(NSArray *books))completionHandler;
- (void)cancel;


@end

#endif /* Fetchable_h */
