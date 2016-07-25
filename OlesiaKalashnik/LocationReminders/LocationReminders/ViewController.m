//
//  ViewController.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
@import MapKit;

@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSNumber *locationId;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)location2ButtonSelected:(UIButton *)sender;
- (IBAction)location1ButtonSelected:(UIButton *)sender;
- (IBAction)location3ButtonSelected:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestPermission];
    [self.mapView.layer setCornerRadius:20.0];
    
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

-(void)requestPermission {
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
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

@end
