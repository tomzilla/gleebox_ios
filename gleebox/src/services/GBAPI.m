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
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
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
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
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

+ (void)call:(NSString *)api data:(NSDictionary *)data callback:(void (^)(NSDictionary*))block {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://staging.gleebox.com/%@",
                                       [api stringByReplacingOccurrencesOfString:@"." withString:@"/"]]];
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [data enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [request setPostValue:obj forKey:key];
    }];
    
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSError *error = [[NSError alloc] init];
        // Use when fetching binary data
        NSData *responseData = [request responseData];
        block([NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error]);
        
    }];
    [request setFailedBlock:^{
    }];
    [request startAsynchronous];

                  
}
@end
