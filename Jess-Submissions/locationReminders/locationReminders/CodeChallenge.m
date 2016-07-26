//
//  CodeChallenge.m
//  locationReminders
//
//  Created by Jess Malesh on 7/26/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CodeChallenge : NSObject

@end

@implementation CodeChallenge : NSObject


+ (BOOL) isAnagram:(NSString *)stringOne stringTwo:(NSString *)stringTwo
{
    if (stringOne.length != stringTwo.length)
    {
        return NO;
    }
    
    NSCountedSet *setOne = [[NSCountedSet alloc]init];
    NSCountedSet *setTwo = [[NSCountedSet alloc]init];
    
    for (int i=0; i <= stringOne.length; i++) {
        [setOne addObject:@([stringOne characterAtIndex:i])];
        [setTwo addObject:@([stringTwo characterAtIndex:i])];
    }
    
    if ([setOne isEqual:setTwo]) {
        return YES;
    }
    
    return NO;
}


@end