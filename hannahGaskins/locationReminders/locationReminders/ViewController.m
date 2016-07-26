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
#import "LocationController.h"
#import "DetailViewController.h"
#import "MKMapView+Additions.h"


@import MapKit;

@interface ViewController () <MKMapViewDelegate, LocationControllerDelegate>

@property(strong, nonatomic) NSMutableArray *stack;
@property(strong, nonatomic) NSMutableArray *queue;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)firstLocationButtonPressed:(id)sender;
- (IBAction)seondLocationButtonPressed:(id)sender;
- (IBAction)thirdLocationButtonPressed:(id)sender;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender;

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
    
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setDelegate:self];
    [self.mapView dropMultiplePins];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[LocationController sharedController] setDelegate:self];
    // liz tells hot dog guy on the way to work to fire up the grill
    [[[LocationController sharedController]locationManager]startUpdatingLocation];
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

- (IBAction)seondLocationButtonPressed:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-21.2862774, 55.5108482);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)thirdLocationButtonPressed:(id)sender
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.35109699999998);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    [self.mapView longPressAnnotationDrop:sender];
}

// for 5 annotations

-(void)locationControllerDidUpdateLocation:(CLLocation *)location
{
    // kennith brings liz her hot dog
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 5000) animated:YES];
}


#pragma MARK MapViewDelegate

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // if the annotation is the user's location leave it alone
    if ([annotation isKindOfClass:[MKUserLocation class]]) { return nil; }
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"]; // cast as mkpinannotationview
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }
    
    // random color gen
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.8];
    
    annotationView.pinTintColor = color;
    annotationView.canShowCallout = YES;
    
    UIButton *rightCalloutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightCalloutButton;
    
    return annotationView;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        // check what class the sender is from
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            MKAnnotationView *annotationView = (MKAnnotationView *)sender; // casting the class and storing in the annotationView
            DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;// reference to destination which is DVC
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
        }
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"DetailViewController" sender:view];
}




@end
