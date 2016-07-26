//
//  LocationController.h
//  locationReminders
//
//  Created by Jessica Malesh on 7/26/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@protocol LocationControllerDelegate <NSObject>

- (void)locationControllerDidUpdateLocation: (CLLocation *)location;

@end






@interface LocationController : NSObject

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (weak, nonatomic) id delegate;

+ (LocationController *)sharedController;


@end
