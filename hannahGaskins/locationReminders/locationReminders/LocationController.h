//
//  LocationController.h
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import CoreLocation;

// Delegation pattern: delegate protocol needs to be weak. On ViewController

@protocol LocationControllerDelegate <NSObject> // protocol that allows view controller to be delegate of view controller

-(void)locationControllerDidUpdateLocation:(CLLocation *)location; // method

@end

@interface LocationController : NSObject

@property(strong, nonatomic) CLLocationManager *locationManager; // class lets us know about location updates
@property(strong, nonatomic) CLLocation *location;

@property(weak, nonatomic) id delegate; // define delegate of type id (AnyObject)

+ (LocationController *)sharedController; // lets us access our singleton. declaring the class method in the header file to make it public. 

@end
