//
//  APIFetchManager.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 10..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fetchable.h"

@interface APIFetchManager : NSObject<Fetchable>


+(instancetype)managerWithAPIURLString:(NSString *)urlString;

- (void)setSearchQuary:(NSString *)quary;


@end
