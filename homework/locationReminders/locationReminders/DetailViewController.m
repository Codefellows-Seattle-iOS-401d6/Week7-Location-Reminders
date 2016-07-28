//
//  DetailViewController.m
//  locationReminders
//
//  Created by Sung Kim on 7/26/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"

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
    
    if (self.completion) {
        self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
