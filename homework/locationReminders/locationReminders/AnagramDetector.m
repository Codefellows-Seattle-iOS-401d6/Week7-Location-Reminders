//
//  AnagramDetector.m
//  locationReminders
//
//  Created by Sung Kim on 7/26/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "AnagramDetector.h"

@implementation AnagramDetector

- (BOOL)isAnagram:(NSString *)firstString secondString:(NSString *)secondString
{
    if (![firstString length] || ![secondString length]) {
        NSLog(@"You passed in an empty string");
        return NO;
    }
    
    if ([firstString length] == [secondString length]) {
    
        NSMutableArray *allCharactersFirstString = [[NSMutableArray alloc]init];
        NSMutableArray *allCharactersSecondString = [[NSMutableArray alloc]init];
    
        for (int i = 0; i < [firstString length]; i++) {
            NSString *chOne = [firstString substringWithRange:NSMakeRange(i, 1)];
            [allCharactersFirstString addObject:chOne];
            NSString *chTwo = [secondString substringWithRange:NSMakeRange(i, 1)];
            [allCharactersSecondString addObject:chTwo];
        }
        
        for (NSString *ch in allCharactersSecondString) {
            if ([allCharactersFirstString containsObject:ch]) {
                [allCharactersFirstString removeObject:ch];
            }
        }
        
        if (allCharactersFirstString.count == 0) {
            NSLog(@"It's an anagram!");
            return YES;
        } else {
            NSLog(@"It's not an anagram!");
            return NO;
        }
        
    } else {
        NSLog(@"The strings are not the same length");
        return NO;
    }


}

@end
