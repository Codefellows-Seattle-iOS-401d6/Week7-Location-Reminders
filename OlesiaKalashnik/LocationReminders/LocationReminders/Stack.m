//
//  Stack.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (strong, nonatomic) NSMutableArray *items;
@end

@implementation Stack

-(instancetype)initWithArray:(NSMutableArray *)array {
    self = [super init];
    if (self) {
        _items = array;
    }
    return self;
}

-(NSUInteger)length {
    return self.items.count;
}

-(void)push:(NSObject *)element {
    [[self items]addObject:element];
}

-(NSObject *)pop {
    NSObject *removedItem;
    if ([self length] > 0) {
        removedItem = self.items[[self length]-1];
        [self.items removeLastObject];
    }
    return removedItem;
}

-(void)print {
    NSLog(@"Stack: %@", self.items);
}

@end
