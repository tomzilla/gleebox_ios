//
//  GBBrowseViewController.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBBrowseViewController.h"
#import "GBItemService.h"
#import "GBItemView.h"
#import "GBPullToRefreshScrollView.h"

@interface GBBrowseViewController () <UIScrollViewDelegate, GBPullToRefreshScrollViewDelegate>
@property (strong, nonatomic) IBOutlet GBPullToRefreshScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *itemViews;
@end
static NSInteger offset;
@implementation GBBrowseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        offset = 0;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate1 = self;
    self.itemViews = [NSMutableArray array];
    // Do any additional setup after loading the view from its nib.
}

-(void)refreshScrollView {
    offset = 0;
    [self loadItems];
}

-(void)stopLoading
{
	[self.scrollView stopLoading];
}

- (void)loadItems {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((320.0-32)/2.0, 110 * (offset / 3) + 110.0, 32.0, 32.0)];
    [self.scrollView addSubview:indicator];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 110 * (offset / 3) + 110.0 + 32.0);
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.frame.size.height) animated:YES];
    [[GBItemService singleton] getHomeItems:offset callback:^(NSArray *items) {
        [indicator removeFromSuperview];
        [self renderItems:items];
        [self performSelector:@selector(stopLoading) withObject:nil afterDelay:2.0];
    }];
}

- (void)renderItems:(NSArray *)items {
    __block float currentY;
    __block float currentX;
    [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        currentX = 105.0 * (offset % 3) + 5.0;
        currentY = 105.0 * (offset / 3) + 5.0;
        GBItem *it = [[GBItem alloc]initWithData:obj];
        GBItemView *item = [[GBItemView alloc] initWithItem:it];
        [self.itemViews addObject:item];
        item.frame = CGRectMake(currentX, currentY, item.frame.size.width, item.frame.size.height);
        [self.scrollView addSubview:item];
        offset ++;
    }];
    [self.scrollView setContentSize:CGSizeMake(320.0, currentY + 110)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadItems];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
