//
//  GBContainerView.m
//  gleebox
//
//  Created by tom on 12/25/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBContainerView.h"

@implementation GBContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    __block float lowestY = 0;
    [[self subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *view = (UIView *)obj;
        float y = view.frame.origin.y + view.frame.size.height;
        if (y > lowestY) {
            lowestY = y;
        }
    }];
    return CGSizeMake(size.width, lowestY);
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
