//
//  ViewController.m
//  locationReminders
//
//  Created by Rick  on 7/25/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "LocationController.h"
#import "DetailedViewController.h"
#import "RandomColor.h"
#import "Anagram.h"
#import "ConvertToNumber.h"
#import "Reminder.h"
@import ParseUI;


@interface ViewController () <MKMapViewDelegate, LocationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)locationOneButtonSelected:(UIButton *)sender;
- (IBAction)locationTwoButtonSelected:(UIButton *)sender;
- (IBAction)locationThreeButtonSelected:(UIButton *)sender;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView setDelegate:self];
    [self parseQuery];
    [self fiveAnnotations];
    [self login];
    self.mapView.mapType = MKMapTypeSatellite;
    [self.mapView setMapType: self.mapView.mapType];
    [self.mapView.layer setCornerRadius:20.0];
    
    // Code Challenge sum of numbers
    NSLog(@"1st Test: %zd, 2nd Test: %zd", [ConvertToNumber sum:@"4 added to 4 is 8, but with eight in here it's sixteen"], [ConvertToNumber sum:@"zero"]);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    [super loadView];
    [[LocationController sharedController]setDelegate:self];
    [[[LocationController sharedController]locationManager]startUpdatingLocation];
}


- (void)parseQuery {
    PFQuery *query = [PFQuery queryWithClassName:@"Reminders"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                for (Reminder *object in objects) {
                    MKPointAnnotation *location = [[MKPointAnnotation alloc]init];
                    location.coordinate = CLLocationCoordinate2DMake(object.location.latitude, object.location.longitude);
                    location.title = object.name;
                    [self.mapView addAnnotation:location];
                }
            }];
        }
    }];
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

- (void)fiveAnnotations {
    MKPointAnnotation *centuryLink = [[MKPointAnnotation alloc]init];
    centuryLink.coordinate = CLLocationCoordinate2DMake(47.5952, -122.3316);
    centuryLink.title = @"Century Link Field";
    MKPointAnnotation *rainier = [[MKPointAnnotation alloc]init];
    rainier.coordinate = CLLocationCoordinate2DMake(46.8523, -121.7603);
    rainier.title = @"Mt. Rainier";
    MKPointAnnotation *pikePlace = [[MKPointAnnotation alloc]init];
    pikePlace.coordinate = CLLocationCoordinate2DMake(47.6101, -122.3421);
    pikePlace.title = @"Pike Place";
    MKPointAnnotation *codeFellows = [[MKPointAnnotation alloc]init];
    codeFellows.coordinate = CLLocationCoordinate2DMake(47.6181, -122.3511);
    codeFellows.title = @"Code Fellows";
    MKPointAnnotation *myHouse = [[MKPointAnnotation alloc]init]; //well, Bill Gates house, but I can dream
    myHouse.coordinate = CLLocationCoordinate2DMake(47.6277, -122.2419);
    myHouse.title = @"My house... ok, it's Bill Gate's";
    NSArray * points = @[centuryLink, rainier, pikePlace, codeFellows, myHouse];
    
    [self.mapView addAnnotations:points];
    
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

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint touchPoint =[sender locationInView:self.mapView];
        CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = touchMapCoordinate;
        newPoint.title = @"New Location";
        
        [self.mapView addAnnotation:newPoint];
    }
}

- (void)locationControllerDelegateDidUpdateLocation:(CLLocation *)location {
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 1000.0, 1000.0) animated:YES];
}

#pragma mark - Mapview Delegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
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
    annotationView.pinTintColor = [RandomColor pinTintColor];
    
    return annotationView;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailedViewController"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            DetailedViewController *detailedViewController = (DetailedViewController *)segue.destinationViewController;
            detailedViewController.annotationTitle = annotationView.annotation.title;
            detailedViewController.coordinate = annotationView.annotation.coordinate;
            
            __weak typeof (self)weakSelf = self;
            detailedViewController.completion = ^(MKCircle *circle){
                __strong typeof(weakSelf)strongSelf = weakSelf;
                [strongSelf.mapView removeAnnotation:annotationView.annotation];
                [strongSelf.mapView addOverlay:circle];
            };
        }
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self performSegueWithIdentifier:@"DetailedViewController" sender:view];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc]initWithOverlay:overlay];
    circleRenderer.strokeColor = [UIColor blackColor];
    circleRenderer.lineWidth = 2.0;
    circleRenderer.fillColor = [UIColor blueColor];
    circleRenderer.alpha = 0.2;
    
    return circleRenderer;
}

#pragma mark - Parse Login/Sign Up

- (void)login {
    if (![PFUser currentUser]) {
        PFLogInViewController *loginViewController = [[PFLogInViewController alloc]init];
        
        loginViewController.delegate = self;
        loginViewController.signUpController.delegate = self;
        [self presentViewController:loginViewController animated:YES completion:nil];
    } else {
        [self setupAdditionalUI];
    }
}

- (void)setupAdditionalUI {
    UIBarButtonItem *signOutButton = [[UIBarButtonItem alloc]initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(signOut)];
    self.navigationItem.leftBarButtonItem = signOutButton;
}

- (void)signOut {
    [PFUser logOut];
    [self login];
}

#pragma Mark - PF Delegate Methods

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}

@end
