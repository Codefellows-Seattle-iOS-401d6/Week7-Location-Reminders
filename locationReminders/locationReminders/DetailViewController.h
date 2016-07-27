//
//  DetailViewController.h
//  locationReminders
//
//  Created by Derek Graham on 7/26/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate; // not strong with struct

@end
