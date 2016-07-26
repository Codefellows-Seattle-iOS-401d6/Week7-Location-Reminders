//
//  AppDelegate.m
//  locationReminders
//
//  Created by hannah gaskins on 7/25/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        configuration.applicationId = @"appId";
        configuration.clientKey = @"MyMasterKey";
        configuration.server = @"https://hg-location-reminders-server.herokuapp.com/parse";
    }]];
    
    return YES;
}


@end
