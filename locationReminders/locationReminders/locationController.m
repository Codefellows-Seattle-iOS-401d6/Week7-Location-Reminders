//
//  locationController.m
//  locationReminders
//
//  Created by Erin Roby on 7/26/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "locationController.h"
@import UIKit;

@interface LocationController ()<CLLocationManagerDelegate>

@end

@implementation LocationController

+(LocationController *)sharedController {
    static LocationController *sharedController = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[LocationController alloc]init];
    });
    
    return sharedController;
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100;
    }
    
    [_locationManager requestAlwaysAuthorization];
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.delegate LocationControllerDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"User Did Enter Region.");
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.alertTitle = @"You have entered the alert region!";
    notification.alertBody = @"Beware of the matrix 💊.";
    
    [[UIApplication sharedApplication]presentLocalNotificationNow:notification];
}

@end













