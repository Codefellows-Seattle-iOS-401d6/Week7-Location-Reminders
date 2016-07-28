//
//  Stack.m
//  locationReminders
//
//  Created by Erin Roby on 7/25/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Stack.h"

@implementation Stack

-(instancetype)init{
    if (self = [super init]){
        _stack = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) push:(id)object {
    [_stack addObject:object];
}

-(void) pop {
    [_stack removeLastObject];
}

-(void) print {
    NSLog(@"Stack: %@", _stack);
}

-(NSInteger)count {
    return _stack.count;
}

@end