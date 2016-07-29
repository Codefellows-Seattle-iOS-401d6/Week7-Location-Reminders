//
//  Reminder.m
//  locationReminders
//
//  Created by Sung Kim on 7/27/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

//dynamic key word dynamically creates the setters and getters from the super class (PFObject in this case), similar to synthesize
@dynamic name;
@dynamic radius;
@dynamic location;

+ (void)load
{
    [self registerSubclass];
    
}

+ (NSString *)parseClassName
{
    return @"Reminder";
}


@end
