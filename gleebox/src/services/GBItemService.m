//
//  GBItemService.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBAPI.h"
#import "GBLocationManager.h"
#import "GBUserService.h"
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
    //[[GBLocationManager singleton] getLocation:^(CLLocation *location) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:[NSString stringWithFormat:@"%d", offset] forKey:@"offset"];
      //  [dict setObject:[NSString stringWithFormat:@"%f", location.coordinate.longitude] forKey:@"longitude"];
       // [dict setObject:[NSString stringWithFormat:@"%f", location.coordinate.latitude] forKey:@"latitude"];
        
        [GBAPI call:@"item.get_home_items" data:dict callback:^(NSDictionary * data) {
        if (data && [data objectForKey:@"response"] && [[data objectForKey:@"response"] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = [data objectForKey:@"response"];
            callback([response objectForKey:@"items"]);
            
        }
    //}];
    }];
}

- (void)gotItem:(GBItem *)item {
    
}

- (void)favItem:(GBItem *)item {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSString stringWithFormat:@"%@", item.id] forKey:@"item_id"];
    [dict setObject:@"1" forKey:@"fav"];
    
    
    [GBAPI call:@"item.fav" data:dict callback:^(NSDictionary * data) {
        item.fav = YES;
        [[GBUserService singleton].favs addObject:item.id];
    }];
}

- (void)unfavItem:(GBItem *)item {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSString stringWithFormat:@"%@", item.id] forKey:@"item_id"];
    [dict setObject:@"0" forKey:@"fav"];
    
    
    [GBAPI call:@"item.fav" data:dict callback:^(NSDictionary * data) {
        item.fav = NO;
        [[GBUserService singleton].favs removeObject:item.id];
    }];
}

- (void)cache:(GBItem *)item {
    [self.cacheDict setObject:item forKey:item.id];
}

- (GBItem *)get:(NSNumber *)id{
    return [self.cacheDict objectForKey:id];
}
@end
