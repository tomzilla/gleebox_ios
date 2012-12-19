//
//  GBUserService.h
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBUserService : NSObject

+ (GBUserService *)singleton;
@end

@interface GBUser : NSObject
@property (strong, nonatomic) NSString *fbid;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *authToken;
@end