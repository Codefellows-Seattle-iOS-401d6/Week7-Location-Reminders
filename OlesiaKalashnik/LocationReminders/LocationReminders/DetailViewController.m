//
//  DetailViewController.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *reminderTextField;
@property (weak, nonatomic) IBOutlet UITextField *radiusField;


- (IBAction)createReminderButtonSelected:(UIButton *)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Title: %@, coordinate: %f %f", self.annotationTitle, self.coordinate.latitude, self.coordinate.longitude);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}


- (IBAction)createReminderButtonSelected:(UIButton *)sender {

    NSString *reminderName = self.reminderTextField.text;
    NSString *radiusAsString = [NSString stringWithFormat:@"%@", self.radiusField.text];
    NSNumber *radius = [NSNumber numberWithFloat:[[NSNumberFormatter new]numberFromString:radiusAsString].floatValue];
    Reminder *reminder = [Reminder object];
    reminder.name = reminderName;
    reminder.radius = radius;
    
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    if (self.completion) {
        self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
