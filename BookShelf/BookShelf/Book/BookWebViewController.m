//
//  BookWebViewController.m
//  BookShelf
//
//  Created by Seungmi Jeong on 2019. 4. 15..
//  Copyright © 2019년 Seungmi Jeong. All rights reserved.
//

#import "BookWebViewController.h"


@implementation BookWebViewController
{
    WKWebView   *mWebView;
    UIButton    *mCloseButton;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mWebView = [[WKWebView alloc] initWithFrame:CGRectZero];
        mCloseButton = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGSize buttonSize = CGSizeMake(70, 30);
    CGSize viewSize = [[self view] bounds].size;
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    CGFloat gap = 10;
    
    [mCloseButton setFrame:CGRectMake(viewSize.width - buttonSize.width - gap, statusBarSize.height + gap, buttonSize.width, buttonSize.height)];
    [mWebView setFrame:[[self view] bounds]];
}


- (IBAction)closeButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)loadURL:(NSURL *)url
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [mWebView loadRequest:urlRequest];
}


- (void)setupViews
{
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [[self view] addSubview:mWebView];
    [[self view] addSubview:mCloseButton];
    
    [mCloseButton setTitle:@"close" forState:UIControlStateNormal];
    [mCloseButton setBackgroundColor:[UIColor whiteColor]];
    [mCloseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [mCloseButton addTarget:self action:@selector(closeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}




@end
