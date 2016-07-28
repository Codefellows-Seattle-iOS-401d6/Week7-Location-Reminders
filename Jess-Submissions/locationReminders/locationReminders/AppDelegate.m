//
//  AppDelegate.m
//  locationReminders
//
//  Created by Jessica Malesh on 7/25/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //connect app and parse server
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        
        configuration.applicationId = @"appId";
        configuration.clientKey = @"myMasterKey";
        configuration.server = @"https://location-reminders-server12.herokuapp.com/parse";
    }]];
    
    return YES;
}


@end
