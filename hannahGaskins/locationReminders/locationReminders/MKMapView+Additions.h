//
//  MKMapView+Additions.h
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (Additions)

- (void)longPressAnnotationDrop:(UILongPressGestureRecognizer *)sender;
- (void)dropMultiplePins;

@end
