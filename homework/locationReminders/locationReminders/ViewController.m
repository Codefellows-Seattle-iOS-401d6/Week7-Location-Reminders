//
//  ViewController.m
//  locationReminders
//
//  Created by Sung Kim on 7/25/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "Queue.h"
#import "Stack.h"

@import MapKit;

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)firstLocationButtonPressed:(UIButton *)sender;
- (IBAction)secondLocationButtonPressed:(UIButton *)sender;
- (IBAction)thirdLocationButtonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"Succeeded: %i, Error: %@", succeeded, error);
//    }];
    
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                NSLog(@"Objects: %@", objects);
            }];
        }
    }];
    
    [self requestPermissions];
    [self.mapView.layer setCornerRadius:20.0];
    
    Queue *queue = [[Queue alloc]init];
    [queue enqueue:[NSNumber numberWithInt:1]];
    [queue enqueue:[NSNumber numberWithInt:2]];
    [queue enqueue:[NSNumber numberWithInt:3]];
    [queue enqueue:[NSNumber numberWithInt:4]];
    [queue enqueue:[NSNumber numberWithInt:5]];
    [queue print];
    NSNumber *value = [queue dequeue];
    NSLog(@"Dequeued value: %@", value);
    [queue print];
    
    Stack *stack = [[Stack alloc]init];
    [stack push: [NSNumber numberWithInt:10]];
    [stack push: [NSNumber numberWithInt:20]];
    [stack push: [NSNumber numberWithInt:30]];
    [stack push: [NSNumber numberWithInt:40]];
    [stack push: [NSNumber numberWithInt:50]];
    [stack print];
    NSNumber *stackValue = [stack pop];
    NSLog(@"Popped value: %@", stackValue);
    [stack print];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)requestPermissions
{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
    
}

- (IBAction)firstLocationButtonPressed:(UIButton *)sender
{
    //These objects are structs so we don't need the * pointer
    //location of Ikea
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.35109699999998);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)secondLocationButtonPressed:(UIButton *)sender {
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(13.4443, 144.7937);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
    
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)thirdLocationButtonPressed:(UIButton *)sender {
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(21.2850, -157.8357);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
    
    [self.mapView setRegion:region animated:YES];
}
@end
