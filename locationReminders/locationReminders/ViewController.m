//
//  ViewController.m
//  locationReminders
//
//  Created by Derek Graham on 7/25/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
@import MapKit;

@interface ViewController ()

@property(strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)firstLocationButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    
//    testObject[@"foo" ] = @"bar";
//    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"Succeeded: %i, Error: %@", succeeded,error);
//    }];
//    // 1 sucess, 0 failure
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        if (!error){
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"Objects: %@ ", objects);
//            }];
//        }
//    }];
    
    [self requestPermissions];
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = [[[self.mapView userLocation] location] coordinate];
        point.title = @"My Current Location";
    
        [self.mapView addAnnotation:point];

    
    [self.mapView.layer setCornerRadius: 5.0];
    [self.mapView selectAnnotation:point animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) requestPermissions {
    
    [self setLocationManager: [[CLLocationManager alloc]init]];
   [self.locationManager requestAlwaysAuthorization];
}
- (IBAction)firstLocationButtonPressed:(id)sender {
    self.mapView.showsUserLocation = NO;

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6198243
, -122.3616879);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 50.0, 50.0);
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Adjacent, Against, Upon";
    point.subtitle = @"Myrtle Edwards Park";
    
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:YES];

    [self.mapView setMapType:MKMapTypeHybridFlyover];
//    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setRegion:region animated: YES];
 }
- (IBAction)leftLocationButtonPressed:(id)sender {
    self.mapView.showsUserLocation = NO;

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake( 19.8285206, -155.9925522 );
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 200.0, 200.0);
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Hualalai";
    point.subtitle = @"Excellent Breakfast Buffet";

    [self.mapView setMapType:MKMapTypeSatellite];
    [self.mapView setRegion:region animated: YES];
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:YES];


}
- (IBAction)rightLocationButtonPressed:(id)sender {
    self.mapView.showsUserLocation = NO;

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6510, -122.3473);
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Fremont Troll";
    point.subtitle = @"near the center of the universe.";
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 100.0, 100.0);
    [self.mapView setMapType:MKMapTypeStandard];

    [self.mapView setRegion:region animated: YES];
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:YES];


}
- (IBAction)locateButtonPressed:(id)sender {
    self.mapView.showsUserLocation = YES;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = userLocation.coordinate;
//    point.title = @"Derek Graham";
//    [self.mapView addAnnotation:point];
//
//    [self.mapView selectAnnotation:point animated:YES];

    
}

@end
