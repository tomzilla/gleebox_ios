//
//  GBItemView.h
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBView.h"
#import "GBItem.h"
@class GBItemView;

@protocol GBItemViewDelegate
@optional
- (void)itemViewDidPress:(GBItemView *)itemView;
@end
@interface GBItemView : GBView
@property (nonatomic, strong) GBItem *item;
@property (nonatomic, weak) id<GBItemViewDelegate> delegate;
- (id)initWithItem:(GBItem *)item;
@end
