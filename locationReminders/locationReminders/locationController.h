//
//  locationController.h
//  locationReminders
//
//  Created by Erin Roby on 7/26/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@protocol LocationControllerDelegate <NSObject>

-(void)LocationControllerDidUpdateLocation:(CLLocation *)location;

@end

@interface LocationController : NSObject

@property(strong, nonatomic) CLLocationManager *locationManager;
@property(strong, nonatomic) CLLocation *location;
@property(weak, nonatomic) id delegate; // any object could be the delegate!

+(LocationController *)sharedController;

@end
