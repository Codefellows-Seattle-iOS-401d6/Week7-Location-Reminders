//
//  Reminder.m
//  locationReminders
//
//  Created by Jessica Malesh on 7/27/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

@dynamic name;
@dynamic location;
@dynamic radius;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"Reminder"; //keeps class name the same
}

@end
