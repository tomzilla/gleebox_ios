//
//  GBItemDetailedViewController.m
//  gleebox
//
//  Created by tom on 12/24/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBItemDetailedViewController.h"
#import "GBURLImageView.h"

@interface GBItemDetailedViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) GBItem *item;
@property (weak, nonatomic) IBOutlet UIView *bottomConatiner;
@property (strong, nonatomic) GBURLImageView *imageView;
@end

@implementation GBItemDetailedViewController

- (id)initWithItem:(GBItem *)item {
    self = [super init];
    if (self) {
        self.item = item;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView = [[GBURLImageView alloc] initWithFrame:self.scrollView.frame url:self.item.pictures ? [NSString stringWithFormat:@"http://s3.amazonaws.com/gleebox_items/%@", self.item.pictures[0]] : @"http://i.imgur.com/Ikgoj.jpg" noCrop:YES];
    [self.scrollView addSubview:self.imageView];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setBottomConatiner:nil];
    [super viewDidUnload];
}
@end
