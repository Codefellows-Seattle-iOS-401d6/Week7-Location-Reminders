//
//  Anagram.m
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Anagram.h"

@implementation Anagram

+ (BOOL)anagramCheck:(NSString *)firstWord secondWord:(NSString *)secondWord {
    if ([firstWord length] != [secondWord length] || [firstWord length] == 0 || [secondWord length] == 0) {
        return NO;
    }
    
    NSCountedSet *firstWordSet = [[NSCountedSet alloc] init];
    NSCountedSet *secondWordSet = [[NSCountedSet alloc] init];
    
    for (int i = 0; i < firstWord.length; i++)
    {
        [firstWordSet addObject:@([firstWord characterAtIndex:i])];
        [secondWordSet addObject:@([secondWord characterAtIndex:i])];
    }
    
    return [firstWordSet isEqual:secondWordSet];
    
}


@end
