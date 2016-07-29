//
//  DetailedViewController.m
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "DetailedViewController.h"
#import "Reminder.h"
#import <math.h>
@import Parse;
#import "LocationController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *reminderTextField;
@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;
- (IBAction)saveReminderSelected:(UIButton *)sender;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveReminderSelected:(UIButton *)sender {
    NSString *reminderName = self.reminderTextField.text;
    NSNumber *radius = [NSDecimalNumber decimalNumberWithString:self.radiusTextField.text];
    
    if (!isnan(radius.floatValue)) {
        NSLog(@"%f", radius.floatValue);
        Reminder *reminder = [Reminder object];
        reminder.name = reminderName;
        reminder.radius = radius;
        
        reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
        
        __weak typeof(self) weakSelf = self;
        [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            NSLog(@"Reminder saved to Parse Server");
            
            if (strongSelf.completion) {
                if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
                    CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:strongSelf.coordinate radius:radius.floatValue identifier:reminderName];
                    [[[LocationController sharedController]locationManager]startMonitoringForRegion:region];
                    strongSelf.completion([MKCircle circleWithCenterCoordinate:strongSelf.coordinate radius:radius.floatValue]);
                    [strongSelf.navigationController popViewControllerAnimated:YES];
                }
            }
        }];
        if (self.completion) {
            self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        self.radiusTextField.text = @"";
        self.radiusTextField.placeholder = @"Error: Input valid number";
    }
    
}
@end
