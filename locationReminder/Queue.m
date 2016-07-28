//
//  Queue.m
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Queue.h"

@interface Queue()

@property (strong) NSMutableArray *dataAgain;

@end

@implementation Queue

-(instancetype)init
{
    if (self = [super init])
    {
        _dataAgain = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)enqueue:(id)anObject
{
    [self.dataAgain addObject:anObject];
}

-(id)dequeue
{
    id headObject = [self.dataAgain objectAtIndex:0];
    if (headObject != nil)
    {
        [self.dataAgain removeObjectAtIndex:0];
    }
    return headObject;
}

@end
