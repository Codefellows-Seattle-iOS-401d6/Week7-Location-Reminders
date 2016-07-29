//
//  DetailViewController.m
//  locationReminders
//
//  Created by Jess Malesh on 7/26/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "LocationController.h"

@interface DetailViewController ()

- (IBAction)createReminderButtonSelected:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *reminderTextField;

@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Title: %@", self.annotationTitle);
    NSLog(@"Coordinate: %f, %f", self.coordinate.latitude, self.coordinate.longitude);

    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}





- (IBAction)createReminderButtonSelected:(UIButton *)sender
{
    NSString *reminderName = _reminderTextField.text;
    NSNumberFormatter *number = [[NSNumberFormatter alloc]init];
    number.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *radius = [number numberFromString:_radiusTextField.text];
    
    Reminder *reminder = [Reminder object];
    
    reminder.name = reminderName;
    reminder.radius = radius;
    
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
    
    __weak typeof(self) weakSelf = self;
    
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
            
        NSLog(@"Parse object reminder saved to Parse");
            
        if (strongSelf.completion) {
            if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]])
            {
                CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:strongSelf.coordinate radius:radius.floatValue identifier:reminderName];
                
                //errors for edge cases?
                
                [[[LocationController sharedController]locationManager]startMonitoringForRegion:region];
                
                strongSelf.completion([MKCircle circleWithCenterCoordinate:strongSelf.coordinate radius:radius.floatValue]);
                
                [strongSelf.navigationController popViewControllerAnimated:YES];
            };
        }
           
            
    }];
    
    
}



























@end
