//
//  StringSum.m
//  locationReminder
//
//  Created by Sean Champagne on 7/27/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "StringSum.h"

@implementation StringSum

+(NSNumber *)numberSumFromText:(NSString *)text
{
    NSCharacterSet *nonDigit = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    int sum = 0;
    NSString *numberString = [[text componentsSeparatedByCharactersInSet:nonDigit]componentsJoinedByString:@""];
    while (numberString != nil)
    {
        int value = [numberString intValue];
        sum += value;
    }
    
    return [NSNumber numberWithInt:sum];
}

@end
