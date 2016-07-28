//
//  AppDelegate.m
//  locationReminders
//
//  Created by Erin Roby on 7/25/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> _Nonnull configuration) {
        configuration.applicationId = @"erin-location-reminders-server";
        configuration.clientKey = @"myMasterKey";
        configuration.server = @"https://erin-location-reminders-server.herokuapp.com/parse";
    }]];
    
    [self registerForNotifications];
    
    return YES;
}

- (void)registerForNotifications {
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    
    [[UIApplication sharedApplication]registerUserNotificationSettings:settings];
}

@end
