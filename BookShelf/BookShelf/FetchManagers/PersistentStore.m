//
//  PersistentStore.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 11..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "PersistentStore.h"
#import "Book.h"


@implementation PersistentStore
{
    NSURL *mRootURL;
    NSURL *mFileURL;
    NSFileManager *mFileManager;
}


#pragma mark - init


+ (instancetype)storeWithType:(PersistentStoreType)type
{
    return [[self alloc] initWithType:type];
}


- (instancetype)initWithType:(PersistentStoreType)type
{
    self = [super init];
    
    if (self)
    {
        mFileManager = [NSFileManager defaultManager];
        NSString *sApplicationSupport = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) firstObject];
        mRootURL = [[NSURL fileURLWithPath:sApplicationSupport] URLByAppendingPathComponent:@"BookShelf"];
        NSString *sPathComponent = (type == PersistentStoreTypeBookMark) ? @"bookmark.json" : @"history.json";
        mFileURL = [mRootURL URLByAppendingPathComponent:sPathComponent];
        [self createFolderIfNotExist:mRootURL];
    }
    
    return self;
}


#pragma mark - public


- (void)saveBooks:(NSArray *)books
{
    NSMutableArray *sInfos = [NSMutableArray array];
    for (Book *sBook in books) {
        [sInfos addObject: [sBook infomation]];
    }
    
    NSDictionary *sDict = @{@"books": sInfos};
    NSError *sError;
    NSData *sJsonData = [NSJSONSerialization dataWithJSONObject:sDict options:NSJSONWritingPrettyPrinted error:&sError];
    [mFileManager createFileAtPath:[mFileURL path] contents:sJsonData attributes:nil];
}


- (void)loadBooksWithCompletionHandler:(void (^)( NSArray *books))completionHandler
{
    NSError *sError;
    NSData *sData = [mFileManager contentsAtPath:[mFileURL path]];
    if (sData)
    {
        NSDictionary *sJsonDict = [NSJSONSerialization JSONObjectWithData:sData options:NSJSONReadingMutableContainers error:&sError];
        NSArray *sBookInfos = [sJsonDict objectForKey:@"books"];
        NSMutableArray *sBooks = [NSMutableArray array];
        
        for (NSDictionary *sBookInfo in sBookInfos) {
            Book *sBook = [[Book alloc] initWithInfomation:sBookInfo];
            [sBooks addObject:sBook];
        }
        
        completionHandler(sBooks);
    }
    else
    {
        completionHandler([NSArray array]);
    }
    
}


#pragma mark - private


- (void)createFolderIfNotExist:(NSURL *)url
{
    NSError *sError;
    
    if ([mFileManager fileExistsAtPath:[url path] isDirectory:nil] == NO)
    {
        [mFileManager createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:&sError];
    }
    
    if (sError)
    {
        NSLog(@"error: %@", [sError localizedDescription]);
    }
}


@end
