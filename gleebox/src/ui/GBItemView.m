//
//  GBItemView.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBItemView.h"
#import "GBURLImageView.h"

@interface GBItemView() <NSURLConnectionDelegate>
@property (nonatomic, strong) UIImageView *thumbnail;
@end

@implementation GBItemView

- (id)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(0, 0, 100, 100);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithItem:(GBItem *)item {
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self) {
        self.item = item;
        self.thumbnail = [[GBURLImageView alloc] initWithFrame:self.frame url:item.pictures ? [NSString stringWithFormat:@"http://s3.amazonaws.com/gleebox_items/%@", item.pictures[0]] : @"http://i.imgur.com/Ikgoj.jpg"];
        [self addSubview:self.thumbnail];
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([(id)self.delegate respondsToSelector:@selector(itemViewDidPress:)]) {
        [self.delegate itemViewDidPress:self];
    }
    NSLog(@"%d", self.item.id);
}
                            

@end
