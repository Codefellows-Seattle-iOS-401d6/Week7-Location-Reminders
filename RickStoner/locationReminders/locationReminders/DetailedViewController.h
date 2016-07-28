//
//  DetailedViewController.h
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

typedef void(^DetailedViewControllerCompletion)(MKCircle *circle);

@interface DetailedViewController : UIViewController


@property(copy, nonatomic)DetailedViewControllerCompletion completion;
@property(nonatomic)CLLocationCoordinate2D coordinate;
@property(strong, nonatomic)NSString *annotationTitle;

@end
