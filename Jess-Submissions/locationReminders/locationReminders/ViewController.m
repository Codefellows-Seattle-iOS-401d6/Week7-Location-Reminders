//
//  ViewController.m
//  locationReminders
//
//  Created by Jessica Malesh on 7/25/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "LocationController.h"
#import "DetailViewController.h"

@import Parse;
@import ParseUI;

@import MapKit;

@interface ViewController ()<MKMapViewDelegate, LocationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *firstLocationButtonSelected;
@property (weak, nonatomic) IBOutlet UIButton *secondLocationButtonSelected;
@property (weak, nonatomic) IBOutlet UIButton *thirdLocationButtonSelected;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
    [self login];
    
    
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[LocationController sharedController]setDelegate:self];
    [[[LocationController sharedController]locationManager]startUpdatingLocation];
    
   
}
//
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver: self name:@"TestNotification" object:nil];
//    
//}

-(void)testObserverFired
{
    NSLog(@"Notification Fired");

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
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 3000.00, 3000.00);
    
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc]init];
    pin2.coordinate = coordinate;
    pin2.title = @"Home Pin";
    [self.mapView addAnnotation: pin2];
    
    //ADDING MORE PINS TO AREA
    
    CLLocationCoordinate2D gardenCoordinate = CLLocationCoordinate2DMake(47.5142502, -122.2670295);
    MKPointAnnotation *gardenPin = [[MKPointAnnotation alloc]init];
    gardenPin.coordinate = gardenCoordinate;
    gardenPin.title = @"Kubota Garden";
    [self.mapView addAnnotation:gardenPin];
    
    
    CLLocationCoordinate2D donutCoordinate = CLLocationCoordinate2DMake(47.520359, -122.269792);
    MKPointAnnotation *donutPin = [[MKPointAnnotation alloc]init];
    donutPin.coordinate = donutCoordinate;
    donutPin.title = @"King Donuts";
    [self.mapView addAnnotation:donutPin];
    
    
    CLLocationCoordinate2D storeCoordinate = CLLocationCoordinate2DMake(47.5206276, -122.270037);
    MKPointAnnotation *storePin = [[MKPointAnnotation alloc]init];
    storePin.coordinate = storeCoordinate;
    storePin.title = @"Safeway";
    [self.mapView addAnnotation:storePin];
    
    CLLocationCoordinate2D highwayCoordinate = CLLocationCoordinate2DMake(47.507797, -122.282606);
    MKPointAnnotation *highwayPin = [[MKPointAnnotation alloc]init];
    highwayPin.coordinate = highwayCoordinate;
    highwayPin.title = @"This is where I get off the highway";
    [self.mapView addAnnotation:highwayPin];

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

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint touchpoint = [sender locationInView:self.mapView];
        
        CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchpoint toCoordinateFromView:self.mapView];
        
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = touchMapCoordinate;
        newPoint.title = @"New Location";
        
        [self.mapView addAnnotation:newPoint];
        
    }
}

- (void)locationControllerDidUpdateLocation:(CLLocation *)location
{
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 500.00, 500.00) animated:YES];
}

#pragma mark - MapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }
    
    annotationView.pinTintColor = [self randomColor];
    annotationView.animatesDrop = YES;
    
    annotationView.canShowCallout = YES;
    
    UIButton *rightCallOutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightCallOutButton;
    
    return annotationView;
    
    }

- (UIColor *)randomColor
{
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];

    return color;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            
            DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
            
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
            
            __weak typeof(self) weakSelf = self;
            
            detailViewController.completion = ^(MKCircle *circle)
            {
                __strong typeof(weakSelf) strongSelf = weakSelf;

                
                [strongSelf.mapView removeAnnotation:annotationView.annotation]; //removes pin
                [strongSelf.mapView addOverlay:circle]; //adds overlay
                
            };
        };
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"DetailViewController" sender:view];
}


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc]initWithOverlay:overlay];
    circleRenderer.strokeColor = [UIColor blueColor];
    circleRenderer.lineWidth = 1.25;
    circleRenderer.fillColor = [UIColor redColor];
    circleRenderer.alpha = 0.25;
    
    return circleRenderer;
}


#pragma mark - Parse Login/SignUp

- (void)login
{
    if (![PFUser currentUser])
    {
        PFLogInViewController *loginViewController = [[PFLogInViewController alloc]init];
        
        loginViewController.delegate = self;
        loginViewController.signUpController.delegate = self;
        
        [self presentViewController:loginViewController animated:YES completion:nil];
    } else
    {
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

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}








@end
