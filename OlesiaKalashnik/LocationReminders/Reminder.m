//
//  Reminder.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/27/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

@dynamic name;  //"dynamic" : getters and setters will be taken from superclass (fron PFObject in this case)
@dynamic radius;
@dynamic location;

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return @"Reminder";
}
@end
