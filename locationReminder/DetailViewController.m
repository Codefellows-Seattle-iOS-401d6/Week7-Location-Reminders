//
//  DetailViewController.m
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "LocationController.h"

@interface DetailViewController ()

- (IBAction)createReminderButtonSelected:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *reminderText;
@property (weak, nonatomic) IBOutlet UITextField *radiusText;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"TITLE: %@", self.annotationTitle);
    NSLog(@"COORDINATE: %f, %f", self.coordinate.latitude, self.coordinate.longitude);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createReminderButtonSelected:(UIButton *)sender
{
    NSString *reminderName = _reminderText.text;
    NSNumber *radius = [NSNumber numberWithFloat:_radiusText.text.floatValue]; //update 100 to be from text field
    
    Reminder *reminder = [Reminder object];
    
    reminder.name = reminderName;
    reminder.radius = radius;
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
//    if (self.completion)
//    {
//        NSLog(@"Reminder: %@", reminderName);
//        self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
//        [self.navigationController popViewControllerAnimated:YES];
    
    __weak typeof(self) weakSelf = self;
    
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error)
    {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
            NSLog(@"Reminder saved to our Parse Server.");
        
        if (strongSelf.completion)
        {
            if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]])
            {
                CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:strongSelf.coordinate radius:radius.floatValue identifier:reminderName];
                
                [[[LocationController sharedController]locationManager]startMonitoringForRegion:region];
                
                strongSelf.completion([MKCircle circleWithCenterCoordinate:strongSelf.coordinate radius:radius.floatValue]);
                
                [strongSelf.navigationController popViewControllerAnimated:YES];
            }
        }
        }];
 //   }
}
@end
