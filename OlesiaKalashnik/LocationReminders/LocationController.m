//
//  LocationController.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "LocationController.h"
@import UIKit;

@interface LocationController () <CLLocationManagerDelegate>

@end

@implementation LocationController
+(LocationController *)sharedController {
    static LocationController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[LocationController alloc] init];
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
    [self.delegate locationControllerDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"User entered region");
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.alertTitle = @"You've entered THE REGION";
    notification.alertBody = @"Remember what you forgot now";
    
    [[UIApplication sharedApplication]presentLocalNotificationNow:notification];
}

@end
