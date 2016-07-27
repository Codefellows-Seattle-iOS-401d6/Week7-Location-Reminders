//
//  NSString+StringExtension.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "NSString+StringExtension.h"


@implementation NSString (StringExtension)
-(BOOL)isAnagramWith:(NSString *)string {
    
    NSMutableString *string1 = [self mutableCopy];
    NSMutableString *string2 = [string mutableCopy];
    
    NSUInteger length1 = string1.length;
    NSUInteger length2 = string2.length;
    
    NSUInteger index1 = 0;
    if (length1 == length2) {
        
        while (index1 < length1) {
            NSString *substring = [string1 substringToIndex:1];
            if ([string2 containsString: substring]) {
                [string2 deleteCharactersInRange:[string2 rangeOfString:substring]];
                [string1 deleteCharactersInRange:[string1 rangeOfString:substring]];
                index1++;
            } else {
                return NO;
            }
        }
    } else {
        return NO;
    }
    return YES;
}

//With quicksort
-(BOOL)areAnagrams:(NSString *)string {
    NSMutableArray *array1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.length; i ++) {
        [array1 addObject:[NSString stringWithFormat:@"%c", [self characterAtIndex:i]]];
    }
    
    NSMutableArray *array2 = [[NSMutableArray alloc] init];
    for (int i = 0; i < string.length; i ++) {
        [array2 addObject:[NSString stringWithFormat:@"%c", [string characterAtIndex:i]]];
    }

    return [[self quickSort:array1] isEqualToArray:[self quickSort:array2]];
}


-(NSMutableArray *)quickSort:(NSMutableArray *)arrayFromString {
    
    if (arrayFromString.count < 2) {
        return arrayFromString;
    }

    NSMutableArray *pivot = [NSMutableArray arrayWithObject:[arrayFromString objectAtIndex:0]];
    NSMutableArray *bigger = [[NSMutableArray alloc]init];
    NSMutableArray *smaller = [[NSMutableArray alloc]init];
    NSMutableArray *equal = [[NSMutableArray alloc]init];

    for (NSString *character in arrayFromString) {
        if ([character compare:[pivot firstObject]] == NSOrderedAscending) {
            [smaller addObject:character];
        }
    }
    for (NSString *character in arrayFromString) {
        if ( [character compare:[pivot firstObject]] == NSOrderedSame) {
            [equal addObject:character];
        }
    }
    for (NSString *character in arrayFromString) {
        if ([character compare:[pivot firstObject]] == NSOrderedDescending) {
            [bigger addObject:character];
        }
    }
    
    return [NSMutableArray arrayWithArray:[[self quickSort:smaller] arrayByAddingObjectsFromArray:[equal arrayByAddingObjectsFromArray:[self quickSort:bigger]]]];
}



@end
