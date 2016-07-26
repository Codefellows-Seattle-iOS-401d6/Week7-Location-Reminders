//
//  ViewController.m
//  locationReminders
//
//  Created by hannah gaskins on 7/25/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
@import MapKit;

@interface ViewController ()

@property(strong, nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)firstLocationButtonPressed:(id)sender;
- (IBAction)seondLocationButtonPressed:(id)sender;
- (IBAction)thirdLocationButtonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"Succeeded:%i, Error:%@", succeeded, error);
//    }];
    
    
    [self requestPermissions];
    [self.mapView.layer setCornerRadius:20.0];
    
    
}



-(void)requestPermissions
{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)firstLocationButtonPressed:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.35109699999998);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)seondLocationButtonPressed:(id)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-21.2862774, 55.5108482);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)thirdLocationButtonPressed:(id)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.35109699999998);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}
@end
