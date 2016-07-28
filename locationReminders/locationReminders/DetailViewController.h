//
//  DetailViewController.h
//  locationReminders
//
//  Created by Erin Roby on 7/26/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import MapKit;

typedef void(^DetailViewControllerCompletion)(MKCircle *circle); // this a callback. look back at closures for more.

@interface DetailViewController : UIViewController

@property(strong, nonatomic) NSString *annotationTitle;
@property(nonatomic) CLLocationCoordinate2D coordinate; // This is a struct.
@property(copy, nonatomic) DetailViewControllerCompletion completion; // public because viewcontroller needs it.

@end
