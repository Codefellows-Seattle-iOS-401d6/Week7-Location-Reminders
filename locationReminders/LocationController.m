//
//  LocationController.m
//  locationReminders
//
//  Created by Derek Graham on 7/26/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "LocationController.h"
@import CoreLocation;

@interface LocationController  () <CLLocationManagerDelegate>

@end

@implementation LocationController

//Typical Singleton pattern
+(LocationController *)sharedController{
    static LocationController *sharedController = nil; // static defines class object vs instance
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[LocationController alloc]init];
        
    });
    return sharedController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100;
        
        [_locationManager requestAlwaysAuthorization];
        
    }
    return self;
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.delegate locationControllerDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}
@end
