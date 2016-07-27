//
//  ViewController.m
//  locationReminders
//
//  Created by Derek Graham on 7/25/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "ViewController.h"
#import "LocationController.h"
#import "DetailViewController.h"
#import <Parse/Parse.h>
@import MapKit;

@interface ViewController () <MKMapViewDelegate, LocationControllerDelegate>

@property(strong, nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;



- (IBAction)firstLocationButtonPressed:(id)sender;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    
//    testObject[@"foo" ] = @"bar";
//    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"Succeeded: %i, Error: %@", succeeded,error);
//    }];
//    // 1 sucess, 0 failure
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        if (!error){
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"Objects: %@ ", objects);
//            }];
//        }
//    }];
    
    [self setup];
    [self.mapView.layer setCornerRadius: 5.0];
    self.mapView.showsUserLocation = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[LocationController sharedController] setDelegate:self];
    
    [[[LocationController sharedController]locationManager]startUpdatingLocation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return min + arc4random_uniform((uint32_t)(max - min + 1));
}
- (void) setup {
    NSMutableArray *annotationList = [[NSMutableArray alloc] init];
    NSArray *dataArray = @[ @{@"Title" : @"Adjacent, Against, Upon",
                              @"Subtitle" : @"Myrtle Edwards Park",
                              @"latitude" : @47.6198243 ,
                              @"longitude" : @-122.3616879
                              },
                            @{@"Title" : @"Fremont Troll",
                              @"Subtitle" : @"Center of the Universe",
                              @"latitude" : @47.6510 ,
                              @"longitude" : @-122.3473
                              },
                            @{@"Title" : @"Code Fellows",
                              @"Subtitle" : @"",
                              @"latitude" : @47.618217 ,
                              @"longitude" : @-122.3540207
                              },
                            @{@"Title" : @"Discovery Park",
                              @"Subtitle" : @"",
                              @"latitude" : @47.6555966 ,
                              @"longitude" : @-122.4125337
                              },
                            @{@"Title" : @"Hualalai",
                              @"Subtitle" : @"Hawaii",
                              @"latitude" : @19.8285206 ,
                              @"longitude" : @-155.9925522
                              }
                            ];
    
    for (id dict in dataArray) {
        NSNumber *latitude, *longitude;
        NSString *title, *subtitle;
        if ( dict[@"latitude"] != nil){
            latitude = dict[@"latitude"];
        } else {
            latitude = 0;
        }
        if ( dict[@"longitude"] != nil){
            longitude = dict[@"longitude"];
        } else {
            longitude = 0;
        }
        if ( dict[@"Title"] != nil){
            title = dict[@"Title"];
        } else {
            title = @"Empty Title";
        }
        if ( dict[@"Subtitle"] != nil){
            subtitle = dict[@"Subtitle"];
        } else {
            subtitle = @"Empty subtitle";
        }
        
        
        
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake( latitude.doubleValue, longitude.doubleValue);
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 50.0, 50.0);
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = coordinate;
        point.title = title;
        point.subtitle = subtitle;
        
        
        [annotationList addObject:point];
//        [self.mapView addAnnotation:point];
//        [self.mapView selectAnnotation:point animated:YES];
    }
    
    [self.mapView addAnnotations:annotationList ];

}

- (MKAnnotationView *)colorizeAnnotationView: (MKAnnotationView *)annotationView {
    if ([annotationView isKindOfClass:[MKUserLocation class]]){ NSLog(@"UserLocation");return nil; }
    
    
    MKPinAnnotationView *annotationPin = (MKPinAnnotationView *)annotationView;
//    if(!annotationPin) {
//        annotationPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotationView.annotation reuseIdentifier:@"annotationView"];
//    }
    
    NSInteger colorChoice = [self randomNumberBetween:1 maxNumber:5];
    
    NSLog(@"Pin Color: %i", colorChoice);
    switch (colorChoice) {
        case 1:
            annotationPin.pinTintColor = [UIColor purpleColor];

            break;
        case 2:
            annotationPin.pinTintColor = [UIColor greenColor];
            break;
        case 3:
            annotationPin.pinTintColor = [UIColor orangeColor];
            break;
        case 4:
            annotationPin.pinTintColor = [UIColor blackColor];
            break;
        case 5:
            annotationPin.pinTintColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    

    return (MKAnnotationView *)annotationPin;

}

- (IBAction)firstLocationButtonPressed:(id)sender {


    for (MKPointAnnotation *annotation in self.mapView.annotations)
    {
        [self colorizeAnnotationView: [self.mapView viewForAnnotation:annotation]];
    }
 }
- (IBAction)leftLocationButtonPressed:(id)sender {
    self.mapView.showsUserLocation = NO;

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake( 19.8285206, -155.9925522 );
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 200.0, 200.0);
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Hualalai";
    point.subtitle = @"Excellent Breakfast Buffet";

    [self.mapView setMapType:MKMapTypeSatellite];
    [self.mapView setRegion:region animated: YES];
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:YES];


}
- (IBAction)rightLocationButtonPressed:(id)sender {
    self.mapView.showsUserLocation = NO;

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6510, -122.3473);
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Fremont Troll";
    point.subtitle = @"near the center of the universe.";
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 100.0, 100.0);
    [self.mapView setMapType:MKMapTypeStandard];

    [self.mapView setRegion:region animated: YES];
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:YES];


}
- (IBAction)locateButtonPressed:(id)sender {
    self.mapView.showsUserLocation = NO;
    [self.mapView showAnnotations:self.mapView.annotations animated:YES];

    NSLog(@"locate Button");
}


- (IBAction)handle_longpress:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan){
        CGPoint touchPoint = [sender locationInView:self.mapView];
        
        CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = touchMapCoordinate;
        
        newPoint.title = @"New Location";
        
        [self.mapView addAnnotation:newPoint];
        [self.mapView selectAnnotation:newPoint animated:YES];

    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
//    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = userLocation.coordinate;
//    point.title = @"Derek Graham";
//    [self.mapView addAnnotation:point];
//
//    [self.mapView selectAnnotation:point animated:YES];

}

- (void)locationControllerDidUpdateLocation:(CLLocation *)location{
//    NSLog(@"update location callback");
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 350.0, 350.0) animated:YES];
}

#pragma mark - MapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]){ return nil; }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (!annotationView){
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }
    annotationView.canShowCallout = YES;
    
    UIButton *rightCallOutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightCallOutButton;
    return annotationView;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            
            DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
            
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
            
        }
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    [self performSegueWithIdentifier:@"DetailViewController" sender:view];
}
@end















