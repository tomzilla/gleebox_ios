//
//  GBCommentView.m
//  gleebox
//
//  Created by tom on 12/25/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBCommentView.h"
#import "GBURLImageView.h"

@interface GBCommentView ()
@property (nonatomic, strong) NSDictionary *data;
@end
@implementation GBCommentView

- (id)initWithFrame:(CGRect)frame data:(NSDictionary *)comment {
    self = [super initWithFrame:frame];
    if (self) {
        self.data = comment;
        GBURLImageView *picture = [[GBURLImageView alloc] initWithFrame:CGRectMake(0, 0, 25.0, 25.0) url:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", [[self.data objectForKey:@"user"] objectForKey:@"fbid"]]] ;
        [self addSubview:picture];
        UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.0, 0, 295, 25)];
        commentLabel.text = [comment objectForKey:@"comment"];
        commentLabel.numberOfLines = 0;
        [commentLabel sizeToFit];
        [self addSubview:commentLabel];
        float h = MAX(commentLabel.frame.size.height, 25.0);
        CGRect frame = self.frame;
        frame.size.height = h;
        self.frame = frame;
    }
    return self;
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
