//
//  GBURLImageView.h
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GBURLImageView;

@protocol GBUULImageViewDelegate
@optional
- (void)didRenderImage:(GBURLImageView *)image;
@end

@interface GBURLImageView : UIImageView
@property (nonatomic, weak) id<GBUULImageViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame url:(NSString *)url;
- (id)initWithFrame:(CGRect)frame url:(NSString *)url noCrop:(BOOL)noCrop;

@end
