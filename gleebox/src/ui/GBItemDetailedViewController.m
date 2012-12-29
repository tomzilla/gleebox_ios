//
//  GBItemDetailedViewController.m
//  gleebox
//
//  Created by tom on 12/24/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBItemDetailedViewController.h"
#import "GBURLImageView.h"
#import "GBAPI.h"
#import "GBCommentView.h"
#import "GBContainerView.h"
#import "GBCommentBox.h"
#import "GBUserService.h"

@interface GBItemDetailedViewController () <GBUULImageViewDelegate, GBCommentBoxDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) GBItem *item;
@property (strong, nonatomic) GBContainerView *bottomContainer;
@property (strong, nonatomic) GBURLImageView *imageView;
@property (strong, nonatomic) GBCommentBox *commentBox;
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
    self.imageView = [GBURLImageView alloc];
    self.imageView.delegate = self;
    self.imageView = [self.imageView initWithFrame:self.scrollView.frame url:self.item.pictures ? [NSString stringWithFormat:@"http://s3.amazonaws.com/gleebox_items/%@", self.item.pictures[0]] : @"http://i.imgur.com/Ikgoj.jpg" noCrop:YES];
    self.bottomContainer = [[GBContainerView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100.0)];
    [self.scrollView addSubview:self.bottomContainer];
    [self.scrollView addSubview:self.imageView];
    // Do any additional setup after loading the view from its nib.
    [GBAPI call:@"item.get_comments" data:[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:self.item.id] forKey:@"item_id"] callback:^(NSDictionary *data) {
        __block float currentY = 0;

        if (data && [data objectForKey:@"response"]) {
            
            if ([[data objectForKey:@"response"] isKindOfClass:[NSArray class]]) {
                NSArray *comments = (NSArray *)[data objectForKey:@"response"];
                [comments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    
                    GBCommentView *commentView = [[GBCommentView alloc] initWithFrame:CGRectMake(0, currentY, 320.0, 25) data:obj];
                    currentY += commentView.frame.size.height;
                    [self.bottomContainer addSubview:commentView];
                }];
            }
        }
        self.commentBox = [[GBCommentBox alloc] initWithFrame:CGRectMake(0, currentY, 320.0, 25) item:self.item];
        self.commentBox.delegate = self;
        [self.bottomContainer addSubview:self.commentBox];
        [self.bottomContainer sizeToFit];
        self.scrollView.contentSize = CGSizeMake(320.0, self.imageView.frame.size.height + self.bottomContainer.frame.size.height);
        

    }];
    
}

- (void)commentBoxCommentAdded:(NSDictionary *)comment {
    float currentY = self.commentBox.frame.origin.y + self.commentBox.frame.size.height;
    NSDictionary *user = [NSDictionary dictionaryWithObjectsAndKeys:
                          [GBUserService singleton].user.fbid, @"fbid",
                          [GBUserService singleton].user.userId, @"id", nil];
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithDictionary:comment];
    [data setObject:user forKey:@"user"];
    GBCommentView *commentView = [[GBCommentView alloc] initWithFrame:CGRectMake(0, currentY, 320.0, 25) data:data];
    currentY += commentView.frame.size.height;
    [UIView animateWithDuration:0.2
                          delay:0
                        options:(UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseIn)
                     animations:^{
                         CGRect frame = self.commentBox.frame;
                         frame.origin.y += 25;
                         self.commentBox.frame = frame;
                        }
                     completion:^(BOOL finished) {
                         [self.bottomContainer addSubview:commentView];
                     }];

}

- (void)didRenderImage:(GBURLImageView *)image {
    CGRect frame = self.bottomContainer.frame;
    float y = self.imageView.frame.size.height + self.imageView.frame.origin.y;
    frame.origin.y = y;
    self.bottomContainer.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setBottomContainer:nil];
    [super viewDidUnload];
}
@end
