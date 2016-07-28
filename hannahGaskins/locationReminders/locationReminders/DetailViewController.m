//
//  DetailViewController.m
//  locationReminders
//
//  Created by hannah gaskins on 7/26/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"

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
    NSString *reminderName = @"Test Reminder";
//    NSNumber *radius = [NSNumber numberWithFloat:100.0];
    NSString *radiusTextField = self.radiusFieldInput.text;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    NSNumber *radius = [numberFormatter numberFromString:radiusTextField];
    
    Reminder *reminder = [Reminder object]; //new instance of Reminder object
    reminder.name = reminderName;
    reminder.radius = radius;
    // TODO
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
    
    // completion handler
    if (self.completion) {
        self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
        // ass soon as we create this and our completion gets calls, it will dismiss our VC
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
