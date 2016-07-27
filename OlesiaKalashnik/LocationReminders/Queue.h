//
//  Queue.h
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

-(instancetype)initWithArray:(NSMutableArray *)array;
-(void)enqueue:(NSObject *)item;
-(NSObject *)dequeue;
-(void)print;
-(NSUInteger)length;
@end
