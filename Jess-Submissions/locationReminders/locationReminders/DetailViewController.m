//
//  DetailViewController.m
//  locationReminders
//
//  Created by Jess Malesh on 7/26/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Title: %@", self.annotationTitle);
    NSLog(@"Coordinate: %f, %f", self.coordinate.latitude, self.coordinate.longitude);

    [[NSNotificationCenter defaultCenter]postNotificationName:@"TestNotification" object:nil];
}





@end
