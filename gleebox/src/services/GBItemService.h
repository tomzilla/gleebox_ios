//
//  GBItemService.h
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBItem.h"
@interface GBItemService : NSObject

+ (GBItemService *)singleton;
- (void)getHomeItems:(NSInteger)offset callback:(void (^)(NSArray *))callback;
- (void)cache:(GBItem *)item;
- (GBItem *)get:(NSNumber *) id;

@end
