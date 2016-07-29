//
//  Reminder.m
//  locationReminders
//
//  Created by Derek Graham on 7/27/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

// dynamic synthesizes getters/setters from superclass
@dynamic name;
@dynamic location;
@dynamic radius;

+(void) load {
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Reminder";
}

@end
