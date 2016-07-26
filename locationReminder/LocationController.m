//
//  LocationController.m
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "LocationController.h"

@interface LocationController ()<CLLocationManagerDelegate>

@end

@implementation LocationController


//boiler plate singleton
+(LocationController *)sharedController
{
    static LocationController *sharedController = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedController = [[LocationController alloc]init];

    });
    
    return sharedController;
}
//boilder plate initializer for CLLocation
-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100;
    }
    
    [_locationManager requestAlwaysAuthorization];
    
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    [self.delegate locationControllerDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}

@end
