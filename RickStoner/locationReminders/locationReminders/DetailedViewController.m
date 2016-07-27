//
//  DetailedViewController.m
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "DetailedViewController.h"
#import "Reminder.h"
@import Parse;

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *reminderTextField;
@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;
- (IBAction)saveReminderSelected:(UIButton *)sender;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Title: %@, Coordinate: %f, %f", self.annotationTitle, self.coordinate.latitude, self.coordinate.longitude);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveReminderSelected:(UIButton *)sender {
    NSString *reminderName = self.reminderTextField.text;
    NSNumber *radius = [NSDecimalNumber decimalNumberWithString:self.radiusTextField.text];
    

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
