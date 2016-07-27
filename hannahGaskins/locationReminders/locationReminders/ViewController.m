//
//  ViewController.m
//  locationReminders
//
//  Created by hannah gaskins on 7/25/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "NSMutableArray+Additions.h"
@import MapKit;

@interface ViewController ()

@property(strong, nonatomic) CLLocationManager *locationManager;
@property(strong, nonatomic) NSMutableArray *stack;
@property(strong, nonatomic) NSMutableArray *queue;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)firstLocationButtonPressed:(id)sender;
- (IBAction)seondLocationButtonPressed:(id)sender;
- (IBAction)thirdLocationButtonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // tesing stack and queue
    self.stack = [[NSMutableArray alloc]init];
    self.queue = [[NSMutableArray alloc]init];
    NSNumber *one = [NSNumber numberWithInt:1];
    NSNumber *two = [NSNumber numberWithInt:2];
    NSNumber *three = [NSNumber numberWithInt:3];

    [self.stack push: one];
    [self.queue push: one];
    [self.stack push: two];
    [self.queue push: two];
    [self.stack push: three];
    [self.queue push: three];
    
    [self.stack popStack];
    [self.queue popQ];
    
    NSLog(@"stack: %@", self.stack);
    NSLog(@"queue: %@", self.queue);
    
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
