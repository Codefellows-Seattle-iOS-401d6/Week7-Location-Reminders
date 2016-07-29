//
//  LocationController.m
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "LocationController.h"

//class extention, our location controller is our location managers delegate
@interface LocationController ()<CLLocationManagerDelegate>

@end

@implementation LocationController

// defineing the behavior of the class method
+ (LocationController *)sharedController
{
    // our singleton
    // static is defining class object (as opposed to instance object)
    static LocationController *sharedController = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc]init];
    });
    return sharedController;
}

// initializer

-(instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self; //we can implement apples location based on CLLOcationManagerDelegate
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100;
    }
    
    [_locationManager requestAlwaysAuthorization];
    
    return self;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [self.delegate locationControllerDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"User did enter region");
    
    // create uilocalNotification object
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    
    // TODO
    notification.alertTitle = @"you have entered the matrix... the red pill";
    notification.alertBody = @"the poké💉Go matrix...";
    
    [[UIApplication sharedApplication]presentLocalNotificationNow:notification];
}

@end
