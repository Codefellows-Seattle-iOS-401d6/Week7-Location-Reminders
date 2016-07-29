//
//  DetailViewController.h
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

// creates circle that is returned to VC. return type is void bc a callback
typedef void(^DetailViewControllerCompletion)(MKCircle *circle);

@interface DetailViewController : UIViewController

@property(strong, nonatomic) NSString *annotationTitle;
@property(nonatomic) CLLocationCoordinate2D coordinate; //does not need pointer or strong bc it is struct

@property(copy, nonatomic) DetailViewControllerCompletion completion;

@end
