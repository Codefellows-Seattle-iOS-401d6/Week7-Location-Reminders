//
//  ViewController.m
//  locationReminders
//
//  Created by Rick  on 7/25/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "ViewController.h"
@import MapKit;
@import Parse;

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)locationOneButtonSelected:(UIButton *)sender;
- (IBAction)locationTwoButtonSelected:(UIButton *)sender;
- (IBAction)locationThreeButtonSelected:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestPermissions];
    [self saveToParse];
    self.mapView.mapType = MKMapTypeSatellite;
    [self.mapView setMapType: self.mapView.mapType];
    [self.mapView.layer setCornerRadius:20.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestPermissions{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
}

- (void)saveToParse{
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"food"] = @"bar";
    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"Saved successfully");
        }
    }];
}


- (IBAction)locationOneButtonSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6205, -122.3493);
    MKCoordinateRegion region= MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)locationTwoButtonSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(33.8121, -117.9190);
    MKCoordinateRegion region= MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)locationThreeButtonSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.6892, -74.0445);
    MKCoordinateRegion region= MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}
@end
