//
//  GBItemDetailedViewController.m
//  gleebox
//
//  Created by tom on 12/24/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBItemDetailedViewController.h"

@interface GBItemDetailedViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation GBItemDetailedViewController

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
    // Do any additional setup after loading the view from its nib.
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
