//
//  GBItemService.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBAPI.h"
#import "GBItemService.h"

@interface GBItemService()
@property (nonatomic, strong) NSMutableDictionary *cacheDict;
@end
static GBItemService * _instance;

@implementation GBItemService
+ (GBItemService *)singleton {
    if (_instance == nil) {
        _instance = [[GBItemService alloc] init];
    }
    return _instance;
}

- (void)getHomeItems:(NSInteger)offset callback:(void (^)(NSArray *))callback {
    [GBAPI call:@"item.get_home_items" data:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%d",offset] forKey:@"offset"] callback:^(NSDictionary * data) {
        if (data && [data objectForKey:@"response"] && [[data objectForKey:@"response"] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = [data objectForKey:@"response"];
            callback([response objectForKey:@"items"]);
            
        }
    }];
}

- (void)cache:(GBItem *)item {
    [self.cacheDict setObject:item forKey:[NSNumber numberWithInteger:item.id]];
}

- (GBItem *)get:(NSInteger)id{
    return [self.cacheDict objectForKey:[NSNumber numberWithInteger:id]];
}
@end
