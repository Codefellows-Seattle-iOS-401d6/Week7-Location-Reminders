//
//  DetailViewController.m
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"TITLE: %@", self.annotationTitle);
    NSLog(@"COORDINATE: %f, %f", self.coordinate.latitude, self.coordinate.longitude);
    
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

@end
