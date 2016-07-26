//
//  DetailViewController.h
//  locationReminders
//
//  Created by Jessica Malesh on 7/26/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@import MapKit;

@interface DetailViewController : UIViewController

@property (strong, nonatomic)NSString *annotationTitle;
@property (nonatomic)CLLocationCoordinate2D coordinate; //not a pointer but a struct


@end
