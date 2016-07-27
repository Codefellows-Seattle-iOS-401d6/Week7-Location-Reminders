//
//  DetailViewController.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Title: %@, coordinate: %f %f", self.annotationTitle, self.coordinate.latitude, self.coordinate.longitude);
}


@end
