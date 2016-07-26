//
//  LocationController.h
//  locationReminders
//
//  Created by Derek Graham on 7/26/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@protocol LocationControllerDelegate <NSObject>

-(void)locationControllerDidUpdateLocation: (CLLocation *)location;

@end




@interface LocationController : NSObject

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *location;

@property (strong, nonatomic) id delegate;

+(LocationController *)sharedController;

@end
