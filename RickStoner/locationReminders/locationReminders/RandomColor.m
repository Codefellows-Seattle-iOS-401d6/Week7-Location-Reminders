//
//  RandomColor.m
//  locationReminders
//
//  Created by Rick  on 7/26/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "RandomColor.h"

@implementation RandomColor

+ (UIColor *)pinTintColor {
    CGFloat red = (arc4random() % 256) /256.0;
    CGFloat blue = (arc4random() % 256) /256.0;
    CGFloat green = (arc4random() % 256) /256.0;
    
    UIColor *pinTintColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    return pinTintColor;
}

@end
