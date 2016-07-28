//
//  NumberSum.m
//  locationReminders
//
//  Created by Sung Kim on 7/27/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "NumberSum.h"

@implementation NumberSum

- (instancetype)init
{
    self = [super init];
    
    if (!self) {
        self = [[NumberSum alloc]init];
    }
    
    self.valuesDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:0], @"0", [NSNumber numberWithInt:1], @"1", [NSNumber numberWithInt:2], @"2", [NSNumber numberWithInt:3], @"3", [NSNumber numberWithInt:4], @"4", [NSNumber numberWithInt:5], @"5", [NSNumber numberWithInt:6], @"6", [NSNumber numberWithInt:7], @"7", [NSNumber numberWithInt:8], @"8", [NSNumber numberWithInt:9], @"9", nil];
    return self;
}


- (NSNumber *)returnSum:(NSString *)input
{
    NSNumber *sum = [NSNumber numberWithInt:0];
    if (input.length > 0) {
        for (int i = 0; i < input.length; i++) {
            if ([self.valuesDictionary valueForKey:[input substringWithRange:NSMakeRange(i, 1)]]) {
                sum = [NSNumber numberWithInt:([sum intValue] + [[self.valuesDictionary valueForKey:[input substringWithRange:NSMakeRange(i, 1)]] intValue])];
            }
        }
    } else {
        NSLog(@"The String is Empty");
    }
    NSLog(@"The sum is: %@", sum);
    return sum;
}


@end
