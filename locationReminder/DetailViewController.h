//
//  DetailViewController.h
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <UIKit/UIKit.h>

@import MapKit;

@interface DetailViewController : UIViewController

@property(strong, nonatomic)NSString *annotationTitle;
@property(nonatomic)CLLocationCoordinate2D coordinate; //this is a struct, not a pointer, no strong and no *

@end
