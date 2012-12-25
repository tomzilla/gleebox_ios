//
//  GBItem.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBItem.h"

@implementation GBItem
- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.title = [data objectForKey:@"title"];
        if ([data objectForKey:@"pictures"] && [(NSArray *)[data objectForKey:@"pictures"] count]) {
            self.pictures = [data objectForKey:@"pictures"];
        }
        self.id = [[data valueForKey:@"id"] integerValue];
        
    }
    return self;
}
@end
