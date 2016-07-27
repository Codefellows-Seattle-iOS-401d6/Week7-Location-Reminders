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


//Given a string, return the sum of the digits 0-9 that appear in the string, ignoring all other characters. Return 0 if there are no digits in the string.
-(int)sumDigitsInString {
    int sum = 0;
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\d?+" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSRange range = NSMakeRange(0, [self length]);
    if (error == nil) {
        NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:self options:0 range:range];
        NSMutableArray<NSString *> *results = [[NSMutableArray alloc]initWithCapacity:[self length]];
        for (NSTextCheckingResult *match in matches) {
            NSRange range = [match range];
            [results addObject:[self substringWithRange:range]];
        }
        for (NSString *substring in results) {
            sum += [self convertFromStringToInt:substring];
        }
    }
    else {
        NSLog(@"Invalid regex pattern");
    }
    return sum;
}

- (int)convertFromStringToInt:(NSString *)string {
    NSNumber *number = [[NSNumberFormatter new]numberFromString:string];
    return number.intValue;
}

@end
