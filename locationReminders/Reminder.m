//
//  Reminder.m
//  locationReminders
//
//  Created by Erin Roby on 7/27/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

@dynamic name;
@dynamic location;
@dynamic radius; // difference between dynamic and sythnesize. getters and setters up the heirarchy here.

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName { // private methods not defined publically in the header.
    return @"Reminder";
}



// write query method to get all reminders here?
//    Reminder *reminder = [Reminder object];

//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"]; // you can assign predicates to these.
//    [query findObjectsInBackgroundWithBlock:^(NSArray *_Nullable objects, NSError * _Nullable error) {
//        if (!error) {
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"Objects: %@", objects);
//            }];
//        }
//    }];
//- (void)setDefaultAnnotations {
//    NSDictionary *pointOne = @{@"title": @"Pratt Fine Arts Center", @"lat": @47.600157, @"long": @-122.3095426 };
//    NSDictionary *pointTwo = @{@"title": @"New York Fashion Academy", @"lat": @47.6654651, @"long": @-122.3845994 };
//    NSDictionary *pointThree = @{@"title": @"Zayda Buddy's", @"lat": @47.6668826, @"long": @-122.3849107 };
//    NSDictionary *pointFour = @{@"title": @"Olympic Sculpture Park", @"lat": @47.6165162, @"long": @-122.3576973 };
//    NSDictionary *pointFive = @{@"title": @"Benaroya Hall", @"lat": @47.6080878, @"long": @-122.339159 };
//    
//    NSArray *defaultPointers;
//    defaultPointers = [NSArray arrayWithObjects: pointOne, pointTwo, pointThree, pointFour, pointFive, nil];
//    
//    for (id pointer in defaultPointers) {
//        
//        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
//        CLLocationCoordinate2D newPointCoordinates = CLLocationCoordinate2DMake([pointer[@"lat"] doubleValue], [pointer[@"long"] doubleValue]);
//        newPoint.coordinate = newPointCoordinates;
//        newPoint.title = pointer[@"title"];
//        [self.mapView addAnnotation:newPoint];
//    }
//}

@end
