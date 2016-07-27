//
//  ViewController.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "LocationController.h"
#import <Parse/Parse.h>
@import MapKit;

@interface ViewController () <MKMapViewDelegate, LocationControllerDelegate>

@property (strong, nonatomic) NSNumber *locationId;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray <MKPointAnnotation *> *defaultPoints;
@property (strong, nonatomic) NSArray <UIColor *> * availableColors;

- (IBAction)location2ButtonSelected:(UIButton *)sender;
- (IBAction)location1ButtonSelected:(UIButton *)sender;
- (IBAction)location3ButtonSelected:(UIButton *)sender;
- (IBAction)handleLongPressGesture:(UILongPressGestureRecognizer *)sender;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView.layer setCornerRadius:20.0];
    [self setDefaultLocations];
    [self setAvailableColors: @[[UIColor blueColor], [UIColor purpleColor], [UIColor greenColor], [UIColor yellowColor], [UIColor redColor]]];
    
    
    // Test Saving object
    //    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //    testObject[@"foo"] = @"bar";
    //    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
    //[[NSOperationQueue mainQueue] addOperationWithBlock:^{
    //        NSLog(@"Succeeded: %i, Error: %@", succeeded, error);
    //           }];
    //    }];
    
    //Test Querying
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                NSLog(@"Objects: %@", objects);
            }];
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [LocationController sharedController].delegate = self;
    [[LocationController sharedController].locationManager startUpdatingLocation];
}

-(void)zoomOutEurope {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(41.9028, 12.4964);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 6000000.0, 6000000.0);
    [self.mapView setRegion:region animated:true];
}
-(void)zoomOutAmerica {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(38.36444, -98.76472);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 6000000.0, 6000000.0);
    [self.mapView setRegion:region animated:true];
}
-(void)zoomOutAsia {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(39.9042, 116.4074);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 9000000.0, 9000000.0);
    [self.mapView setRegion:region animated:true];
}

-(void) setDefaultLocations {
    CLLocationCoordinate2D coordinate1 = CLLocationCoordinate2DMake(47.601997, -122.333838);
    CLLocationCoordinate2D coordinate2 = CLLocationCoordinate2DMake(47.599576, -122.330385);
    CLLocationCoordinate2D coordinate3 = CLLocationCoordinate2DMake(47.606624, -122.332753);
    CLLocationCoordinate2D coordinate4 = CLLocationCoordinate2DMake(47.601063, -122.329486);
    CLLocationCoordinate2D coordinate5 = CLLocationCoordinate2DMake(47.599625, -122.332472);
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc]init ];
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc]init ];
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc]init ];
    MKPointAnnotation *point4 = [[MKPointAnnotation alloc]init ];
    MKPointAnnotation *point5 = [[MKPointAnnotation alloc]init ];
    point1.coordinate = coordinate1;
    point2.coordinate = coordinate2;
    point3.coordinate = coordinate3;
    point4.coordinate = coordinate4;
    point5.coordinate = coordinate5;
    point1.title = @"Pioneer Square Park";
    point2.title = @"Seattle Metropolitan Police Museum";
    point3.title = @"Seattle Central Public Library";
    point4.title = @"Caffé Vita";
    point5.title = @"The London Plane";
    [self setDefaultPoints:(NSMutableArray *) @[point1, point2, point3, point4, point5]];
    for (MKPointAnnotation *point in self.defaultPoints) {
        [self.mapView addAnnotation:point];
    }
}

#pragma - IBActions
- (IBAction)location2ButtonSelected:(UIButton *)sender {
    self.locationId = @2;
    [self zoomOutAmerica];
}

- (IBAction)location1ButtonSelected:(UIButton *)sender {
    self.locationId = @1;
    [self zoomOutEurope];
}

- (IBAction)location3ButtonSelected:(UIButton *)sender {
    self.locationId = @3;
    [self zoomOutAsia];
}

- (IBAction)handleLongPressGesture:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint touchPoint = [sender locationInView:self.mapView];
        CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init ];
        newPoint.coordinate = touchMapCoordinate;
        newPoint.title = @"New Location";
        [self.mapView addAnnotation:newPoint];
    }
}

#pragma - MKMapViewDelegate Methods
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if ([self.locationId  isEqual: @1]) {
        //Kiev
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(50.45, 30.523333), 15000.0, 15000.0) animated:YES];
        //Seattle
    } else if ([self.locationId  isEqual: @2]) {
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.6566674, -122.35109699999998), 15000.0, 15000.0) animated:YES];
        //Sydney
    } else if ([self.locationId  isEqual: @3]) {
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(-33.865143, 151.209900), 15000.0, 15000.0) animated:YES];
    }
    self.locationId = nil;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }
    annotationView.canShowCallout = YES;
    [self randomizePinColorFor:(annotationView)];
    UIButton *rightCalloutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightCalloutButton;
    return annotationView;
}

-(MKPinAnnotationView *)randomizePinColorFor:(MKPinAnnotationView *)annotationView {
    annotationView.pinTintColor = self.availableColors[arc4random_uniform((u_int32_t)self.availableColors.count)];
    return annotationView;
}

#pragma - LocationControllerDelegate Methods
-(void)locationControllerDidUpdateLocation:(CLLocation *)location {
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0) animated: YES];
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self performSegueWithIdentifier:@"DetailViewController" sender:view];
}

#pragma _ Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
            detailVC.annotationTitle = annotationView.annotation.title;
            detailVC.coordinate = annotationView.annotation.coordinate;
        }
    }
}


@end
