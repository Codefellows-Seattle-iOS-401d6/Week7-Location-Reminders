//
//  DetailViewController.m
//  locationReminders
//
//  Created by Derek Graham on 7/26/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"

@interface DetailViewController ()



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"TITLE: %@", self.annotationTitle);
    NSLog(@"Location: %f, %f", self.coordinate.latitude, self.coordinate.longitude);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createReminderButtonSelected:(UIButton *)sender {
    
    // get two strings from text fields
    
    NSString *reminderName = @"Test Reminder";
    NSNumber *radius = [NSNumber numberWithFloat:100.0];
    
    Reminder *reminder = [Reminder object];
    
    reminder.name = reminderName;
    reminder.radius = radius;
    
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
    if (self.completion) {
        self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radius.floatValue]);
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                NSLog(@"Succeeded: %i, Error: %@", succeeded,error);
    }];
    //    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
    //        NSLog(@"Succeeded: %i, Error: %@", succeeded,error);
    //    }];
    //    // 1 sucess, 0 failure
    
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
