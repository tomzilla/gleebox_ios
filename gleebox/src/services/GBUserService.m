//
//  GBUserService.m
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBAPI.h"
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
- (void)fbLogin:(NSString *)accessToken {
    [GBAPI call:@"account.fb_login" data:[NSDictionary dictionaryWithObject:accessToken forKey:@"fb_token"] callback:^(NSDictionary *data) {
        NSDictionary *userData = [[data objectForKey:@"response"] objectForKey:@"user"];
        self.user = [[GBUser alloc] init];
        self.user.fbid = [userData objectForKey:@"fbid"];
        self.user.userId = [userData objectForKey:@"id"];
        self.user.authToken = [userData objectForKey:@"token"];
        if ([(id)self.loginDelegate respondsToSelector:@selector(didLogin:)]) {
            [self.loginDelegate didLogin:self.user];
        }
    }];
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