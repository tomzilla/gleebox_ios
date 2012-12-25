//
//  GBItem.h
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *pictures;
@property (nonatomic, assign) NSUInteger id;

- (id)initWithData:(NSDictionary *)data;

@end
