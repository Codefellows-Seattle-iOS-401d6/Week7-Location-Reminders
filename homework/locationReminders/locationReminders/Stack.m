//
//  Stack.m
//  locationReminders
//
//  Created by Sung Kim on 7/25/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (instancetype)init
{
    self = [super init];
    
    if (!self) {
        self = [[Stack alloc]init];
    }
    self.container = [[NSMutableArray alloc]init];
    
    return self;
}

- (void)push:(id)object
{
    [self.container addObject:object];
}

- (id)pop
{
    id object = [self.container objectAtIndex:(self.container.count - 1)];
    [self.container removeLastObject];
    return object;
}

- (void)print
{
    for (id object in self.container) {
        NSLog(@"%@", object);
    }
}

@end
