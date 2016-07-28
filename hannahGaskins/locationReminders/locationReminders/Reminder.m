//
//  Reminder.m
//  locationReminders
//
//  Created by hannah gaskins on 7/27/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

// getters and setters from superClass
@dynamic name;
@dynamic location;
@dynamic radius;

+(void)load
{
    [self registerSubclass];
}

+(NSString *)parseClassName
{
    return @"Reminder";
}

@end
