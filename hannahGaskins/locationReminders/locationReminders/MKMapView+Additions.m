//
//  MKMapView+Additions.m
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "MKMapView+Additions.h"

@implementation MKMapView (Additions)


- (void)longPressAnnotationDrop:(UILongPressGestureRecognizer *)sender;
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint touchPoint = [sender locationInView:self]; // reference to point that they touched on
        CLLocationCoordinate2D touchMapCoordinate = [self convertPoint:touchPoint toCoordinateFromView:self]; // create 2d coordinate with map location coordinates from touch point
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = touchMapCoordinate;
        
        newPoint.title = @"new location";
        
        [self addAnnotation:newPoint];
    }
}

- (void)dropMultiplePins;
{
    
    NSMutableArray *dropMultiplePins = [[NSMutableArray alloc]init];
    
    CLLocationCoordinate2D firstLocation = CLLocationCoordinate2DMake(42.4347181, -84.0025096);
    CLLocationCoordinate2D secondLocation = CLLocationCoordinate2DMake(37.1867184, -88.9966002);
    CLLocationCoordinate2D thirdLocation = CLLocationCoordinate2DMake(30.8524992, -85.0851448);
    CLLocationCoordinate2D fourthLocation = CLLocationCoordinate2DMake(41.4132646, -122.4126938);
    CLLocationCoordinate2D fifthLocation = CLLocationCoordinate2DMake(45.4323688, -122.3837474);
    
    MKPointAnnotation *firstPoint = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *secondPoint = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *thirdPoint = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *fourthPoint = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *fifthPoint = [[MKPointAnnotation alloc]init];

    firstPoint.coordinate = firstLocation;
    firstPoint.title = @"firstPoint";
    secondPoint.coordinate = secondLocation;
    thirdPoint.coordinate = thirdLocation;
    fourthPoint.coordinate = fourthLocation;
    fifthPoint.coordinate = fifthLocation;
    
    firstPoint.title = @"firstPoint";
    secondPoint.title = @"secondPoint";
    thirdPoint.title = @"thirdPoint";
    fourthPoint.title = @"fourthPoint";
    fifthPoint.title = @"fifthPoint";


    [dropMultiplePins addObject:firstPoint];
    [dropMultiplePins addObject:secondPoint];
    [dropMultiplePins addObject:thirdPoint];
    [dropMultiplePins addObject:fourthPoint];
    [dropMultiplePins addObject:fifthPoint];
    
    [self addAnnotations:dropMultiplePins];
    
}


@end
