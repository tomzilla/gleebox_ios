//
//  GBAPI.h
//  gleebox
//
//  Created by tom on 12/18/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBAPI : NSObject
+ (void)auth:(NSString *)authToken callback:(void (^)(void))block;
+ (void)fbLogin:(NSString *)fbToken callback:(void (^)(void))block;
+ (void)call:(NSString *)api data:(NSDictionary *)data callback:(void (^)(NSDictionary*))block;
@end
