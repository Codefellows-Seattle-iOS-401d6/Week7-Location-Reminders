//
//  DetailViewController.m
//  locationReminders
//
//  Created by Jess Malesh on 7/26/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"

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
    
    if (self.completion) {
        self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
        
        [self.navigationController popViewControllerAnimated:YES]; 
    }
}



























@end
