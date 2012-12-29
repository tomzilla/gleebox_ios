//
//  GBUserService.h
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBLoginDelegate.h"

@interface GBUser : NSObject
@property (strong, nonatomic) NSString *fbid;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *authToken;
@end

@interface GBUserService : NSObject
@property (nonatomic, strong) GBUser *user;
@property (nonatomic, weak) id<GBLoginDelegate> loginDelegate;

+ (GBUserService *)singleton;
- (void)fbLogin:(NSString *)accessToken;
@end

