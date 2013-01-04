//
//  GBItem.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBItem.h"
#import "GBItemService.h"
#import "GBUserService.h"

@implementation GBItem
- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.title = [data objectForKey:@"title"];
        if ([data objectForKey:@"pictures"] && [(NSArray *)[data objectForKey:@"pictures"] count]) {
            self.pictures = [data objectForKey:@"pictures"];
        }
        self.id = [NSNumber numberWithInteger:[[data valueForKey:@"id"] integerValue]];
        self.fav = [[GBUserService singleton].favs indexOfObject:self.id] != NSNotFound;
        [[GBItemService singleton] cache:self];
    }
    return self;
}
@end
