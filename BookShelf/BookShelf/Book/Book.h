//
//  Book.h
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 9..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Book : NSObject


@property (nonatomic, readonly) NSString    *title;
@property (nonatomic, readonly) NSString    *subtitle;
@property (nonatomic, readonly) NSString    *price;
@property (nonatomic, readonly) NSURL       *imageURL;
@property (nonatomic, readonly) NSURL       *url;
@property (nonatomic, readonly) NSString    *isbn13;


- (instancetype)initWithInfomation:(NSDictionary *)infomation;


@end
