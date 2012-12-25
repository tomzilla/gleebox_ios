//
//  GBRootViewController.m
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBRootViewController.h"
#import "GBLoginViewController.h"
#import "GBShareViewController.h"
#import "GBFavsViewController.h"
#import "GBBrowseViewController.h"
#import "GBNavigationViewController.h"

@interface GBRootViewController () <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *containerView;
@property (strong, nonatomic) GBLoginViewController *loginViewController;
@property (strong, nonatomic) UIViewController *contentController;
@property (strong, nonatomic) UITabBarController *tabsController;
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
    
//    GBLoginViewController *loginViewController = [[GBLoginViewController alloc] initWithNibName:nil bundle:nil];
//    [self.containerView addSubview:loginViewController.view];
//    self.loginViewController = loginViewController;
    
//    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated {
    self.tabsController = [[UITabBarController alloc] init];
    GBBrowseViewController *browse = [[GBBrowseViewController alloc] init];
    UIViewController *tab1 = [[GBNavigationViewController alloc] initWithRootViewController:browse];
    browse.navigationController = (UINavigationController *)tab1;
    tab1.title = @"Browse";
    UIViewController *tab2 = [[GBShareViewController alloc] init];
    UIViewController *tab3 = [[GBFavsViewController alloc] init];
    self.tabsController.viewControllers = [NSArray arrayWithObjects:tab1, tab2, tab3, nil];
    [self presentViewController:self.tabsController animated:NO completion:nil];
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
