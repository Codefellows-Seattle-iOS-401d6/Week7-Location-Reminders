//
//  ViewController.m
//  locationReminder
//
//  Created by Sean Champagne on 7/25/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "ViewController.h"
#import "LocationController.h"
#import "DetailViewController.h"

@interface ViewController () <MKMapViewDelegate, MKAnnotation, LocationManagerDelegate>

//@property(strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) UIColor *pinTintColor;

- (IBAction)firstLocationButtonPressed:(id)sender;
- (IBAction)secondLocationButtonPressed:(id)sender;
- (IBAction)thirdLocationButtonPressed:(id)sender;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender;
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
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        if (!error)
//        {
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"Objects: %@", objects);
//            }];
//        }
//    }];
    
   // [self requestPermissions];
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
    
    
    
    CLLocationCoordinate2D pointOne;
    pointOne.latitude = 47.6320;
    pointOne.longitude = -122.3519;
    
    CLLocationCoordinate2D pointTwo;
    pointTwo.latitude = 47.6556;
    pointTwo.longitude = -122.4103;
    
    CLLocationCoordinate2D pointThree;
    pointThree.latitude = 47.6510;
    pointThree.longitude = -122.3473;
    
    CLLocationCoordinate2D pointFour;
    pointFour.latitude = 47.6205;
    pointFour.longitude = -122.3493;
    
    CLLocationCoordinate2D pointFive;
    pointFive.latitude = 47.5755;
    pointFive.longitude = -122.4107;
    
    MKPointAnnotation *newPointOne = [[MKPointAnnotation alloc]init];
    newPointOne.coordinate = pointOne;
    newPointOne.title = @"Queen Anne High School";
    
    MKPointAnnotation *newPointTwo = [[MKPointAnnotation alloc]init];
    newPointTwo.coordinate = pointTwo;
    newPointTwo.title = @"Discovery Park";
    
    MKPointAnnotation *newPointThree = [[MKPointAnnotation alloc]init];
    newPointThree.coordinate = pointThree;
    newPointThree.title = @"Fremont Troll";
    
    MKPointAnnotation *newPointFour = [[MKPointAnnotation alloc]init];
    newPointFour.coordinate = pointFour;
    newPointFour.title = @"Space Needle";
    
    MKPointAnnotation *newPointFive = [[MKPointAnnotation alloc]init];
    newPointFive.coordinate = pointFive;
    newPointFive.title = @"Alki Point";
    
    [self.mapView addAnnotation:newPointOne];
    [self.mapView addAnnotation:newPointTwo];
    [self.mapView addAnnotation:newPointThree];
    [self.mapView addAnnotation:newPointFour];
    [self.mapView addAnnotation:newPointFive];
    
}

-(UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[LocationController sharedController]setDelegate:self];
    [[[LocationController sharedController]locationManager]startUpdatingLocation];
    
}


//-(void)requestPermissions
//{
//    [self setLocationManager:[[CLLocationManager alloc]init]];
//    
//    [self.locationManager requestAlwaysAuthorization];
//    [self.mapView setShowsUserLocation:YES];
//}

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

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        CGPoint touchPoint = [sender locationInView:self.mapView];
        
        CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = touchMapCoordinate;
        newPoint.title = @"new Location";
        
        [self.mapView addAnnotation:newPoint];
        
    }
}

-(void)locationControllerDidUpdateLocation:(CLLocation *)location
{
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0) animated:YES];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) { return nil; }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }
    
    annotationView.canShowCallout = YES;
    
    UIButton *rightcalloutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    annotationView.rightCalloutAccessoryView = rightcalloutButton;
    
    return annotationView;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewController"])
    {
        if ([sender isKindOfClass:[MKAnnotationView class]])
        {
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            
            DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
            
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
