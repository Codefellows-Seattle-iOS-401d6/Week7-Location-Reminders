//
//  Stack.m
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property (strong) NSMutableArray *data;

@end

@implementation Stack

-(id)init
{
    if (self=[super init])
    {
        _data = [[NSMutableArray alloc]init];
        _count = 0;
    }
    return self;
}

-(void)push:(id)anObject
{
    [self.data addObject:anObject];
    _count++;
}

-(id)pop
{
    id obj = nil;
    if ([self.data count] > 0)
    {
        obj = [self.data lastObject];
        [self.data removeLastObject];
        _count = self.data.count;
    }
    return obj;
}

-(void)clear
{
    [self.data removeAllObjects];
    _count = 0;
}

-(id)lastObject
{
    id obj = nil;
    if ([self.data count] > 0)
    {
        obj = [self.data lastObject];
    }
    return obj;
}

@end
