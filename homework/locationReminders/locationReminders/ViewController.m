//
//  ViewController.m
//  locationReminders
//
//  Created by Sung Kim on 7/25/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "LocationController.h"
#import "DetailViewController.h"
#import "NumberSum.h"
@import ParseUI;
@import MapKit;

@interface ViewController () <MKMapViewDelegate, LocationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)firstLocationButtonPressed:(UIButton *)sender;
- (IBAction)secondLocationButtonPressed:(UIButton *)sender;
- (IBAction)thirdLocationButtonPressed:(UIButton *)sender;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender;

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
    
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
    
    [self login];
    
    //creating an observer for notification
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testObserverFired) name:@"TestNotification" object:nil];

    NumberSum *sumNumbers = [[NumberSum alloc]init];
    [sumNumbers returnSum:@""];
    [sumNumbers returnSum:@"1sfkla2 rew3 dfrewq4"];
    [sumNumbers returnSum:@"fkdjsalkjrwe"];
    [sumNumbers returnSum:@"555"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[LocationController sharedController] setDelegate:self];
    [[[LocationController sharedController]locationManager]startUpdatingLocation];
    [self createAllStaticAnnotations];
    for (MKPointAnnotation *newPoint in self.allLocationAnnotations) {
        [self.mapView addAnnotation:newPoint];
    }
 }
////deallocating the observer
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"TestNotification" object:nil];
//    
//}
////feedback that the notification fired and any actions when the observer receives the notification
//- (void)testObserverFired
//{
//    NSLog(@"Notification Fired");
//    
//}

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

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint touchPoint = [sender locationInView:self.mapView];
        CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = touchMapCoordinate;
        newPoint.title = @"New Location";
        
        [self.mapView addAnnotation:newPoint];
    }
}

- (void)generateAnnotation:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude title:(NSString *)title subtitle:(NSString *)subtitle
{
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
    newPoint.coordinate = center;
    newPoint.title = title;
    newPoint.subtitle = subtitle;
    if (!_allLocationAnnotations) {
        _allLocationAnnotations = [[NSMutableArray alloc]init];
    }
    [self.allLocationAnnotations addObject:newPoint];
}

- (void)createAllStaticAnnotations
{
    [self generateAnnotation:47.6205 longitude:-122.3493 title:@"Space Needle" subtitle:@"Seattle"];
    [self generateAnnotation:47.6198 longitude:-122.3528 title:@"Pacific Science Center" subtitle:@"Seattle"];
    [self generateAnnotation:47.6221 longitude:-122.3540 title:@"Key Arena" subtitle:@"Seattle"];
    [self generateAnnotation:47.6165 longitude:-122.3555 title:@"Olympic Sculpture Park" subtitle:@"Seattle"];
    [self generateAnnotation:47.6194 longitude:-122.3618 title:@"Myrtle Edwards Park" subtitle:@"Seattle"];
}

#pragma mark - LocationControllerDelegate

- (void)locationControllerDidUpdateLocation:(CLLocation *)location
{
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0) animated:YES];
    
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //trying to avoid customizing our user location annotation (the blue pulsating circle indicating current location
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }
    
    annotationView.canShowCallout = YES;
    
    UIButton *rightCalloutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightCalloutButton;
    
    [self colorRandomizer:annotationView];
    
    return annotationView;
}

- (MKPinAnnotationView *)colorRandomizer:(MKPinAnnotationView *)point
{
    point.animatesDrop = YES;
    int randomNumber = arc4random_uniform(5);
    
    switch (randomNumber) {
        case 0:
            point.pinTintColor = [UIColor whiteColor];
            break;
        case 1:
            point.pinTintColor = [UIColor redColor];
            break;
        case 2:
            point.pinTintColor = [UIColor greenColor];
            break;
        case 3:
            point.pinTintColor = [UIColor blueColor];
            break;
        case 4:
            point.pinTintColor = [UIColor blackColor];
            break;
        default:
            break;
    }

    return point;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            
            DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
            
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
            
            __weak typeof(self) weakSelf = self;
            detailViewController.completion = ^(MKCircle *circle){
                
                __strong typeof(weakSelf) strongSelf = weakSelf;

                [strongSelf.mapView removeAnnotation:annotationView.annotation];
                [strongSelf.mapView addOverlay:circle];
            };
        }
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"DetailViewController" sender:view];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc]initWithOverlay:overlay];
    
    circleRenderer.strokeColor = [UIColor blueColor];
    circleRenderer.fillColor = [UIColor redColor];
    
    circleRenderer.alpha = 0.3;
    
    return circleRenderer;
}

#pragma mark - Parse Login/Signup

- (void)login
{
    if (![PFUser currentUser]) {
        PFLogInViewController *loginViewController = [[PFLogInViewController alloc]init];
        
        //make sure you conform to the appropriate delegates for 'self' to be a valid delegate
        loginViewController.delegate = self;
        loginViewController.signUpController.delegate = self;
        
        [self presentViewController:loginViewController animated:YES completion:nil];
        
    } else {
        [self setupAdditionalUI];
    }
}

- (void)setupAdditionalUI
{
    UIBarButtonItem *signOutButton = [[UIBarButtonItem alloc]initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(signOut)];
    
    self.navigationItem.leftBarButtonItem = signOutButton;
}

- (void)signOut
{
    [PFUser logOut];
    [self login];
}

#pragma mark - PFLogInViewControllerDelegate

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}

#pragma mark - PFSignUpViewControllerDelegate

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}

@end
