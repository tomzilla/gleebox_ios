//
//  PullToRefreshScrollView.h
//  PullToRefreshScroll
//
//  Created by Joshua Grenon on 2/21/11.
//  Copyright 2011 Josh Grenon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GBPullToRefreshScrollViewDelegate;

@interface GBPullToRefreshScrollView : UIScrollView<UIScrollViewDelegate> {
    
	UIView *refreshHeaderView;
    UILabel *refreshLabel;
    UIImageView *refreshArrow;
    UIActivityIndicatorView *refreshSpinner;
    BOOL isDragging;
    BOOL isLoading;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
}

@property (nonatomic, retain) UIView *refreshHeaderView;
@property (nonatomic, retain) UILabel *refreshLabel;
@property (nonatomic, retain) UIImageView *refreshArrow;
@property (nonatomic, retain) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, copy) NSString *textPull;
@property (nonatomic, copy) NSString *textRelease;
@property (nonatomic, copy) NSString *textLoading;
@property (nonatomic, weak) id <GBPullToRefreshScrollViewDelegate> delegate1;

-(void)startLoading;
-(void)stopLoading;
-(void)refresh;

@end

@protocol GBPullToRefreshScrollViewDelegate

-(void)refreshScrollView;

@end