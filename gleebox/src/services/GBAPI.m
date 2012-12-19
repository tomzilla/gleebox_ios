//
//  GBAPI.m
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBAPI.h"
#import "ASIFormDataRequest.h"

@implementation GBAPI
+ (void)auth:(NSString *)authToken callback:(void (^)(void))block {
    NSURL *url = [NSURL URLWithString:@"http://staging.gleebox.com/account/get"];
    __block ASIFormDataRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setPostValue:authToken forKey:@"token"];
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString *responseString = [request responseString];
        
        // Use when fetching binary data
        NSData *responseData = [request responseData];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    [request startAsynchronous];

}
+ (void)fbLogin:(NSString *)fbToken callback:(void (^)(void))block {
    NSURL *url = [NSURL URLWithString:@"http://staging.gleebox.com/account/fb_login"];
    __block ASIFormDataRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setPostValue:fbToken forKey:@"fb_token"];
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString *responseString = [request responseString];
        
        // Use when fetching binary data
        NSData *responseData = [request responseData];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    [request startAsynchronous];
    
}
@end
