//
//  GBCommentBox.h
//  gleebox
//
//  Created by tom on 12/28/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBItem.h"

@protocol GBCommentBoxDelegate;

@interface GBCommentBox : UIView

@property (nonatomic, weak) id<GBCommentBoxDelegate> delegate;
- (id)initWithFrame:(CGRect)frame item:(GBItem *)item;

@end

@protocol GBCommentBoxDelegate
@optional
- (void)commentBoxCommentAdded:(NSDictionary *)comment;
@end
