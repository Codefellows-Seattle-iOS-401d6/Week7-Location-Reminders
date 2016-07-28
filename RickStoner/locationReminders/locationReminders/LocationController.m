//
//  LocationController.m
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "LocationController.h"
@import UIKit;
#import "Reminder.h"

@interface LocationController () <CLLocationManagerDelegate>


@end


@implementation LocationController

+ (LocationController *) sharedController {
    static LocationController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[LocationController alloc]init];
    });
    return sharedController;
}

- (instancetype)init {
    self = [super init];
    
    if (self){
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100.0;
    }
    
    [_locationManager requestAlwaysAuthorization];
    return self;
}

#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.delegate locationControllerDelegateDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.alertTitle = @"You hit your location";
    notification.alertBody = @"It's time to complete your task";
    
    [[UIApplication sharedApplication]presentLocalNotificationNow:notification];
}

@end
