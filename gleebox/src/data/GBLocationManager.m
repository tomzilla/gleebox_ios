//
//  GBLocationManager.m
//  gleebox
//
//  Created by tom on 12/26/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBLocationManager.h"
#import <CoreLocation/CoreLocation.h>
static GBLocationManager *_instance;

@interface GBLocationManager () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, copy) void(^locationCallback)(CLLocation *);
@property (nonatomic, strong) NSMutableArray *locationCallbacks;
@end
@implementation GBLocationManager
+ (GBLocationManager *)singleton {
    if (!_instance) {
        _instance = [[GBLocationManager alloc] init];
    }
    return _instance;
}
- (id)init {
    self = [super init];
    if (self) {
        self.locationCallbacks = [NSMutableArray array];
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager setDistanceFilter:100];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    return self;
}

- (void)getLocation:(void(^)(CLLocation *))callback {
    if (self.currentLocation) {
        callback(self.currentLocation);
    } else {
        [self.locationCallbacks addObject:callback];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)forceGetLocation:(void(^)(CLLocation *))callback {
    [self.locationCallbacks addObject:callback];
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self.locationCallbacks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ((void(^)(CLLocation *))obj)(newLocation);
    }];
    self.currentLocation = newLocation;
    [self.locationCallbacks removeAllObjects];
}

@end
