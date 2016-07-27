//
//  DetailViewController.h
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;


@end
