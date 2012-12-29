//
//  GBLoginDelegate.h
//  gleebox
//
//  Created by tom on 12/29/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GBUser;

@protocol GBLoginDelegate <NSObject>
@required
- (void)didLogin:(GBUser *)user;
- (void)didLogout;
@end
