//
//  DetailViewController.m
//  locationReminders
//
//  Created by Erin Roby on 7/26/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "locationController.h"
@import MapKit;

@interface DetailViewController()

- (IBAction)createReminderButtonSelected:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *reminderName;
@property (weak, nonatomic) IBOutlet UITextField *meters;

@end

@implementation DetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TITLE: %@", self.annotationTitle);
    NSLog(@"LATLONG: %f, %f", self.coordinate.latitude, self.coordinate.longitude);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}

- (IBAction)createReminderButtonSelected:(id)sender {
    NSString *reminderName = _reminderName.text; // ours will get this from the text fields!
    NSNumber *radius = [NSNumber numberWithFloat:_meters.text.floatValue]; // ours will get this from the text fields!
    
    Reminder *reminder = [Reminder object];
    reminder.name = reminderName;
    reminder.radius = radius;
    
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
    __weak typeof(self) weakSelf = self;
    
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"Reminder Save to our Parse Server.");
       
        if (strongSelf.completion) {
            if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
                CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:strongSelf.coordinate radius:radius.floatValue identifier:reminderName];
                [[[LocationController sharedController]locationManager]startMonitoringForRegion:region];
                strongSelf.completion([MKCircle circleWithCenterCoordinate:strongSelf.coordinate radius:radius.floatValue]);
                [strongSelf.navigationController popViewControllerAnimated:YES];
            }
        }
        
    }];
}

@end
