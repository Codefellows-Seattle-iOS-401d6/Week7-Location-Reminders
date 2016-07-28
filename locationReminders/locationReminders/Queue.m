//
//  Queue.m
//  locationReminders
//
//  Created by Erin Roby on 7/25/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(instancetype)init{
    if (self = [super init]){
        _queue = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) push:(id)object {
    [_queue addObject:object];
}

-(void) pop {
    [_queue removeObjectAtIndex:0];
}

-(void) print {
    NSLog(@"Queue: %@", _queue);
}

-(NSInteger)count {
    return _queue.count;
}

@end
