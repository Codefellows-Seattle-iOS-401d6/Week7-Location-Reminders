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

//// tesing stack and queue drop in viewDidLoad
//self.stack = [[NSMutableArray alloc]init];
//self.queue = [[NSMutableArray alloc]init];
//NSNumber *one = [NSNumber numberWithInt:1];
//NSNumber *two = [NSNumber numberWithInt:2];
//NSNumber *three = [NSNumber numberWithInt:3];
//
//[self.stack push: one];
//[self.queue push: one];
//[self.stack push: two];
//[self.queue push: two];
//[self.stack push: three];
//[self.queue push: three];
//
//[self.stack popStack];
//[self.queue popQ];
//
//NSLog(@"stack: %@", self.stack);
//NSLog(@"queue: %@", self.queue);



@end
