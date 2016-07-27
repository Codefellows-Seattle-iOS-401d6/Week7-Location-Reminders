//
//  Anagram.m
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Anagram.h"

@implementation Anagram

-(BOOL)locateAnagram: (NSString *) a :(NSString *) b
{
    if (a.length != b.length)
    {
        return NO;
    }
    
    NSCountedSet *aSet = [[NSCountedSet alloc]init];
    NSCountedSet *bSet = [[NSCountedSet alloc]init];
    
    for (int i = 0; i < a.length; i++)
    {
        [aSet addObject:@([a characterAtIndex:i])];
        [bSet addObject:@([b characterAtIndex:i])];
    }
    return [aSet isEqual:bSet];
}

@end
