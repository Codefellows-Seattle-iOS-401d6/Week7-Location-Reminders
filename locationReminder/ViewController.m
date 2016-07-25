//
//  ViewController.m
//  locationReminder
//
//  Created by Sean Champagne on 7/25/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@import MapKit;

@interface ViewController ()

@property(strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)firstLocationButtonPressed:(id)sender;
- (IBAction)secondLocationButtonPressed:(id)sender;
- (IBAction)thirdLocationButtonPressed:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    
//    testObject[@"foo"] = @"bar";
//    
//    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"Succeeded: %i, Error: %@", succeeded, error);
//        
//    }];
    
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error)
        {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                NSLog(@"Objects: %@", objects);
            }];
        }
    }];
    
    [self requestPermissions];
    [self.mapView.layer setCornerRadius:20.0];
    
}

-(void)requestPermissions
{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    
    [self.locationManager requestAlwaysAuthorization];
    [self.mapView setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstLocationButtonPressed:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.35109699999998);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.00, 500.00);
    
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)secondLocationButtonPressed:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6039, -122.3298);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.00, 500.00);
    
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)thirdLocationButtonPressed:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6320, -122.3519);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.00, 500.00);
    
    [self.mapView setRegion:region animated:YES];
}
@end
