//
//  GBLoginViewController.m
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBAppDelegate.h"
#import "GBLoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@class GBLoginViewController;

@protocol GBLoginViewControllerDelegate <NSObject>
@optional
- (void)didLogin:(GBLoginViewController *)controller;
- (void)failedLogin:(GBLoginViewController *)controller;
@end

@interface GBLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fbLoginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) id<GBLoginViewControllerDelegate> delegate;
- (IBAction)loginButtonPressed:(id)sender;


@end


@implementation GBLoginViewController
@synthesize delegate;

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

- (IBAction)loginButtonPressed:(id)sender {
    GBAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    // The user has initiated a login, so call the openSession method
    // and show the login UX if necessary.
    [appDelegate openSessionWithAllowLoginUI:YES];
}
@end
