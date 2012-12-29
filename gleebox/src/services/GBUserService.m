//
//  GBUserService.m
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBUserService.h"
@interface GBUserService ()


@end


@implementation GBUserService
@synthesize user;
static GBUserService* _instance;

+ (GBUserService *)singleton {
    if (_instance == nil) {
        _instance = [[GBUserService alloc] init];
    }
    return _instance;
}

- (id)init {
    self = [super init];
    if (self) {
        
        self.user = [[GBUser alloc] init];
        [self loadFromDisk];
        
    }
    return self;
}

- (void)loadFromDisk {
    [[NSUserDefaults standardUserDefaults] setObject:self.user.authToken forKey:@"authToken"];
}

- (void)createUserFromData:(NSDictionary *)data {
    
}

- (void)saveToDisk {
    
}

@end

@implementation GBUser
@synthesize fbid, userId, authToken;
@end