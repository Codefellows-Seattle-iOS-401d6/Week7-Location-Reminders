//
//  DetailedViewController.m
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

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


@end
