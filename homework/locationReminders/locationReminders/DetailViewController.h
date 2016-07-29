//
//  DetailViewController.h
//  locationReminders
//
//  Created by Sung Kim on 7/26/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;


typedef void(^DetailViewControllerCompletion)(MKCircle *circle);

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (copy, nonatomic)DetailViewControllerCompletion completion;


@end
