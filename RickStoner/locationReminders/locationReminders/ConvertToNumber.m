//
//  ConvertToNumber.m
//  locationReminders
//
//  Created by Rick  on 7/27/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "ConvertToNumber.h"

@implementation ConvertToNumber

+ (NSString *)stringOfOnlyNumbers:(NSString *)stringInput {
    {
        NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        return [[stringInput componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@""];
    }
}

+ (int)sum:(NSString *)stringInput {
    NSString *numberString = [self stringOfOnlyNumbers:stringInput];
    int sum = 0;
    for (int i=0; i < numberString.length; i++) {
        NSString *ch = [numberString substringWithRange:NSMakeRange(i, 1)];
        sum += ch.intValue;
    }
    return sum;
}


@end
