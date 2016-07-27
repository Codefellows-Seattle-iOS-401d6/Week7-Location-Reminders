//
//  RemindersPFLoginViewController.m
//  locationReminders
//
//  Created by Derek Graham on 7/27/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "RemindersPFLoginViewController.h"

@interface RemindersPFLoginViewController ()

@end

@implementation RemindersPFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
//    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head.jpg"]];
    
    UILabel *logoView = [[UILabel alloc]init];
    
    logoView.text = @"ArtQuest";
    logoView.textColor = [UIColor whiteColor];
    logoView.adjustsFontSizeToFitWidth = YES;
    [logoView setFont:[UIFont boldSystemFontOfSize:48]];

//    logo.font = [UIFont name:@"Pacifico"];
    
    
    self.logInView.logo = logoView; // logo can be any UIView
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.logInView.logo sizeToFit];
    CGRect logoFrame = self.logInView.logo.frame;
    
    self.logInView.logo.frame = CGRectMake(logoFrame.origin.x, self.logInView.usernameField.frame.origin.y - logoFrame.size.height - 16, self.logInView.frame.size.width, logoFrame.size.height);
    
    /* 
     logInView!.logo!.sizeToFit()
     let logoFrame = logInView!.logo!.frame
     logInView!.logo!.frame = CGRectMake(logoFrame.origin.x, logInView!.usernameField!.frame.origin.y - logoFrame.height - 16, logInView!.frame.width,  logoFrame.height)
     */
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

/*
#pragma mark - Navigation
 // remove the parse Logo
 let logo = UILabel()
 logo.text = "Vay.K"
 logo.textColor = UIColor.whiteColor()
 logo.font = UIFont(name: "Pacifico", size: 70)
 logo.shadowColor = UIColor.lightGrayColor()
 logo.shadowOffset = CGSizeMake(2, 2)
 logInView?.logo = logo

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
