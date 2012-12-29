//
//  GBLocationManager.h
//  gleebox
//
//  Created by tom on 12/26/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface GBLocationManager : NSObject
- (void)getLocation:(void(^)(CLLocation *))callback;

+ (GBLocationManager *)singleton;
@end
