//
//  ViewController.m
//  locationReminders
//
//  Created by Jessica Malesh on 7/25/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@import MapKit;

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *firstLocationButtonSelected;
@property (weak, nonatomic) IBOutlet UIButton *secondLocationButtonSelected;
@property (weak, nonatomic) IBOutlet UIButton *thirdLocationButtonSelected;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self requestPermissions];
    [self.mapView.layer setCornerRadius:20.0];
    
    
    
    
    //demo : how to save objects
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    
//    testObject[@"foo"] = @"bar";
//    
//    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        
//        NSLog(@"Succeeded: %i Error: %@", succeeded, error);
//        
//    }];
  
    //demo : how to query on an object
    
//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        
//        if (!error) {
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"Objects: %@", objects);
//            }];
//        };
//    }];
    
}



- (void)requestPermissions
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
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6320, -122.3519);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.00, 500.00);
    
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
    pin.coordinate = coordinate;
    pin.title = @"Adam's Pin";
    [self.mapView addAnnotation: pin];
   
}
- (IBAction)secondLocationButtonSelected:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.5082675, -122.265815);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.00, 500.00);
    
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc]init];
    pin2.coordinate = coordinate;
    pin2.title = @"Home Pin";
    [self.mapView addAnnotation: pin2];
}
- (IBAction)thirdLocationButtonSelected:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6197047, -122.3455894);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.00, 500.00);
    
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
    pin.coordinate = coordinate;
    pin.title = @"School Pin";
    [self.mapView addAnnotation: pin];
}

@end
