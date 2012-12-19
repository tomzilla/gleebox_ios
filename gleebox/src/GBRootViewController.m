//
//  GBRootViewController.m
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBRootViewController.h"
#import "GBLoginViewController.h"

@interface GBRootViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *containerView;
@property (strong, nonatomic) GBLoginViewController *loginViewController;

@end

@implementation GBRootViewController

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
    GBLoginViewController *loginViewController = [[GBLoginViewController alloc] initWithNibName:nil bundle:nil];
    [self.containerView addSubview:loginViewController.view];
    self.loginViewController = loginViewController;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setContainerView:nil];
    [super viewDidUnload];
}
@end
