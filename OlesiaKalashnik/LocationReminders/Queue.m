//
//  Queue.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Queue.h"

@interface Queue ()
@property (strong, nonatomic) NSMutableArray *items;

@end
@implementation Queue

-(instancetype)initWithArray:(NSMutableArray *)array {
    self = [super init];
    if (self) {
        _items = array;
    }
    return self;
}

-(void)enqueue:(NSObject *)item {
    [self.items addObject:item];
}
-(NSObject *)dequeue {
    NSObject *dequeuedItem;
    if ([self length] > 0) {
        dequeuedItem = [self.items firstObject];
        [self.items removeObject:dequeuedItem];
    }
    return dequeuedItem;

}
-(void)print {
    NSLog(@"Queue: %@", self.items);
}
-(NSUInteger)length {
    return [self.items count];
}
@end
