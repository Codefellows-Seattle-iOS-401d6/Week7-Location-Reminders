//
//  NSMutableArray+Additions.m
//  locationReminders
//
//  Created by hannah gaskins on 7/25/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "NSMutableArray+Additions.h"

@implementation NSMutableArray (Additions)


- (id)popQ
{
    id firstObject = [self firstObject];
    if (firstObject) {
        [self removeObjectAtIndex:0];
        return firstObject;
    } else {
        return nil;
    }
}
- (id)popStack
{
    id lastObject = [self lastObject];
    if (lastObject) {
        [self removeLastObject];
        return lastObject;
    } else {
        return nil;
    }
}
- (void)push:(id)obj
{
    [self addObject:obj];
}



@end
