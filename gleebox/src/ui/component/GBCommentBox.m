//
//  GBCommentBox.m
//  gleebox
//
//  Created by tom on 12/28/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBCommentBox.h"
#import "GBURLImageView.h"
#import "GBUserService.h"
#import "GBAPI.h"
#import <QuartzCore/QuartzCore.h>

@interface GBCommentBox () <UITextFieldDelegate>
@property (nonatomic, strong) GBItem *item;
@property (nonatomic, strong) UITextField *commentField;
@end

@implementation GBCommentBox

- (id)initWithFrame:(CGRect)frame item:(GBItem *)item;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.item = item;
        // Initialization code
        GBUser *user = [GBUserService singleton].user;
        GBURLImageView *picture = [[GBURLImageView alloc] initWithFrame:CGRectMake(0, 0, 25.0, 25.0) url:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", user.fbid]];
        [self addSubview:picture];
        
        UITextField *commentField = [[UITextField alloc] initWithFrame:CGRectMake(25.0, 0, 295.0, 25.0)];
        [self addSubview:commentField];
        commentField.delegate = self;
        self.commentField = commentField;
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.commentField) {
        if (textField.text.length > 0) {
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
            [data setObject:[NSString stringWithFormat:@"%d", self.item.id] forKey:@"item_id"];
            [data setObject:self.commentField.text forKey:@"comment"];
            [GBAPI call:@"comment.create" data:data callback:^(NSDictionary *data) {
                if ([((id)self.delegate) respondsToSelector:@selector(commentBoxCommentAdded:)]) {
                    [self.delegate commentBoxCommentAdded:[[data objectForKey:@"response"] objectForKey:@"comment"]];
                }
            }];
        }
    }
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
