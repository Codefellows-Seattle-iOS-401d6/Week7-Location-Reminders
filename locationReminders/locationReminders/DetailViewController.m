//
//  DetailViewController.m
//  locationReminders
//
//  Created by Derek Graham on 7/26/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "LocationController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *DetailViewLabel;
@property (weak, nonatomic) IBOutlet UITextField *reminderText;

@property (weak, nonatomic) IBOutlet UITextField *reminderRadius;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];

    NSLog(@"TITLE: %@", self.annotationTitle);
    NSLog(@"Location: %f, %f", self.coordinate.latitude, self.coordinate.longitude);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}

- (void) setup{
    _DetailViewLabel.text = [NSString stringWithFormat:@"Latitude: %f, \nLongitude: %f",self.coordinate.latitude, self.coordinate.longitude];
    _reminderText.text = @"Reminder text";
    _reminderRadius.text = @"100.0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createReminderButtonSelected:(UIButton *)sender {
    
    // get two strings from text fields
    

    
    NSString *reminderName = _reminderText.text;

    NSNumber *radius =  [NSNumber numberWithFloat: _reminderRadius.text.floatValue == 0 ? 100.0 : _reminderRadius.text.floatValue];
    
    Reminder *reminder = [Reminder object];
    
    reminder.name = reminderName;
    reminder.radius = radius;
    
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];

    reminder.ACL = [PFACL ACLWithUser:[PFUser currentUser]];

    
    __weak typeof(self) weakSelf = self;
    
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        
        
        NSLog(@"Succeeded: %i, Error: %@", succeeded,error);
        
        if (strongSelf.completion) {
            if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
                CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:strongSelf.coordinate radius:radius.floatValue identifier:reminderName];
                
                [[[LocationController sharedController]locationManager] startMonitoringForRegion:region];
                
                strongSelf.completion([MKCircle circleWithCenterCoordinate:strongSelf.coordinate radius:radius.floatValue]);
                
                [strongSelf.navigationController popViewControllerAnimated:YES];
            }
            
        }
    }];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
