//
//  DetailViewController.m
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "LocationController.h"

@interface DetailViewController ()
- (IBAction)createReminderButtonSelected:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *radiusFieldInput;
@property (weak, nonatomic) IBOutlet UITextField *nameFieldInput;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // everytime we transition to the detail view controller it will just log
    NSLog(@"Title: %@", self.annotationTitle);
    NSLog(@"Coordinate: %f, %f", self.coordinate.latitude, self.coordinate.longitude);

    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)createReminderButtonSelected:(id)sender
{
    NSString *reminderName = self.nameFieldInput.text;
    NSString *radiusTextField = self.radiusFieldInput.text;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    NSNumber *radius = [numberFormatter numberFromString:radiusTextField];
    
    Reminder *reminder = [Reminder object]; //new instance of Reminder object
    reminder.name = reminderName;
    reminder.radius = radius;
    // TODO
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
        
        __weak typeof(self) weakSelf = self;
        
        [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            NSLog(@"Reminder saved to our Parse server");
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            
            // completion handler
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
