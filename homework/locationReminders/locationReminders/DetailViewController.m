//
//  DetailViewController.m
//  locationReminders
//
//  Created by Sung Kim on 7/26/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "LocationController.h"

@interface DetailViewController ()

- (IBAction)createReminderButtonSelected:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *radiusField;
@property (weak, nonatomic) IBOutlet UITextField *locationNameField;


@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Title: %@", self.annotationTitle);
    NSLog(@"Coordinates: %f, %f", self.coordinate.latitude, self.coordinate.longitude);
    //posting the notification
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)createReminderButtonSelected:(UIButton *)sender
{
    //these two fields should be changed based on user input text fields --> TODO
    NSString *reminderName = self.locationNameField.text;

    NSNumberFormatter *formatString = [[NSNumberFormatter alloc]init];
    formatString.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *radius = [formatString numberFromString:self.radiusField.text];
    
    //new instance of a reminder object
    Reminder *reminder = [Reminder object];
    
    reminder.name = reminderName;
    reminder.radius = radius;
    
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
    
    //saving a PFObject to parse
    __weak typeof(self) weakSelf = self;
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        NSLog(@"Reminder saved to Parse");
        
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
